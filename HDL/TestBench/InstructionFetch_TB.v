module InstructionFetch_TB;

	// Inputs
	reg 	 	clk;
	reg [13:0] 	target_bp;
	reg 		target_en_bp;
	wire [15:0] data_from_memory;
	
	// Outputs
	wire [13:0] address_to_memory;
	wire [13:0] next_program_counter_if_to_bp;
	wire [13:0] next_program_counter_if;
	wire [15:0] instruction_if;

	reg [15:0] instruction_memory [0:41];

	assign data_from_memory = instruction_memory[address_to_memory];

	InstructionFetch _InstructionFetch(.clk                    		 (clk),
                                      .target_bp              		 (target_bp),
                                      .target_en_bp           		 (target_en_bp),
                                      .data_from_memory      	 	 (data_from_memory),
                                      .address_to_memory       		 (address_to_memory),
									  .next_program_counter_if_to_bp (next_program_counter_if_to_bp),
                                      .next_program_counter_if 		 (next_program_counter_if),
                                      .instruction_if         		 (instruction_if));

	initial begin
		$readmemb("pipelined_core/InstructionMemory.data", instruction_memory);
		clk = 0;
		target_bp = 0;
		target_en_bp = 0;
		
	end

	always begin
		#10 clk = ~clk;
	end
	
	always begin
		#10;
		$display("Address = %0d, Data = %b", address_to_memory, data_from_memory);
		#45;
		target_bp = 16'd32;
		target_en_bp = 1;
		#5;
		target_en_bp = 0;
		$display("Address = %0d, Data = %b", address_to_memory, data_from_memory);
		#40;
		target_bp = 16'd2;
		target_en_bp = 1;
		#5;
		target_en_bp = 0;
		$display("Address = %0d, Data = %b", address_to_memory, data_from_memory);
		#50;
	end

endmodule
