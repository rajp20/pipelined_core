module MemoryAccess(input             clk,
		    input [3:0]       CTRL_EX,
		    input [15:0]      RES_EX,
		    input [15:0]      REG_DATA_EX,
		    input [4:0]       DEST_REG_INDEX_EX,
		    input 	      DEST_REG_WRITE_EN_EX,
		    input [15:0]      from_mem_data,
		    output reg [15:0] to_mem_addr,
		    output reg [15:0] core_to_mem_data,
		    output reg 	      core_to_mem_write_enable,
		    output reg [4:0]  DEST_REG_INDEX_MA,
		    output reg 	      DEST_REG_WRITE_EN_MA, 
		    output reg [15:0] RES_MA,
		    output reg [15:0] DATA_MA,
		    output reg [4:0]  CTRL_MA);

   parameter LOAD   = 4'b1100;
   parameter STORE  = 4'b1110;
   
   always@(*)
     core_to_mem_write_enable = 0;
     begin
	if (CTRL_EX == STORE)
	  begin
	     to_mem_addr = RES_EX;
	     core_to_mem_data = REG_DATA_EX;
	     core_to_mem_write_enable = 1;
	  end
	else if (CTRL_EX == LOAD)
	  begin
	     to_mem_addr = RES_EX;
	  end
     end

   always@(posedge clk) 
     begin
	CTRL_MA <= CTRL_EX;
	RES_MA <= RES_MA;
	DATA_MA <= from_mem_data;
	DEST_REG_INDEX_MA <= DEST_REG_INDEX_EX;
	DEST_REG_WRITE_EN_MA <= DEST_REG_WRITE_EN_EX;
     end

endmodule
