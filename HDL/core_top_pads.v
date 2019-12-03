`include "/research/ece/lnis-teaching/5710_6710/Lab_files/HDL/padlib_tsmc180_innovus.v"
`include "/home/rajp/Projects/VSLI/pipelined_core/HDL/GATE/Core_mapped.v"

module core_top_pads (clk,
					  rst,
					  data_from_inst_memory,
					  data_to_main_mem_write_en,
					  address_to_main_mem,
					  data_mem_bus,
					  address_to_inst_mem);

   input clk, rst;
   input [15:0] data_from_inst_memory;
   output       data_to_main_mem_write_en;
   output [7:0] address_to_main_mem;
   output [13:0] address_to_inst_mem;
   inout [15:0]  data_mem_bus;

   wire [15:0]   data_from_inst_memory_pad;
   wire [15:0]   data_mem_bus_pad;
   wire [7:0]    address_to_main_mem_pad;
   wire [13:0]   address_to_inst_mem_pad;
   wire          data_to_main_mem_write_en_pad;
   wire          clk_pad;
   wire          rst_pad;

   //***************INPUTS*************************//

   pad_in pad_in0  (.pad(clk), .DataIn(clk_pad)); //clk
   pad_in pad_in17  (.pad(rst), .DataIn(rst_pad)); //rst

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

   //data_mem_bus
   pad_bidirhe pad_bi1 (.pad(data_mem_bus[0]), .DataIn(data_mem_bus_pad[0]), .DataOut(data_mem_bus_pad[0]), .EN(data_to_main_mem_write_en_pad));
   pad_bidirhe pad_bi2 (.pad(data_mem_bus[1]), .DataIn(data_mem_bus_pad[1]), .DataOut(data_mem_bus_pad[1]), .EN(data_to_main_mem_write_en_pad));
   pad_bidirhe pad_bi3 (.pad(data_mem_bus[2]), .DataIn(data_mem_bus_pad[2]), .DataOut(data_mem_bus_pad[2]), .EN(data_to_main_mem_write_en_pad));
   pad_bidirhe pad_bi4 (.pad(data_mem_bus[3]), .DataIn(data_mem_bus_pad[3]), .DataOut(data_mem_bus_pad[3]), .EN(data_to_main_mem_write_en_pad));
   pad_bidirhe pad_bi5 (.pad(data_mem_bus[4]), .DataIn(data_mem_bus_pad[4]), .DataOut(data_mem_bus_pad[4]), .EN(data_to_main_mem_write_en_pad));
   pad_bidirhe pad_bi6 (.pad(data_mem_bus[5]), .DataIn(data_mem_bus_pad[5]), .DataOut(data_mem_bus_pad[5]), .EN(data_to_main_mem_write_en_pad));
   pad_bidirhe pad_bi7 (.pad(data_mem_bus[6]), .DataIn(data_mem_bus_pad[6]), .DataOut(data_mem_bus_pad[6]), .EN(data_to_main_mem_write_en_pad));
   pad_bidirhe pad_bi8 (.pad(data_mem_bus[7]), .DataIn(data_mem_bus_pad[7]), .DataOut(data_mem_bus_pad[7]), .EN(data_to_main_mem_write_en_pad));
   pad_bidirhe pad_bi9 (.pad(data_mem_bus[8]), .DataIn(data_mem_bus_pad[8]), .DataOut(data_mem_bus_pad[8]), .EN(data_to_main_mem_write_en_pad));
   pad_bidirhe pad_bi10 (.pad(data_mem_bus[9]), .DataIn(data_mem_bus_pad[9]), .DataOut(data_mem_bus_pad[9]), .EN(data_to_main_mem_write_en_pad));
   pad_bidirhe pad_bi11 (.pad(data_mem_bus[10]), .DataIn(data_mem_bus_pad[10]), .DataOut(data_mem_bus_pad[10]), .EN(data_to_main_mem_write_en_pad));
   pad_bidirhe pad_bi12 (.pad(data_mem_bus[11]), .DataIn(data_mem_bus_pad[11]), .DataOut(data_mem_bus_pad[11]), .EN(data_to_main_mem_write_en_pad));
   pad_bidirhe pad_bi13 (.pad(data_mem_bus[12]), .DataIn(data_mem_bus_pad[12]), .DataOut(data_mem_bus_pad[12]), .EN(data_to_main_mem_write_en_pad));
   pad_bidirhe pad_bi14 (.pad(data_mem_bus[13]), .DataIn(data_mem_bus_pad[13]), .DataOut(data_mem_bus_pad[13]), .EN(data_to_main_mem_write_en_pad));
   pad_bidirhe pad_bi15 (.pad(data_mem_bus[14]), .DataIn(data_mem_bus_pad[14]), .DataOut(data_mem_bus_pad[14]), .EN(data_to_main_mem_write_en_pad));
   pad_bidirhe pad_bi16 (.pad(data_mem_bus[15]), .DataIn(data_mem_bus_pad[15]), .DataOut(data_mem_bus_pad[15]), .EN(data_to_main_mem_write_en_pad));

   //***************OUTPUTS*************************//

   pad_out_buffered pad_out0 (.pad(data_to_main_mem_write_en), .out(data_to_main_mem_write_en_pad)); //data_to_main_mem_write_en

   //address_to_main_mem
   pad_out_buffered pad_out1 (.pad(address_to_main_mem[0]), .out(address_to_main_mem_pad[0]));
   pad_out_buffered pad_out2 (.pad(address_to_main_mem[1]), .out(address_to_main_mem_pad[1]));
   pad_out_buffered pad_out3 (.pad(address_to_main_mem[2]), .out(address_to_main_mem_pad[2]));
   pad_out_buffered pad_out4 (.pad(address_to_main_mem[3]), .out(address_to_main_mem_pad[3]));
   pad_out_buffered pad_out5 (.pad(address_to_main_mem[4]), .out(address_to_main_mem_pad[4]));
   pad_out_buffered pad_out6 (.pad(address_to_main_mem[5]), .out(address_to_main_mem_pad[5]));
   pad_out_buffered pad_out7 (.pad(address_to_main_mem[6]), .out(address_to_main_mem_pad[6]));
   pad_out_buffered pad_out8 (.pad(address_to_main_mem[7]), .out(address_to_main_mem_pad[7]));

   //address_to_inst_mem
   pad_out_buffered pad_out9 (.pad(address_to_inst_mem[0]), .out(address_to_inst_mem_pad[0]));
   pad_out_buffered pad_out10 (.pad(address_to_inst_mem[1]), .out(address_to_inst_mem_pad[1]));
   pad_out_buffered pad_out11 (.pad(address_to_inst_mem[2]), .out(address_to_inst_mem_pad[2]));
   pad_out_buffered pad_out12 (.pad(address_to_inst_mem[3]), .out(address_to_inst_mem_pad[3]));
   pad_out_buffered pad_out13 (.pad(address_to_inst_mem[4]), .out(address_to_inst_mem_pad[4]));
   pad_out_buffered pad_out14 (.pad(address_to_inst_mem[5]), .out(address_to_inst_mem_pad[5]));
   pad_out_buffered pad_out15 (.pad(address_to_inst_mem[6]), .out(address_to_inst_mem_pad[6]));
   pad_out_buffered pad_out16 (.pad(address_to_inst_mem[7]), .out(address_to_inst_mem_pad[7]));
   pad_out_buffered pad_out17 (.pad(address_to_inst_mem[8]), .out(address_to_inst_mem_pad[8]));
   pad_out_buffered pad_out18 (.pad(address_to_inst_mem[9]), .out(address_to_inst_mem_pad[9]));
   pad_out_buffered pad_out19 (.pad(address_to_inst_mem[10]), .out(address_to_inst_mem_pad[10]));
   pad_out_buffered pad_out20 (.pad(address_to_inst_mem[11]), .out(address_to_inst_mem_pad[11]));
   pad_out_buffered pad_out21 (.pad(address_to_inst_mem[12]), .out(address_to_inst_mem_pad[12]));
   pad_out_buffered pad_out22 (.pad(address_to_inst_mem[13]), .out(address_to_inst_mem_pad[13]));


   pad_vdd pad_vdd0 ();
   pad_gnd pad_gnd0 ();

   pad_corner corner0 ();
   pad_corner corner1 ();
   pad_corner corner2 ();
   pad_corner corner3 ();

   Core core_dut (.clk  (clk_pad),
	 .reset (rst_pad),
	 .data_from_instruction_memory (data_from_inst_memory_pad),
	 .data_to_main_memory_write_en (data_to_main_mem_write_en_pad),
	 .address_to_main_memory (address_to_main_mem_pad),
	 .data_main_memory_bus (data_mem_bus_pad),
	 .address_to_instruction_memory (address_to_inst_mem_pad));

endmodule
