module InstructionFetch(input 		  clk,
			input [15:0] 	  TARGET,
			input 		  TARGET_EN, 
			input [15:0] 	  from_mem_data,
			output reg [15:0] to_mem_addr,
			output reg [15:0] NPC_IF,
			output reg [15:0] INST_IF);

   reg [15:0] PC;
   reg [15:0] NPC;
   reg [15:0] MUX_OUT;

   initial PC = 15'b0;
   initial NPC = 15'b0;   
   
   always@(*) begin
      to_mem_addr = PC;
      MUX_OUT = NPC
      if (TARGET_EN)
	MUX_OUT = TARGET;
	
      NPC = MUX_OUT + 1b'1;
   end

   always@(posedge clk) begin
      NPC_IF <= NPC;
      INST_IF <= from_mem_data;
      PC <= MUX_OUT;
   end
   
endmodule
