//////////////////////////////////////////////////////////////////////////////////
//	Testbench for Memory Access Module.
//
//	UPDATED: Nov. 22, 2019
//	AUTHOR: Brandon Ward
//////////////////////////////////////////////////////////////////////////////////

module MemoryAccess_TB;

//Inputs to simulate Memory Access module
reg clk;
reg dest_reg_write_en_ex;
reg [3:0] control_ex;
reg [15:0] result_ex, reg_data_ex, data_from_memory;
reg [4:0] dest_reg_index_ex;
//Outputs to simulate Memory Access module
wire data_to_memory_write_en;
wire dest_reg_write_en_ma;
wire [15:0] address_to_memory, data_to_memory, result_ma, data_ma;
wire [4:0] control_ma;

Execute mut (
//Inputs
.clk(clk),
.control_ex(control_ex),
.result_ex(result_ex),
.reg_data_ex(.reg_data_ex),
.dest_reg_index_ex(.dest_reg_index_ex),
.dest_reg_write_en_ex(dest_reg_write_en_ex),
.data_from_memory(data_from_memory),
//Outputs
.address_to_memory(address_to_memory),
.data_to_memory(.data_to_memory),
.data_to_memory_write_en(data_to_memory_write_en),
.dest_reg_index_ma(dest_reg_index_ma),
.dest_reg_write_en_ma(dest_reg_write_en_ma),
.result_ma(result_ma),
.data_ma(data_ma),
.control_ma(control_ma)
);
