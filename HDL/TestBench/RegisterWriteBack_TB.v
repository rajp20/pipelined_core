//////////////////////////////////////////////////////////////////////////////////
//	Testbench for Register WriteBack Module.
//
//	UPDATED: Nov. 24, 2019
//	AUTHOR: Brandon Ward
//////////////////////////////////////////////////////////////////////////////////
module RegisterWriteBack_TB;
//Inputs
reg clk;
reg [4:0] dest_reg_index_ma;
reg dest_reg_write_en_ma;
reg [15:0] result_ma;
reg [15:0] data_ma;
reg [3:0] control_ma;
//Outputs;
wire [4:0] write_index_rf;
wire [15:0] write_data_rf;
wire write_en_rf;

reg [4:0] state;

RegisterWriteBack rwbtb (
//Inputs
.clk(clk),
.dest_reg_index_ma(dest_reg_index_ma),
.dest_reg_write_en_ma(dest_reg_write_en_ma),
.result_ma(result_ma),
.data_ma(data_ma),
.control_ma(control_ma),
//Outputs
.write_index_rf(write_index_rf),
.write_data_rf(write_data_rf),
.write_en_rf(write_en_rf)
);

parameter LOAD   = 4'b1100;
parameter STORE  = 4'b1110;

initial
begin: CLOCK_GENERATOR
       clk = 1'b1;
       dest_reg_index_ma = 5'b00000;
       dest_reg_write_en_ma = 1'b1;
       result_ma = 16'd10;
       data_ma = 16'd11;
       control_ma = LOAD; //initally set to load so should = data_ma
       state = LOAD;
       #5 clk = ~clk;
end
begin
	always
	begin
		#5 clk = ~clk;
		if(clk)
		begin
			case(state)
				LOAD: begin
					control_ma = STORE;
					state = STORE;
				end
				STORE: begin
					control_ma = LOAD;
					state = LOAD;
				end
			endcase
		end
	end
end
endmodule
