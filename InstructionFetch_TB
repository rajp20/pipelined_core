module InstructionFetch_TB;

	// Inputs

	// Outputs

	reg [15:0] instruction_memory [0:31];

	InstructionFetch _InstructionFetch(.clk                    		 (clk),
                                      .target_bp              		 (target_bp),
                                      .target_en_bp           		 (target_en_bp),
                                      .data_from_memory      	 	 (data_from_memory),
                                      .address_to_memory       		 (address_to_memory),
									  .next_program_counter_if_to_bp (next_program_counter_if_to_bp),
                                      .next_program_counter_if 		 (next_program_counter_if),
                                      .instruction_if         		 (instruction_if));

	initial begin
		$readmemh("InstructionMemory.data", instruction_memory);
		clk = 0;
	end

	always begin
		#10 clk = ~clk;
	end
	
	always begin
		
	end
endmodule;