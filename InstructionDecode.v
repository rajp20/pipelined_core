module InstructionDecode(input             clk,
			 input [15:0] 	   NPC_IF,
			 input [15:0] 	   INST_IF,
			 input 		   BRANCH_PRED,
			 input [15:0] 	   read_data_1,
			 input [15:0] 	   read_data_2, 
			 output reg [4:0]  read_index_1,
			 output reg [4:0]  read_index_2,
			 output [3:0] 	   OP_BR,
			 output [11:0] 	   TARGET_BR, 
			 output reg [15:0] NPC_ID,
			 output reg [15:0] REG1_DATA_ID,
			 output reg [15:0] REG2_DATA_ID,
			 output reg [6:0]  IMMEDIATE_ID,
			 output reg [4:0]  DEST_REG_INDEX_ID,
			 output reg [3:0]  CTRL_ID);

   assign OP_BR = INST_IF[15:12];
   assign TARGET_BR = {4{1'b0}, INST_IF[11:0]};
   
   // Need to figure out a way to pass immediate values to the next stage.
   always@(*) begin
      read_index_1 = INST_IF[5:9];
      read_index_2 = INST_IF[4:0];
   end

   always@(posedge clk) begin
      NPC_ID <= NPC_IF;
      CTRL_ID <= INST_IF[15:12];
      REG1_DATA_ID <= read_data_1;
      REG2_DATA_ID <= read_data_2;
      IMMEDIATE_ID <= INST_IF[11:5];
      DES_REG_INDEX_ID <= INST_IF[4:0];
   end

endmodule
