
#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <unistd.h>
#include <fcntl.h>

#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

#define FRAME_ADDR 0x38000000
#define FRAME_SPAN 0x500000
#define FRAME_SIZE 2592*1944

#define SERVER_PORT 4444

void* frame_base;





/******************  RING BUFFER ************************/


#define SIZE_RINGBUFFER 4

struct RINGBUFFER;


typedef struct RINGBUFFER
{
  void *pBuffer[SIZE_RINGBUFFER];
  unsigned int indexInsert;
  unsigned int indexRemove;
  unsigned int count;
  pthread_mutex_t mutex;
  sem_t semEmpty;
  sem_t semFull;

  void (*f_addBuffer)(struct RINGBUFFER *ringBuffer, void *buffer);
  void (*f_getBuffer)(struct RINGBUFFER *ringBuffer, void **buffer);
} T_RINGBUFFER;


void addBuffer(T_RINGBUFFER *ringBuffer, void *buffer)
{
  sem_wait(&(ringBuffer->semFull));
  pthread_mutex_lock(&(ringBuffer->mutex));
  if (ringBuffer->count < SIZE_RINGBUFFER)
    {
      ringBuffer->pBuffer[ringBuffer->indexInsert] = buffer;
      if (++(ringBuffer->indexInsert) >= SIZE_RINGBUFFER)
	{
	  ringBuffer->indexInsert = 0;
	}
      ringBuffer->count++;
    }
  //printf("added buffer %x at position %d. New count: %d\n", (unsigned int)buffer, ringBuffer->indexInsert, ringBuffer->count);
  pthread_mutex_unlock(&(ringBuffer->mutex));
  sem_post(&(ringBuffer->semEmpty));
}


void getBuffer(T_RINGBUFFER *ringBuffer, void **buffer)
{
  sem_wait(&(ringBuffer->semEmpty));
  pthread_mutex_lock(&(ringBuffer->mutex));
  if (ringBuffer->count > 0)
    {
      *buffer = ringBuffer->pBuffer[ringBuffer->indexRemove];
      if (++(ringBuffer->indexRemove) >= SIZE_RINGBUFFER)
	{
	  ringBuffer->indexRemove = 0;
	}
      ringBuffer->count--;
    }
  //printf("retrieved buffer %x from position %d. New count: %d\n", (unsigned int)*buffer, ringBuffer->indexRemove, ringBuffer->count);
  pthread_mutex_unlock(&(ringBuffer->mutex));
  sem_post(&(ringBuffer->semFull));
}

void initRingBuffer(T_RINGBUFFER *ringBuffer)
{
  ringBuffer->count = 0;
  ringBuffer->indexInsert = 0;
  ringBuffer->indexRemove = 0;
  ringBuffer->f_addBuffer = addBuffer;
  ringBuffer->f_getBuffer = getBuffer;
  sem_init(&(ringBuffer->semFull), 0, SIZE_RINGBUFFER);
  sem_init(&(ringBuffer->semEmpty), 0, 0);
  pthread_mutex_init(&(ringBuffer->mutex), NULL);
}


/**********************  end ring buffer *********************************/



/************************Global Variables*****************************/
int fd;
void *fd_mem;
void *frame_base;
T_RINGBUFFER ringBufferIdle;
T_RINGBUFFER ringBufferImagesToNet;
void *buffers[SIZE_RINGBUFFER];
int errOk;

struct hostent *hp;
struct sockaddr_in socket_in;
int int_socket;





void initSocket(char* ip)
{
  //printf("Iniciando conexao %s\n", ip);
  hp = gethostbyname(ip);
  if (!hp) {
    //printf(stderr, "socket: unknown host: %s\n", ip);
    exit(1);
  }
  //printf("Host ok\n"); 
  /* build address data structure */
  bzero((char *)&socket_in, sizeof(socket_in));
  socket_in.sin_family = AF_INET;
  bcopy(hp->h_addr, (char *)&socket_in.sin_addr, hp->h_length);
  socket_in.sin_port = htons(SERVER_PORT);
  /* active open */
  if ((int_socket = socket(PF_INET, SOCK_STREAM, 0)) < 0) {
    perror("socket: socket error");
    exit(1);
  }
  //printf("SOCKET ok\n");
  if (connect(int_socket, (struct sockaddr *)&socket_in, sizeof(socket_in)) < 0)
    {
      perror("socket: connect error");
      close(int_socket);
      exit(1);
    }
  //printf("Connection ok\n");

  
  
  
}





void f_bufferProducer()
{
  void *imgBuffer;

  while (errOk)
    {
      ringBufferIdle.f_getBuffer(&ringBufferIdle, &imgBuffer);
      //printf("P: buffer %x retrieved from idle ring\n", (unsigned int)imgBuffer);
      memcpy(imgBuffer, frame_base, FRAME_SIZE);
      ringBufferImagesToNet.f_addBuffer(&ringBufferImagesToNet, imgBuffer);
      //printf("P: buffer %x added to net ring\n", (unsigned int)imgBuffer);
    }
}


void f_bufferConsumer()
{
  void *netBuffer;

  while(errOk)
    {
      ringBufferImagesToNet.f_getBuffer(&ringBufferImagesToNet, &netBuffer);
      //////printf("C: buffer %x retrieved from net ring\n", (unsigned int)netBuffer);
      if (send(int_socket, netBuffer, FRAME_SIZE, 0) < 0)
	{
	  printf("error sending data ...\n");
	  errOk = 0;
	}
      else
	{
	  //printf("image sent\n");
	  ringBufferIdle.f_addBuffer(&ringBufferIdle, netBuffer);
	}
      //////printf("C: buffer %x returned to idle ring\n", (unsigned int)netBuffer);
    }
}

void init()
{
  int it;
  
  fd = open("/dev/mem", (O_RDWR|O_SYNC));
  fd_mem = (void *) malloc(2592*1944*sizeof(char));			  
  frame_base = mmap(NULL,FRAME_SPAN,(PROT_READ|PROT_WRITE),MAP_SHARED,fd,FRAME_ADDR);
  ////printf("outside memory mapped\n");
  initRingBuffer(&ringBufferIdle);
  ////printf("created idle ring buffer\n");
  initRingBuffer(&ringBufferImagesToNet);
  ////printf("created net ring buffer\n");

  errOk = 1;
  
  for (it=0; it<SIZE_RINGBUFFER; ++it)
    {
      buffers[it] = (void *) malloc(FRAME_SIZE*sizeof(char));
      ////printf("memory allocated for buffer %d\n", it);
      ringBufferIdle.f_addBuffer(&ringBufferIdle, buffers[it]);
      ////printf ("buffer added to ring iddle\n");
    }
}


void terminate()
{
  int it;
  for (it=0; it<SIZE_RINGBUFFER; ++it)
    {
      free(buffers[it]);
    }
   close(int_socket);
}  

			  
int main(int argc, char* argv[])
{
  init();
  initSocket(argv[1]);
  pthread_t bufferProducer, bufferConsumer;
  int err;


  err = pthread_create(&bufferProducer, NULL, f_bufferProducer, NULL);
  if (err)
  {
    ////printf(stderr,"Error - pthread_create() return code: %d\n",err);
    exit(EXIT_FAILURE);
  }

 err = pthread_create(&bufferConsumer, NULL, f_bufferConsumer, NULL);
if (err)
  {
    ////printf(stderr,"Error - pthread_create() return code: %d\n",err);
    exit(EXIT_FAILURE);
  }

 pthread_join(bufferProducer, NULL);
 pthread_join(bufferConsumer, NULL);

 terminate();
}



