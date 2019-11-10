module Core(input             clk,
	    input      [15:0] mem_to_core_data,
	    output reg [23:0] core_to_mem_addr,
	    output reg [15:0] core_to_mem_data,
	    output reg        core_to_mem_write_enable);

   // Wires for register file.
   wire [23:0] read_data_1;
   wire [23:0] read_data_2;

   Register_File _Register_File(
   
   

endmodule
