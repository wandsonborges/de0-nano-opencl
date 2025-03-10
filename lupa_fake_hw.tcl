# TCL File Generated by Component Editor 16.1
# Tue Mar 14 18:05:21 BRT 2017
# DO NOT MODIFY


# 
# lupa_fake "lupa_fake" v1.0
#  2017.03.14.18:05:21
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module lupa_fake
# 
set_module_property DESCRIPTION ""
set_module_property NAME lupa_fake
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME lupa_fake
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL lupa_fake
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file lupa_fake.vhd VHDL PATH src/lupa_fake.vhd TOP_LEVEL_FILE


# 
# parameters
# 
add_parameter ROWS INTEGER 480
set_parameter_property ROWS DEFAULT_VALUE 480
set_parameter_property ROWS DISPLAY_NAME ROWS
set_parameter_property ROWS TYPE INTEGER
set_parameter_property ROWS UNITS None
set_parameter_property ROWS ALLOWED_RANGES -2147483648:2147483647
set_parameter_property ROWS HDL_PARAMETER true
add_parameter COLS INTEGER 640
set_parameter_property COLS DEFAULT_VALUE 640
set_parameter_property COLS DISPLAY_NAME COLS
set_parameter_property COLS TYPE INTEGER
set_parameter_property COLS UNITS None
set_parameter_property COLS ALLOWED_RANGES -2147483648:2147483647
set_parameter_property COLS HDL_PARAMETER true
add_parameter FOT INTEGER 1200
set_parameter_property FOT DEFAULT_VALUE 1200
set_parameter_property FOT DISPLAY_NAME FOT
set_parameter_property FOT TYPE INTEGER
set_parameter_property FOT UNITS None
set_parameter_property FOT ALLOWED_RANGES -2147483648:2147483647
set_parameter_property FOT HDL_PARAMETER true
add_parameter ROT INTEGER 48
set_parameter_property ROT DEFAULT_VALUE 48
set_parameter_property ROT DISPLAY_NAME ROT
set_parameter_property ROT TYPE INTEGER
set_parameter_property ROT UNITS None
set_parameter_property ROT ALLOWED_RANGES -2147483648:2147483647
set_parameter_property ROT HDL_PARAMETER true


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
# connection point avalon_streaming_source
# 
add_interface avalon_streaming_source avalon_streaming start
set_interface_property avalon_streaming_source associatedClock clock
set_interface_property avalon_streaming_source associatedReset reset_sink
set_interface_property avalon_streaming_source dataBitsPerSymbol 8
set_interface_property avalon_streaming_source errorDescriptor ""
set_interface_property avalon_streaming_source firstSymbolInHighOrderBits true
set_interface_property avalon_streaming_source maxChannel 0
set_interface_property avalon_streaming_source readyLatency 0
set_interface_property avalon_streaming_source ENABLED true
set_interface_property avalon_streaming_source EXPORT_OF ""
set_interface_property avalon_streaming_source PORT_NAME_MAP ""
set_interface_property avalon_streaming_source CMSIS_SVD_VARIABLES ""
set_interface_property avalon_streaming_source SVD_ADDRESS_GROUP ""

add_interface_port avalon_streaming_source en ready Input 1
add_interface_port avalon_streaming_source data_out data Output 8
add_interface_port avalon_streaming_source startofpacket startofpacket Output 1
add_interface_port avalon_streaming_source endofpacket endofpacket Output 1
add_interface_port avalon_streaming_source data_valid valid Output 1


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

add_interface_port reset_sink rst_n reset_n Input 1


# 
# connection point conduit_end
# 
add_interface conduit_end conduit end
set_interface_property conduit_end associatedClock clock
set_interface_property conduit_end associatedReset ""
set_interface_property conduit_end ENABLED true
set_interface_property conduit_end EXPORT_OF ""
set_interface_property conduit_end PORT_NAME_MAP ""
set_interface_property conduit_end CMSIS_SVD_VARIABLES ""
set_interface_property conduit_end SVD_ADDRESS_GROUP ""

add_interface_port conduit_end frame_valid frame_valid Output 1
add_interface_port conduit_end line_valid line_valid Output 1

