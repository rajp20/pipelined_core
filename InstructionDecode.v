module InstructionDecode(input             clk,
			 input [15:0] 	   NPC_IF,
			 input [15:0] 	   INST_IF,
			 input [23:0] 	   read_data_1,
			 input [23:0]      read_data_2,
			 output reg [4:0]  read_index_1,
			 output reg [4:0]  read_index_2, 
			 output reg [15:0] NPC_ID,
			 output reg [5:0]  REG1_ID
			 output reg [5:0]  REG2_ID
			 output reg [4:0]  CTRL_ID);

   // Need to figure out a way to pass immediate values to the next stage.
   always@(*) begin
      read_index_1 = INST_IF[4:0];
      read_index_2 = INST_IF[9:5];
   end

   always@(posedge clk) begin
      NPC_ID <= NPC_IF;
      CTRL_ID <= INST_IF[15:11];
      REG1_ID <= read_data_1;
      REG2_ID <= read_data_2;
   end

endmodule
