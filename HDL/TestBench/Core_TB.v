module Core_TB;

	// Inputs
	reg 	 	clk;
	reg			reset;
	wire [15:0] data_from_instruction_memory;
	wire [15:0] data_from_main_memory;
	
	// Outputs
	wire [13:0] address_to_instruction_memory;
	wire [7:0] address_to_main_memory;
	wire [15:0] data_to_main_memory;
	wire		data_to_main_memory_write_en;

	reg [15:0] instruction_memory [0:41];
	reg [15:0] main_memory [0:2024];

	assign data_from_instruction_memory = instruction_memory[address_to_instruction_memory];
	assign data_from_main_memory = main_memory[address_to_main_memory];

	Core _Core(.clk                    		  (clk),
			   .reset						  (reset),
			   .data_from_instruction_memory  (data_from_instruction_memory),
			   .data_from_main_memory         (data_from_main_memory),
			   .address_to_instruction_memory (address_to_instruction_memory),
			   .address_to_main_memory        (address_to_main_memory),
			   .data_to_main_memory			  (data_to_main_memory),
			   .data_to_main_memory_write_en  (data_to_main_memory_write_en));

	initial begin
		$readmemb("pipelined_core/InstructionMemory.data", instruction_memory);
		$readmemb("pipelined_core/MainMemory.data", main_memory);
		clk = 0;	
		reset = 1;	
	end

	always begin
		#10 clk = ~clk;
	end

	always begin
		#1;
		reset = 0;
		if (data_to_main_memory_write_en) begin
			$display("Write En: %b, Address: %b, Data: %b", data_to_main_memory_write_en, address_to_main_memory, data_to_main_memory);
		end
		main_memory[address_to_main_memory] = data_to_main_memory_write_en ? data_to_main_memory : main_memory[address_to_main_memory];
	end


endmodule
