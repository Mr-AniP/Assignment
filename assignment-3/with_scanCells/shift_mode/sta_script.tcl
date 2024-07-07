read_liberty ../NangateOpenCellLibrary_low_temp.lib
read_verilog ../netlist.v
link_design vdf_3_b
read_sdc netlist.sdc
report_checks -path_delay max -from [get_pins F1/CK] -to [get_pins F2/SI] > report_max.txt
report_checks -path_delay min -from [get_pins F1/CK] -to [get_pins F2/SI] > report_min.txt
report_net -connection -verbose _001_ > report_net_load.txt