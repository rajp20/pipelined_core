module bp_counter(out, clk, actual, enable, rst);
	input clk, actual, enable, rst;
	output out;

	//PREDICTOR STATE
	reg [1:0] r_SM;	
	//State Parameters
	parameter s_STRONG_NTAKEN = 2'b00;
	parameter s_WEAK_NTAKEN = 2'b01;
	parameter s_WEAK_TAKEN = 2'b10;
	parameter s_STRONG_TAKEN = 2'b11;

	//Behaviorial Description
	always @(posedge rst) begin
		if (rst)
		begin
			r_SM <= s_WEAK_NTAKEN;
		end
	end

	always @(negedge clk)
	begin
		if (enable) begin
			case (r_SM)
				s_STRONG_NTAKEN:
				begin
					r_SM <= (actual == 1) ? s_WEAK_NTAKEN : s_STRONG_NTAKEN;
				end
				s_WEAK_NTAKEN:
				begin
					r_SM <= (actual == 1) ? s_WEAK_TAKEN : s_STRONG_NTAKEN;
				end
				s_WEAK_TAKEN:
				begin
					r_SM <= (actual == 1) ? s_STRONG_TAKEN : s_WEAK_NTAKEN;
				end
				s_STRONG_TAKEN:
				begin
					r_SM <= (actual == 1) ? s_STRONG_TAKEN : s_WEAK_TAKEN;
				end
			endcase
		end
	end

	//PREDICTIONS
	assign out = r_SM[1];
endmodule
