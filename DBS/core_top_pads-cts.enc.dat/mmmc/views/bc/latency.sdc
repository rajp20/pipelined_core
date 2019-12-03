set_clock_latency -source -early -min -rise  -1.55337 [get_ports {clk}] -clock clk 
set_clock_latency -source -early -min -fall  -1.45632 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -min -rise  -1.55337 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -min -fall  -1.45632 [get_ports {clk}] -clock clk 
