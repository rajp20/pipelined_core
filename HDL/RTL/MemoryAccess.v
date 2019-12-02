//////////////////////////////////////////////////////////////////////////////////
//	Memory Access Module.
//
//	UPDATED: Nov. 23, 2019
//	AUTHOR: Raj Patel, Brandon Ward
//////////////////////////////////////////////////////////////////////////////////
module MemoryAccess(input             clk,
		   			input [3:0]       control_ex,
		    		input [15:0]      result_ex,
		    		input [15:0]      reg_data_ex,
		    		input [4:0]       dest_reg_index_ex,
		    		input 	      	  dest_reg_write_en_ex,
		    		output reg [7:0]  address_to_main_memory,
		    		output reg 	      data_to_memory_write_en,
		    		output reg [4:0]  dest_reg_index_ma,
		    		output reg 	      dest_reg_write_en_ma, 
		    		output reg [15:0] result_ma,
		    		output reg [15:0] data_ma,
		    		output reg [3:0]  control_ma,
		    		inout [15:0]      data_memory_bus);

   parameter LOAD   = 4'b1100;
   parameter STORE  = 4'b1110;

	assign data_memory_bus = data_to_memory_write_en ? reg_data_ex : 16'bz;
   
   always@(*)
     begin
	data_to_memory_write_en = 0;
	if (control_ex == STORE)
	  begin
	     address_to_main_memory = result_ex[7:0];
	     data_to_memory_write_en = 1;
	  end
	else if (control_ex == LOAD)
	  begin
	     address_to_main_memory = result_ex[7:0];
	  end
     end
   
   always@(posedge clk) 
     begin
	control_ma <= control_ex;
	result_ma <= result_ex;
	data_ma <= data_memory_bus;
	dest_reg_index_ma <= dest_reg_index_ex;
	dest_reg_write_en_ma <= dest_reg_write_en_ex;
     end

endmodule
