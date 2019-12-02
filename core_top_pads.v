`include "/research/ece/lnis-teaching/5710_6710/Lab_files/HDL/padlib_tsmc180_innovus.v"
`include "/HDL/GATE/core_mapped.v"

module core_top_pads (clk,
					  rst,
					  data_from_inst_memory,
					  data_from_main_memory,
					  data_to_main_mem_write_en,
					  address_to_main_mem,
					  data_to_main_mem,
					  address_to_inst_mem);
input clk, rst;
input [15:0] data_from_inst_memory;
input [15:0] data_from_main_memory;
output data_to_main_mem_write_en;
output [4:0] address_to_main_mem;
output [4:0] address_to_inst_mem;
output [15:0] data_to_main_mem;

//***************INPUTS*************************//

pad_in pad_in0  (.pad(clk), .DatatIn(clk_pad)); //clk
pad_in pad_in33  (.pad(rst), .DataIn(rst_pad)); //rst

//data_from_inst_memory
pad_in pad_in1  (.pad(data_from_inst_memory[0]), .DataIn(data_from_inst_memory_pad[0]));
pad_in pad_in2  (.pad(data_from_inst_memory[1]), .DataIn(data_from_inst_memory_pad[1]));
pad_in pad_in3  (.pad(data_from_inst_memory[2]), .DataIn(data_from_inst_memory_pad[2]));
pad_in pad_in4  (.pad(data_from_inst_memory[3]), .DataIn(data_from_inst_memory_pad[3]));
pad_in pad_in5  (.pad(data_from_inst_memory[4]), .DataIn(data_from_inst_memory_pad[4]));
pad_in pad_in6  (.pad(data_from_inst_memory[5]), .DataIn(data_from_inst_memory_pad[5]));
pad_in pad_in7  (.pad(data_from_inst_memory[6]), .DataIn(data_from_inst_memory_pad[6]));
pad_in pad_in8  (.pad(data_from_inst_memory[7]), .DataIn(data_from_inst_memory_pad[7]));
pad_in pad_in9  (.pad(data_from_inst_memory[8]), .DataIn(data_from_inst_memory_pad[8]));
pad_in pad_in10 (.pad(data_from_inst_memory[9]), .DataIn(data_from_inst_memory_pad[9]));
pad_in pad_in11 (.pad(data_from_inst_memory[10]), .DataIn(data_from_inst_memory_pad[10]));
pad_in pad_in12 (.pad(data_from_inst_memory[11]), .DataIn(data_from_inst_memory_pad[11]));
pad_in pad_in13 (.pad(data_from_inst_memory[12]), .DataIn(data_from_inst_memory_pad[12]));
pad_in pad_in14 (.pad(data_from_inst_memory[13]), .DataIn(data_from_inst_memory_pad[13]));
pad_in pad_in15 (.pad(data_from_inst_memory[14]), .DataIn(data_from_inst_memory_pad[14]));
pad_in pad_in16 (.pad(data_from_inst_memory[15]), .DataIn(data_from_inst_memory_pad[15]));

//data_from_main_memory
pad_in pad_in17 (.pad(data_from_main_memory[0]), .DataIn(data_from_main_memory_pad[0]));
pad_in pad_in18 (.pad(data_from_main_memory[1]), .DataIn(data_from_main_memory_pad[1]));
pad_in pad_in19 (.pad(data_from_main_memory[2]), .DataIn(data_from_main_memory_pad[2]));
pad_in pad_in20 (.pad(data_from_main_memory[3]), .DataIn(data_from_main_memory_pad[3]));
pad_in pad_in21 (.pad(data_from_main_memory[4]), .DataIn(data_from_main_memory_pad[4]));
pad_in pad_in22 (.pad(data_from_main_memory[5]), .DataIn(data_from_main_memory_pad[5]));
pad_in pad_in23 (.pad(data_from_main_memory[6]), .DataIn(data_from_main_memory_pad[6]));
pad_in pad_in24 (.pad(data_from_main_memory[7]), .DataIn(data_from_main_memory_pad[7]));
pad_in pad_in25 (.pad(data_from_main_memory[8]), .DataIn(data_from_main_memory_pad[8]));
pad_in pad_in26 (.pad(data_from_main_memory[9]), .DataIn(data_from_main_memory_pad[9]));
pad_in pad_in27 (.pad(data_from_main_memory[10]), .DataIn(data_from_main_memory_pad[10]));
pad_in pad_in28 (.pad(data_from_main_memory[11]), .DataIn(data_from_main_memory_pad[11]));
pad_in pad_in29 (.pad(data_from_main_memory[12]), .DataIn(data_from_main_memory_pad[12]));
pad_in pad_in30 (.pad(data_from_main_memory[13]), .DataIn(data_from_main_memory_pad[13]));
pad_in pad_in31 (.pad(data_from_main_memory[14]), .DataIn(data_from_main_memory_pad[14]));
pad_in pad_in32 (.pad(data_from_main_memory[15]), .DataIn(data_from_main_memory_pad[15]));

//***************OUTPUTS*************************//

pad_out_buffered pad_out0 (.pad(data_to_main_mem_write_en), .out(data_to_main_mem_write_en_pad)); //data_to_main_mem_write_en

//address_to_main_mem
pad_out_buffered pad_out1 (.pad(address_to_main_mem[0]), .out(address_to_main_mem_pad[0]));
pad_out_buffered pad_out2 (.pad(address_to_main_mem[1]), .out(address_to_main_mem_pad[1]));
pad_out_buffered pad_out3 (.pad(address_to_main_mem[2]), .out(address_to_main_mem_pad[2]));
pad_out_buffered pad_out4 (.pad(address_to_main_mem[3]), .out(address_to_main_mem_pad[3]));

//address_to_inst_mem
pad_out_buffered pad_out5 (.pad(address_to_inst_mem[0]), .out(address_to_inst_mem_pad[0]));
pad_out_buffered pad_out6 (.pad(address_to_inst_mem[1]), .out(address_to_inst_mem_pad[1]));
pad_out_buffered pad_out7 (.pad(address_to_inst_mem[2]), .out(address_to_inst_mem_pad[2]));
pad_out_buffered pad_out8 (.pad(address_to_inst_mem[3]), .out(address_to_inst_mem_pad[3]));

//data_to_main_mem
pad_out_buffered pad_out9  (.pad(data_to_main_mem[0]), .out(data_to_main_mem_pad[0]));
pad_out_buffered pad_out10 (.pad(data_to_main_mem[1]), .out(data_to_main_mem_pad[1]));
pad_out_buffered pad_out11 (.pad(data_to_main_mem[2]), .out(data_to_main_mem_pad[2]));
pad_out_buffered pad_out12 (.pad(data_to_main_mem[3]), .out(data_to_main_mem_pad[3]));
pad_out_buffered pad_out13 (.pad(data_to_main_mem[4]), .out(data_to_main_mem_pad[4]));
pad_out_buffered pad_out14 (.pad(data_to_main_mem[5]), .out(data_to_main_mem_pad[5]));
pad_out_buffered pad_out15 (.pad(data_to_main_mem[6]), .out(data_to_main_mem_pad[6]));
pad_out_buffered pad_out16 (.pad(data_to_main_mem[7]), .out(data_to_main_mem_pad[7]));
pad_out_buffered pad_out17 (.pad(data_to_main_mem[8]), .out(data_to_main_mem_pad[8]));
pad_out_buffered pad_out18 (.pad(data_to_main_mem[9]), .out(data_to_main_mem_pad[9]));
pad_out_buffered pad_out19 (.pad(data_to_main_mem[10]), .out(data_to_main_mem_pad[10]));
pad_out_buffered pad_out20 (.pad(data_to_main_mem[11]), .out(data_to_main_mem_pad[11]));
pad_out_buffered pad_out21 (.pad(data_to_main_mem[12]), .out(data_to_main_mem_pad[12]));
pad_out_buffered pad_out22 (.pad(data_to_main_mem[13]), .out(data_to_main_mem_pad[13]));
pad_out_buffered pad_out23 (.pad(data_to_main_mem[14]), .out(data_to_main_mem_pad[14]));
pad_out_buffered pad_out24 (.pad(data_to_main_mem[15]), .out(data_to_main_mem_pad[15]));


pad_vdd pad_vdd0 ();
pad_gnd pad_gnd0 ();

pad_corner corner0 ();
pad_corner corner1 ();
pad_corner corner2 ();
pad_corner corner3 ();

core_top_pads core_top_pads_dut (clk_pad,
								 rst_pad,
								 data_from_inst_memory_pad,
								 data_from_main_memory_pad,
							     data_to_main_mem_write_en_pad,
								 address_to_main_mem_pad,
								 data_to_main_mem_pad,
							     address_to_inst_mem_pad);
endmodule
