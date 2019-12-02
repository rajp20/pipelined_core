module InstructionFetch(input 		      clk,
                        input [15:0] 	  target_bp,
                        input             target_en_bp,
                        input [15:0] 	  data_from_memory,
						input 			  reset,
						output [15:0]	  next_program_counter_if_to_bp,
                        output reg [3:0] address_to_memory,
                        output reg [15:0] next_program_counter_if,
                        output reg [15:0] instruction_if);

   //   parameter NOP = 16'h0000;
   
   reg [15:0] PC;
   reg [15:0] NPC;
   reg [15:0] MUX_OUT;  

   //initial NPC = 16'h0000;

   assign next_program_counter_if_to_bp = NPC;

   always@(*)
     begin
		if (reset) 
		  NPC = 0;    

        MUX_OUT = NPC;	
    	if (target_en_bp)
    	  MUX_OUT = target_bp;
	
    	NPC = MUX_OUT + 1'b1;
		address_to_memory = PC;
     end
   
   always@(posedge clk) 
     begin
		next_program_counter_if <= NPC;
		PC <= MUX_OUT;
		instruction_if <= data_from_memory;
		//	if (BRANCH_PRED)
		//	  instruction_if <= data_from_memory;
		//	else
		//	  instruction_if <= NOP;
     end
   
endmodule
