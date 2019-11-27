module btb_tb;
	wire clk, rst;
	wire [15:0] fetch_pc;
	wire [15:0] ex_pc;
	wire [15:0] target_entry;
	wire [3:0] ex_opcode;
	wire gflag;
	wire zflag;
	wire lflag;
	wire table_hit;
	wire [15:0] b_target;

	btb U1 (
		.clk (clk),
		.rst(rst),
		.fetch_pc(fetch_pc),
		.ex_pc(ex_pc),
		.ex_opcode(ex_opcode),
		.target_entry(target_entry),
		.gflag(gflag),
		.lflag(lflag),
		.zflag(zflag),
		.btb_target(b_target),
		.btb_prediction(table_hit));
	
	reg clk_reg, rst_reg;
	reg [15:0] r_fetch_pc;
	reg [15:0] r_ex_pc;
	reg [3:0] r_ex_opcode;
	reg [15:0] r_target_entry;
	reg r_gflag;
	reg r_zflag;
	reg r_lflag;
	
	reg [15:0] r_counter;

	assign clk = clk_reg;
	assign rst = rst_reg;
	assign fetch_pc = r_fetch_pc;
	assign ex_pc =r_ex_pc;
	assign ex_opcode = r_ex_opcode;
	assign target_entry = r_target_entry;
	assign gflag = r_gflag;
	assign lflag = r_lflag;
	assign zflag = r_zflag;

	
	// Parameters for Counter state
	parameter s_RESET = 3;
	parameter s_DISPLAY = 2;

	initial
	begin
	r_counter = 0;
	clk_reg = 0;
	rst_reg = 0;
	r_fetch_pc = 16'd0;
	r_ex_pc = 16'd0;
	r_ex_opcode = 4'b0000;
	r_target_entry = 16'd0;
	r_gflag = 1'b0;
	r_zflag = 1'b0;
	r_lflag = 1'b0;

	#1 rst_reg = 1;
	#1 rst_reg = 0;
	end

	always
	begin
		#5 clk_reg = ~clk_reg;
	
	end

	always begin
		#100;
		r_fetch_pc = 16'd0;
		r_ex_pc = 16'd2;
		r_ex_opcode = 4'b1001;
		r_target_entry = 16'd2;
		r_counter <= 2;
	end

	always @(posedge clk)
	begin
		if (r_counter < 2) begin
			r_fetch_pc = r_fetch_pc + 16'd1;
			r_ex_pc = 16'd0;
			r_ex_opcode = 4'b0000;
			r_target_entry = 16'd0;
		end
		else begin
			r_fetch_pc = r_fetch_pc + 16'd1;
			r_ex_pc = r_ex_pc + 16'd1;
			r_ex_opcode = 4'b1001;
			r_target_entry = 16'd2;
			r_zflag = ~r_zflag;
		end
		//$display("In: %d	Count: %d	Current Prediction: %d ", in, counter, result);
		r_counter <= r_counter + 1;
		//rst_reg <= 0;
	end

	
endmodule
