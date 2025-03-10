# TCL File Generated by Component Editor 16.0
# Sat Feb 25 13:36:06 BRT 2017
# DO NOT MODIFY


# 
# pattern_writer "pattern writer" v1.0
#  2017.02.25.13:36:06
# 
# 

# 
# request TCL package from ACDS 16.0
# 
package require -exact qsys 16.0


# 
# module pattern_writer
# 
set_module_property DESCRIPTION ""
set_module_property NAME pattern_writer
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME "pattern writer"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL pattern_writer
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file pattern_writer.v VERILOG PATH src/pattern_writer.v TOP_LEVEL_FILE


# 
# parameters
# 
add_parameter ADDRESS_WIDTH INTEGER 32
set_parameter_property ADDRESS_WIDTH DEFAULT_VALUE 32
set_parameter_property ADDRESS_WIDTH DISPLAY_NAME ADDRESS_WIDTH
set_parameter_property ADDRESS_WIDTH TYPE INTEGER
set_parameter_property ADDRESS_WIDTH UNITS None
set_parameter_property ADDRESS_WIDTH HDL_PARAMETER true
add_parameter LENGTH_WIDTH INTEGER 32
set_parameter_property LENGTH_WIDTH DEFAULT_VALUE 32
set_parameter_property LENGTH_WIDTH DISPLAY_NAME LENGTH_WIDTH
set_parameter_property LENGTH_WIDTH TYPE INTEGER
set_parameter_property LENGTH_WIDTH UNITS None
set_parameter_property LENGTH_WIDTH HDL_PARAMETER true
add_parameter DATA_WIDTH INTEGER 32
set_parameter_property DATA_WIDTH DEFAULT_VALUE 32
set_parameter_property DATA_WIDTH DISPLAY_NAME DATA_WIDTH
set_parameter_property DATA_WIDTH TYPE INTEGER
set_parameter_property DATA_WIDTH UNITS None
set_parameter_property DATA_WIDTH HDL_PARAMETER true
add_parameter BYTE_ENABLE_WIDTH INTEGER 4
set_parameter_property BYTE_ENABLE_WIDTH DEFAULT_VALUE 4
set_parameter_property BYTE_ENABLE_WIDTH DISPLAY_NAME BYTE_ENABLE_WIDTH
set_parameter_property BYTE_ENABLE_WIDTH TYPE INTEGER
set_parameter_property BYTE_ENABLE_WIDTH UNITS None
set_parameter_property BYTE_ENABLE_WIDTH HDL_PARAMETER true
add_parameter BYTE_ENABLE_WIDTH_LOG2 INTEGER 2
set_parameter_property BYTE_ENABLE_WIDTH_LOG2 DEFAULT_VALUE 2
set_parameter_property BYTE_ENABLE_WIDTH_LOG2 DISPLAY_NAME BYTE_ENABLE_WIDTH_LOG2
set_parameter_property BYTE_ENABLE_WIDTH_LOG2 TYPE INTEGER
set_parameter_property BYTE_ENABLE_WIDTH_LOG2 UNITS None
set_parameter_property BYTE_ENABLE_WIDTH_LOG2 HDL_PARAMETER true
add_parameter BURST_COUNT INTEGER 8 ""
set_parameter_property BURST_COUNT DEFAULT_VALUE 8
set_parameter_property BURST_COUNT DISPLAY_NAME BURST_COUNT
set_parameter_property BURST_COUNT TYPE INTEGER
set_parameter_property BURST_COUNT UNITS None
set_parameter_property BURST_COUNT ALLOWED_RANGES -2147483648:2147483647
set_parameter_property BURST_COUNT DESCRIPTION ""
set_parameter_property BURST_COUNT HDL_PARAMETER true
add_parameter BURST_WIDTH INTEGER 4 ""
set_parameter_property BURST_WIDTH DEFAULT_VALUE 4
set_parameter_property BURST_WIDTH DISPLAY_NAME BURST_WIDTH
set_parameter_property BURST_WIDTH TYPE INTEGER
set_parameter_property BURST_WIDTH UNITS None
set_parameter_property BURST_WIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property BURST_WIDTH DESCRIPTION ""
set_parameter_property BURST_WIDTH HDL_PARAMETER true


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset reset Input 1


# 
# connection point avalon_master
# 
add_interface avalon_master avalon start
set_interface_property avalon_master addressUnits SYMBOLS
set_interface_property avalon_master associatedClock clock
set_interface_property avalon_master associatedReset reset
set_interface_property avalon_master bitsPerSymbol 8
set_interface_property avalon_master burstOnBurstBoundariesOnly false
set_interface_property avalon_master burstcountUnits WORDS
set_interface_property avalon_master doStreamReads false
set_interface_property avalon_master doStreamWrites false
set_interface_property avalon_master holdTime 0
set_interface_property avalon_master linewrapBursts false
set_interface_property avalon_master maximumPendingReadTransactions 0
set_interface_property avalon_master maximumPendingWriteTransactions 0
set_interface_property avalon_master readLatency 0
set_interface_property avalon_master readWaitTime 1
set_interface_property avalon_master setupTime 0
set_interface_property avalon_master timingUnits Cycles
set_interface_property avalon_master writeWaitTime 0
set_interface_property avalon_master ENABLED true
set_interface_property avalon_master EXPORT_OF ""
set_interface_property avalon_master PORT_NAME_MAP ""
set_interface_property avalon_master CMSIS_SVD_VARIABLES ""
set_interface_property avalon_master SVD_ADDRESS_GROUP ""

add_interface_port avalon_master master_address address Output ADDRESS_WIDTH
add_interface_port avalon_master master_write write Output 1
add_interface_port avalon_master master_writedata writedata Output DATA_WIDTH
add_interface_port avalon_master master_burstcount burstcount Output BURST_WIDTH
add_interface_port avalon_master master_byteenable byteenable Output BYTE_ENABLE_WIDTH
add_interface_port avalon_master master_waitrequest waitrequest Input 1

