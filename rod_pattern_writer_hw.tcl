# TCL File Generated by Component Editor 16.0
# Thu Nov 17 15:44:40 BRT 2016
# DO NOT MODIFY


# 
# rod_pattern_writer "rod_pattern_writer" v1.0
#  2016.11.17.15:44:40
# 
# 

# 
# request TCL package from ACDS 16.0
# 
package require -exact qsys 16.0


# 
# module rod_pattern_writer
# 
set_module_property DESCRIPTION ""
set_module_property NAME rod_pattern_writer
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME rod_pattern_writer
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL avalon_mm_master_writer
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file avalon_mm_master_writer.vhd VHDL PATH src/avalon_mm_master_writer.vhd TOP_LEVEL_FILE


# 
# parameters
# 
add_parameter ADDR_W INTEGER 32
set_parameter_property ADDR_W DEFAULT_VALUE 32
set_parameter_property ADDR_W DISPLAY_NAME ADDR_W
set_parameter_property ADDR_W TYPE INTEGER
set_parameter_property ADDR_W UNITS None
set_parameter_property ADDR_W HDL_PARAMETER true
add_parameter DATA_W INTEGER 32
set_parameter_property DATA_W DEFAULT_VALUE 32
set_parameter_property DATA_W DISPLAY_NAME DATA_W
set_parameter_property DATA_W TYPE INTEGER
set_parameter_property DATA_W UNITS None
set_parameter_property DATA_W HDL_PARAMETER true
add_parameter BURST_W INTEGER 8
set_parameter_property BURST_W DEFAULT_VALUE 8
set_parameter_property BURST_W DISPLAY_NAME BURST_W
set_parameter_property BURST_W TYPE INTEGER
set_parameter_property BURST_W UNITS None
set_parameter_property BURST_W HDL_PARAMETER true
add_parameter BURST INTEGER 8
set_parameter_property BURST DEFAULT_VALUE 8
set_parameter_property BURST DISPLAY_NAME BURST
set_parameter_property BURST TYPE INTEGER
set_parameter_property BURST UNITS None
set_parameter_property BURST HDL_PARAMETER true
add_parameter BYTE_EN_W INTEGER 4
set_parameter_property BYTE_EN_W DEFAULT_VALUE 4
set_parameter_property BYTE_EN_W DISPLAY_NAME BYTE_EN_W
set_parameter_property BYTE_EN_W TYPE INTEGER
set_parameter_property BYTE_EN_W UNITS None
set_parameter_property BYTE_EN_W HDL_PARAMETER true


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
# connection point reset_sink
# 
add_interface reset_sink reset end
set_interface_property reset_sink associatedClock clock
set_interface_property reset_sink synchronousEdges DEASSERT
set_interface_property reset_sink ENABLED true
set_interface_property reset_sink EXPORT_OF ""
set_interface_property reset_sink PORT_NAME_MAP ""
set_interface_property reset_sink CMSIS_SVD_VARIABLES ""
set_interface_property reset_sink SVD_ADDRESS_GROUP ""

add_interface_port reset_sink rst reset Input 1


# 
# connection point avalon_master
# 
add_interface avalon_master avalon start
set_interface_property avalon_master addressUnits SYMBOLS
set_interface_property avalon_master associatedClock clock
set_interface_property avalon_master associatedReset reset_sink
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

add_interface_port avalon_master waitrequest waitrequest Input 1
add_interface_port avalon_master address address Output addr_w
add_interface_port avalon_master write write Output 1
add_interface_port avalon_master writedata writedata Output data_w
add_interface_port avalon_master burstcount burstcount Output burst_w
add_interface_port avalon_master byteenable byteenable Output byte_en_w

