//////////////////////////////////////////////////////////////////////////////////
//  Execution testbench module. This testbench is used to develop and test all
//  ALU operations in the Execution stage of the pipelined CPU.
//
//  UPDATED: Nov. 22, 2019
//  AUTHOR: Blaze Kotsenburg
//////////////////////////////////////////////////////////////////////////////////
module Execute_TB;
//Inputs to simulate Execute module
reg clk;
reg [4:0]  control_in, dest_index_in;
reg [15:0] reg1_data, reg2_data, npc;
reg [6:0]  immediate;
//Outputs to simulate Execute module
wire [4:0] dest_index_out;
wire [4:0] control_out;
wire [15:0] output_reg;
wire [15:0] result_out;
wire [15:0] target;
wire DEST_REG_WRITE_EN;
wire ZF;
wire GF;
wire LF;
//Begin testing flag
reg begin_testing;

//Create an instance of the Execute module for testing
Execute mut(
//INPUTS
.clk(clk),
.control_in(control_in),
.dest_index_in(dest_index_in),
.reg1_data(reg1_data),
.reg2_data(reg2_data),
.npc(npc),
.immediate(immediate),
//OUTPUTS
.dest_index_out(dest_index_out),
.control_out(control_out),
.output_reg(output_reg),
.result_out(result_out),
.target(target),
.DEST_REG_WRITE_EN(DEST_REG_WRITE_EN),
.ZF(ZF),
.GF(GF),
.LF(LF)
);

//Initialize values needed to run the Execute module
initial
begin: CLOCK_GENERATOR
	clk = 1'b1;
	begin_testing = 1'b1;
	//#5 clk = ~clk;
	//Initialize inputs to begin testing with SUB instruction
	control_in    = 5'b00000; //SUB opcode
	dest_index_in = 5'b00000; //Simulate dest index as $R2
	reg1_data     = 16'd0;   //R1 data is 10 in decimal
	reg2_data     = 16'd0;    //R2 data is 3
        npc           = 16'd0;    //NPC set to 0
        immediate     = 7'd0;     //Immediate value set to zero
	#5 clk = ~clk;
	//TODO: fix issue from allowing to see first result of testing sequence

end

//Beginning of testing sequence
begin
	always
	begin
		#5 clk = ~clk;
		if(clk)
		begin
		#5 begin_testing = ~begin_testing;
		
		//Console validation for SUB operation
		//Initialize inputs to begin testing with SUB instruction
		control_in    = 5'b00001; //SUB opcode
		dest_index_in = 5'b00010; //Simulate dest index as $R2
		reg1_data     = 16'd10;   //R1 data is 10 in decimal
		reg2_data     = 16'd3;    //R2 data is 3
        	npc           = 16'd0;    //NPC set to 0
        	immediate     = 7'd0;     //Immediate value set to zero
		$display("\nOpcode: SUB\n reg1_data: ", reg1_data, "\n reg2_data: ", reg2_data, "\n result_out: ", result_out);

		//TODO: Edge case tests for SUB here later

		#5 clk = ~clk;

		//Initialize inputs to begin testing with ADD instruction
		control_in    = 5'b00010; //ADD opcode
		dest_index_in = 5'b00010; //Simulate dest index as $R2
		reg1_data     = 16'd10;   //R1 data is 10 in decimal
		reg2_data     = 16'd5;    //R2 data is 5
        	npc           = 16'd0;    //NPC set to 0
        	immediate     = 7'd0;     //Immediate value set to zero

		//Console validation for ADD operation
		$display("\nOpcode: ADD\n reg1_data: ", reg1_data, "\n reg2_data: ", reg2_data, "\n result_out: ", result_out);

		//TODO: Edge case tests for ADD here later

		#5 clk = ~clk;

		//Initialize inputs to begin testing with ADDI instruction
		control_in    = 5'b00011; //ADDI opcode
		dest_index_in = 5'b00010; //Simulate dest index as $R2
		reg1_data     = 16'd10;   //R1 data is 10 in decimal
		reg2_data     = 16'd5;    //R2 data is 5
        	npc           = 16'd0;    //NPC set to 0
        	immediate     = 7'd7;     //Immediate value set to zero
		
		//Console validation for ADDI operation
		$display("\nOpcode: ADDI\n reg1_data: ", reg1_data, "\n immediate: ", immediate, "\n result_out: ", result_out);
		end	
	end
end
endmodule
