###################################################################

# Created by write_sdc on Mon Dec 2 13:34:15 2019

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_max_area 0
create_clock [get_ports clk]  -period 15  -waveform {0 7.5}
