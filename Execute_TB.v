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
	clk = 0;
	
end
