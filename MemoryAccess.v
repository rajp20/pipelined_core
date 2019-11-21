module MemoryAccess(input             clk,
		    input [15:0]      NPC_IF,
		    input [15:0]      INST_IF,
		    input [23:0]      read_data_1,
		    input [23:0]      read_data_2,
		    output reg [4:0]  read_index_1,
		    output reg [4:0]  read_index_2, 
		    output reg [15:0] NPC_ID,
		    output reg [15:0] REG1_DATA_ID,
		    output reg [15:0] REG2_DATA_ID,
		    output reg [5:0]  DEST_REG_INDEX_ID,
		    output reg [4:0]  CTRL_ID);
   
   always@(*) begin

   end

   always@(posedge clk) begin

   end

endmodule
