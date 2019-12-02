module btb(r_nop, btb_target, btb_prediction, clk, rst, fetch_pc, ex_pc, ex_opcode, target_entry, lflag, gflag, zflag);
	input clk, rst;
	input [15:0] fetch_pc;
	input [15:0] ex_pc;
	input [3:0] ex_opcode;
	input [15:0] target_entry;
	input lflag, gflag, zflag;

	output reg [15:0] btb_target;
	output reg btb_prediction;
	output reg r_nop;
	
	reg [3:0] r_DEC_HIT;
	reg [3:0] r_NEXT_EX_HIT;
	reg [3:0] r_EX_HIT;
	reg [15:0] next_target;
	reg next_prediction;
	reg next_nop;
	
	wire [3:0] hit;
	wire [3:0] insert_bubble;
	wire [3:0] update;
	wire [3:0] prediction;
	wire [63:0] bubble_target;
   	wire [15:0] next_bubble_target;
	wire [63:0] target;
	wire [3:0] empty;
	wire [3:0] entry_en;
	wire ex_jump;
	wire jump_ins;

	parameter HIT_WAY_1 = 4'b0001;
	parameter HIT_WAY_2 = 4'b0010;
	parameter HIT_WAY_3 = 4'b0100;
	parameter HIT_WAY_4 = 4'b1000;

	parameter p_JUMP = 4'b0110;
	parameter p_JUMPL = 4'b0111;
	parameter p_JUMPG = 4'b1000;
	parameter p_JUMPE = 4'b1001;
	parameter p_JUMPNE = 4'b1010;

	btb_way W0(.clk(clk), .rst(rst), .current_pc(fetch_pc), .entry_en(entry_en[0]), .update_en(update[0]), .jump_en(ex_jump), .entry_pc(ex_pc), .entry_target(target_entry), .way_prediction(prediction[0]), .way_hit(hit[0]), .way_bubble(insert_bubble[0]), .way_update(update[0]), .way_empty(empty[0]), .way_bubble_target(bubble_target[15:0]), .way_target(target[15:0]));
	btb_way W1(.clk(clk), .rst(rst), .current_pc(fetch_pc), .entry_en(entry_en[1]), .update_en(update[1]), .jump_en(ex_jump), .entry_pc(ex_pc), .entry_target(target_entry), .way_prediction(prediction[1]), .way_hit(hit[1]), .way_bubble(insert_bubble[1]), .way_update(update[1]), .way_empty(empty[1]), .way_bubble_target(bubble_target[31:16]), .way_target(target[31:16]));
	btb_way W2(.clk(clk), .rst(rst), .current_pc(fetch_pc), .entry_en(entry_en[2]), .update_en(update[2]), .jump_en(ex_jump), .entry_pc(ex_pc), .entry_target(target_entry), .way_prediction(prediction[2]), .way_hit(hit[2]), .way_bubble(insert_bubble[2]), .way_update(update[2]), .way_empty(empty[2]), .way_bubble_target(bubble_target[47:32]), .way_target(target[47:32]));
	btb_way W3(.clk(clk), .rst(rst), .current_pc(fetch_pc), .entry_en(entry_en[3]), .update_en(update[3]), .jump_en(ex_jump), .entry_pc(ex_pc), .entry_target(target_entry), .way_prediction(prediction[3]), .way_hit(hit[3]), .way_bubble(insert_bubble[3]), .way_update(update[3]), .way_empty(empty[3]), .way_bubble_target(bubble_target[63:48]), .way_target(target[63:48]));

	assign jump_ins = (ex_opcode == p_JUMP)|(ex_opcode == p_JUMPL)|(ex_opcode == p_JUMPG)|(ex_opcode == p_JUMPE)|(ex_opcode == p_JUMPNE);
	
	assign entry_en = (|update == 1'b1) ? 4'b0000 :
				jump_ins&((empty[0] == 1'b1) ? 4'b0001 : 
				(empty[1] == 1'b1) ? 4'b0010 :
				(empty[2] == 1'b1) ? 4'b0100 : 4'b1000);

	assign next_bubble_target = (insert_bubble == 4'b0001) ? bubble_target[15:0] :
					(insert_bubble == 4'b0010) ? bubble_target[31:16] :
					(insert_bubble == 4'b0100) ? bubble_target[47:32] :
					(insert_bubble == 4'b1000) ? bubble_target[63:48] : 16'd0;
	
	//assign update_en = 
	
	//add JUMP?
	assign ex_jump = (ex_opcode == p_JUMP) ? 1'b1 :
				(ex_opcode == p_JUMPL) ? lflag :
				(ex_opcode == p_JUMPG) ? gflag :
				(ex_opcode == p_JUMPE) ? zflag :
				(ex_opcode == p_JUMPNE) ? ~zflag : 1'b0;

	always @(r_DEC_HIT) begin
		r_NEXT_EX_HIT <= r_DEC_HIT;
       if (rst)
         r_NEXT_EX_HIT <= 4'd0;
	end
	
	always @(posedge clk) begin
	   btb_prediction <= next_prediction;
	   btb_target <= next_target;
	   r_nop <= next_nop;
       if (rst) begin
          btb_target <= 16'd0;
          btb_prediction <= 1'b0;
       end
	end

	always @(negedge clk) begin
		r_EX_HIT <= r_NEXT_EX_HIT;

       if (rst) begin
		  r_EX_HIT <= 4'd0;
          r_DEC_HIT <= 4'd0;
       end
	   next_nop <= 1'b0;

		if (|insert_bubble) begin
			next_nop <= 1'b1;
			next_prediction <= 1'b1;
			r_DEC_HIT <= 4'b0000;
			r_EX_HIT <= 4'b0000;
			if (ex_jump) begin
				next_target <= next_bubble_target;
			end
			else begin
				next_target <= ex_pc + 16'd1;
			end
			
			
		end
		else begin
			case (hit)
				HIT_WAY_1: begin
					next_prediction <= prediction[0];
					next_target <= target[15:0];
					r_DEC_HIT <= 4'b0001;
				end
				HIT_WAY_2: begin
					next_prediction <= prediction[1];
					next_target <= target[31:16];
					r_DEC_HIT <= 4'b0010;
				end
				HIT_WAY_3: begin
					next_prediction <= prediction[2];
					next_target <= target[47:32];
					r_DEC_HIT <= 4'b0100;
				end
				HIT_WAY_4: begin
					next_prediction <= prediction[3];
					next_target <= target[63:48];
					r_DEC_HIT <= 4'b1000;
				end
				default: begin
					next_prediction <= 0;
					next_target <= {16{1'b0}};
					r_DEC_HIT <= jump_ins&((entry_en == 4'b0001) ? 4'b0001 :
							(entry_en == 4'b0010) ? 4'b0010 :	
							(entry_en == 4'b0100) ? 4'b0100 : 4'b1000);
				end
			endcase
		end
	end

endmodule
