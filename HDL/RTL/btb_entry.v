module btb_entry (hit, insert_bubble, update_hit, prediction, out_target, empty, clk, enable, op, pc, in_pc, in_target);
	input clk, enable;
	input [2:0] op;
	input [15:0] pc;
	input [11:0] in_pc;
	input [15:0] in_target;

	output wire hit;
	output wire update_hit;
	output wire prediction;
	output wire [15:0] out_target;
	output wire empty;
	output wire insert_bubble;

	wire write;
	wire outcome;
	wire rst;

	reg [15:5] btb_ins_pc;
	//reg [15:0] btb_next_ins_pc;
	reg [15:0] btb_target;
	//reg [15:0] btb_next_target;
	reg valid_flag;
	//2-BIT PREDICTOR
	bp_counter U1 (
		.clk(clk),
		.enable (enable),
		.actual (outcome),
		.rst (rst),
		.out (prediction));

	//PARAMETERS
	parameter op_IDLE = 3'b000;
	parameter op_CLEAR = 3'b111;
	parameter op_LOOKUP = 3'bxxx;
	parameter op_VERIFY_FALLTHROUGH = 3'b010;
	parameter op_VERIFY_TARGET = 3'b011;
	parameter op_INSERT_FALLTHROUGH = 3'b100;
	parameter op_INSERT_TARGET = 3'b101;

	assign out_target = btb_target;
	assign hit = (pc[15:5]==btb_ins_pc)&valid_flag;
	assign update_hit = (in_pc == btb_ins_pc)&valid_flag;
	assign write = op[1]&valid_flag;
	assign rst = (enable & ((op == op_INSERT_FALLTHROUGH)|(op == op_INSERT_TARGET)))|(op == op_CLEAR);
	assign outcome = op[0];
	assign empty = ~valid_flag;
	assign insert_bubble = update_hit&(outcome ^ prediction);

	always @(negedge clk) begin
		if (enable) begin
			case (op)
				op_CLEAR: begin
					btb_ins_pc <={11{1'b0}};
					btb_target <= {16{1'b0}};
					valid_flag <= 0;
				end
				op_INSERT_FALLTHROUGH: begin
					btb_ins_pc <= in_pc;
					btb_target <= in_target;
					valid_flag <= 1'b1;
				end
				op_INSERT_TARGET: begin
					btb_ins_pc <= in_pc;
					btb_target <= in_target;
					valid_flag <= 1'b1;
				end
				default: begin
					valid_flag <= valid_flag;
					btb_ins_pc <= btb_ins_pc;
					btb_target <= btb_target;
				end
			endcase
		end // if (enable)

       if (rst) begin
		  btb_ins_pc <={11{1'b0}};
		  btb_target <= {16{1'b0}};
		  valid_flag <= 0;
		end
	end

endmodule
