module btb(btb_target, btb_prediction, clk, rst, fetch_pc, ex_pc, ex_opcode, target_entry, lflag, gflag, zflag);
	input clk, rst;
	input [15:0] fetch_pc;
	input [15:0] ex_pc;
	input [3:0] ex_opcode;
	input [15:0] target_entry;
	input lflag, gflag, zflag;

	output reg [15:0] btb_target;
	output reg btb_prediction;

	reg [3:0] r_DEC_HIT;
	reg [3:0] r_NEXT_EX_HIT;
	reg [3:0] r_EX_HIT;
	
	wire [3:0] hit;
	wire [3:0] prediction;
	wire [63:0] target;
	wire [3:0] empty;
	wire [3:0] entry_en;
	wire ex_jump;

	parameter HIT_WAY_1 = 4'b0001;
	parameter HIT_WAY_2 = 4'b0010;
	parameter HIT_WAY_3 = 4'b0100;
	parameter HIT_WAY_4 = 4'b1000;

	parameter p_JUMPL = 4'b0111;
	parameter p_JUMPG = 4'b1000;
	parameter p_JUMPE = 4'b1001;
	parameter p_JUMPNE = 4'b1010;

	btb_way W0(.clk(clk), .rst(rst), .current_pc(fetch_pc), .entry_en(entry_en[0]), .update_en(r_EX_HIT[0]), .jump_en(ex_jump), .entry_pc(ex_pc), .entry_target(target_entry), .way_prediction(prediction[0]), .way_hit(hit[0]), .way_empty(empty[0]), .way_target(target[15:0]));
	btb_way W1(.clk(clk), .rst(rst), .current_pc(fetch_pc), .entry_en(entry_en[1]), .update_en(r_EX_HIT[1]), .jump_en(ex_jump), .entry_pc(ex_pc), .entry_target(target_entry), .way_prediction(prediction[1]), .way_hit(hit[1]), .way_empty(empty[1]), .way_target(target[31:16]));
	btb_way W2(.clk(clk), .rst(rst), .current_pc(fetch_pc), .entry_en(entry_en[2]), .update_en(r_EX_HIT[2]), .jump_en(ex_jump), .entry_pc(ex_pc), .entry_target(target_entry), .way_prediction(prediction[2]), .way_hit(hit[2]), .way_empty(empty[2]), .way_target(target[47:32]));
	btb_way W3(.clk(clk), .rst(rst), .current_pc(fetch_pc), .entry_en(entry_en[3]), .update_en(r_EX_HIT[3]), .jump_en(ex_jump), .entry_pc(ex_pc), .entry_target(target_entry), .way_prediction(prediction[3]), .way_hit(hit[3]), .way_empty(empty[3]), .way_target(target[63:48]));

	assign entry_en = (empty[0] == 1'b1) ? 4'b0001 : 
				(empty[1] == 1'b1) ? 4'b0010 :
				(empty[2] == 1'b1) ? 4'b0100 : 4'b1000;
	
	//add JUMP?
	assign ex_jump = (ex_opcode == p_JUMPL) ? lflag :
				(ex_opcode == p_JUMPG) ? gflag :
				(ex_opcode == p_JUMPE) ? zflag :
				(ex_opcode == p_JUMPNE) ? ~zflag : 1'b0;

	always @(r_DEC_HIT) begin
		r_NEXT_EX_HIT <= r_DEC_HIT;
	end

	always @(posedge rst) begin
		btb_target = 16'd0;
		btb_prediction = 1'b0;
		r_DEC_HIT = 4'd0;
		r_NEXT_EX_HIT = 4'd0;
		r_EX_HIT = 4'd0;
	end

	always @(negedge clk) begin
		r_EX_HIT <= r_NEXT_EX_HIT;

		case (hit)
			HIT_WAY_1: begin
				btb_prediction <= prediction[0];
				btb_target <= target[15:0];
				r_DEC_HIT <= 4'b0001;
			end
			HIT_WAY_2: begin
				btb_prediction <= prediction[1];
				btb_target <= target[31:16];
				r_DEC_HIT <= 4'b0010;
			end
			HIT_WAY_3: begin
				btb_prediction <= prediction[2];
				btb_target <= target[47:32];
				r_DEC_HIT <= 4'b0100;
			end
			HIT_WAY_4: begin
				btb_prediction <= prediction[3];
				btb_target <= target[63:48];
				r_DEC_HIT <= 4'b1000;
			end
			default: begin
				btb_prediction <= 0;
				btb_target <= {16{1'b0}};
				r_DEC_HIT <= (entry_en == 4'b0001) ? 4'b0001 :
						(entry_en == 4'b0010) ? 4'b0010 :	
						(entry_en == 4'b0100) ? 4'b0100 : 4'b1000;
			end
		endcase
	end

endmodule
