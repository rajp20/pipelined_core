module bp_counter_tb;
	wire clk, rst;
	wire in;
	wire result;

	bp_counter U1 (
		.clk (clk),
		.in (in),
		.rst (rst),
		.out (result));
	
	reg clk_reg, rst_reg;
	reg in_reg;
	reg [1:0] counter;
	
	// Parameters for Counter state
	parameter s_RESET = 3;
	parameter s_DISPLAY = 2;

	initial
	begin
	counter = 0;
	clk_reg = 0;
	rst_reg = 0;
	in_reg = 1;
	#1 rst_reg = 1;
	#1 rst_reg = 0;
	end

	always
	begin
	#5 clk_reg = ~clk_reg;
	end

	always @(posedge clk)
	begin
		if (counter == 2)
		begin
			#1 in_reg <= ~in_reg;
		end
		else
		begin
			in_reg <= in_reg;
		end
		$display("In: %d	Count: %d	Current Prediction: %d ", in, counter, result);
		counter <= counter + 1;
		rst_reg <= 0;
	end

	assign clk = clk_reg;
	assign rst = rst_reg;
	assign in = in_reg;
endmodule
