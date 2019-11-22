module MemoryAccess(input             clk,
		    input [3:0]       control_ex,
		    input [15:0]      result_ex,
		    input [15:0]      reg_data_ex,
		    input [4:0]       dest_reg_index_ex,
		    input 	      dest_reg_write_en_ex,
		    input [15:0]      data_from_memory,
		    output reg [15:0] address_to_memory,
		    output reg [15:0] data_to_memory,
		    output reg 	      data_to_memory_write_en,
		    output reg [4:0]  dest_reg_index_ma,
		    output reg 	      dest_reg_write_en_ma, 
		    output reg [15:0] result_ma,
		    output reg [15:0] data_ma,
		    output reg [4:0]  control_ma);

   parameter LOAD   = 4'b1100;
   parameter STORE  = 4'b1110;
   
   always@(*)
     begin
	data_to_memory_write_en = 0;
	if (control_ex == STORE)
	  begin
	     address_to_memory = result_ex;
	     data_to_memory = reg_data_ex;
	     data_to_memory_write_en = 1;
	  end
	else if (control_ex == LOAD)
	  begin
	     address_to_memory = result_ex;
	  end
     ends
   
   always@(posedge clk) 
     begin
	control_ma <= control_ex;
	result_ma <= result_ex;
	data_ma <= data_from_memory;
	dest_reg_index_ma <= dest_reg_index_ex;
	dest_reg_write_en_ma <= dest_reg_write_en_ex;
     end

endmodule
