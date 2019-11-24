module InstructionDecode_TB;

	// Inputs
	reg 	 	clk;
	reg [15:0] 	next_program_counter_if;
	reg [15:0]  instruction_if;
	reg         branch_prediction_bp;
	reg [15:0]  reg1_data_rf;
	reg [15:0]  reg2_data_rf;
	
	// Outputs
	wire [4:0]  reg1_index_rf;
	wire [4:0]  reg2_index_rf;
	wire [3:0]  opcode_id;
	wire [15:0] target_address_id;
	wire [15:0] next_program_counter_id;
	wire [15:0] reg1_data_id;
	wire [15:0] reg2_data_id;
	wire [4:0]  dest_reg_index_id;
	wire [6:0]  immediate_id;
	wire [3:0]  control_id;

	InstructionDecode _InstructionDecode(.clk                       (clk), // Input starts here
                                         .next_program_counter_if   (next_program_counter_if),
                                         .instruction_if            (instruction_if),
                                         .branch_prediction_bp      (branch_prediction_bp),
                                         .reg1_data_rf              (reg1_data_rf),
                                         .reg2_data_rf              (reg2_data_rf),
                                         .reg1_index_rf             (reg1_index_rf), // Output starts here
                                         .reg2_index_rf             (reg2_index_rf),
                                         .opcode_id                 (opcode_id),
                                         .target_address_id         (target_address_id),
                                         .next_program_counter_id   (next_program_counter_id),
                                         .reg1_data_id              (reg1_data_id),
                                         .reg2_data_id              (reg2_data_id),
                                         .dest_reg_index_id         (dest_reg_index_id),
                                         .immediate_id              (immediate_id),
                                         .control_id                (control_id));

	initial begin
		clk = 0;
		next_program_counter_if = 0;
		instruction_if = 0;
		branch_prediction_bp = 0;
		reg1_data_rf = 0;
		reg2_data_rf = 0;
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
