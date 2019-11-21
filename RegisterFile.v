//////////////////////////////////////////////////////////////////////////////////
//	REGISTER FILE stage of the pipelined processor.
//
//	UPDATED: Nov. 10, 2019
//	AUTHOR: Blaze Kotsenburg
//////////////////////////////////////////////////////////////////////////////////
module RegisterFile(
	input clk,
	input [4:0] read_index_1,
	input [4:0] read_index_2,
	input [4:0] write_index,
	input [23:0] write_data,
	input WRITE_ENABLE,
	output reg [23:0] read_data_1,
	output reg [23:0] read_data_2
    );


	// 16-bit registers
	reg [15:0] r0;
	reg [15:0] r1;
	reg [15:0] r2;
	reg [15:0] r3;
	reg [15:0] r4;
	reg [15:0] r5;
	reg [15:0] r6;
	reg [15:0] r7;
	reg [15:0] r8;
	reg [15:0] r9;
	reg [15:0] r10;
	reg [15:0] r11;
	reg [15:0] r12;
	reg [15:0] r13;
	reg [15:0] r14;
	reg [15:0] r15;
	reg [15:0] r16;
	reg [15:0] r17;
	reg [15:0] r18;
	reg [15:0] r19;
	reg [15:0] r20;
	reg [15:0] r21;
	reg [15:0] r22;
	reg [15:0] r23;
	reg [15:0] r24;
	reg [15:0] r25;
	reg [15:0] r26;
	reg [15:0] r27;

	// 24-bit registers
	reg [23:0] lr0;
	reg [23:0] lr1;
	reg [23:0] lr2;
	reg [23:0] lr3;


	always@*
	begin
	  case(read_index_1)
		 0 : read_data_1 = {8'b0, r0};
		 1 : read_data_1 = {8'b0, r1};
		 2 : read_data_1 = {8'b0, r2};
		 3 : read_data_1 = {8'b0, r3};
		 4 : read_data_1 = {8'b0, r4};
		 5 : read_data_1 = {8'b0, r5};
		 6 : read_data_1 = {8'b0, r6};
		 7 : read_data_1 = {8'b0, r7};
		 8 : read_data_1 = {8'b0, r8};
		 9 : read_data_1 = {8'b0, r9};
		 10 :  read_data_1 = {8'b0, r10};
		 11 :  read_data_1 = {8'b0, r11};
		 12 :  read_data_1 = {8'b0, r12};
		 13 :  read_data_1 = {8'b0, r13};
		 14 :  read_data_1 = {8'b0, r14};
		 15 :  read_data_1 = {8'b0, r15};
		 16 :  read_data_1 = {8'b0, r16};
		 17 :  read_data_1 = {8'b0, r17};
		 18 :  read_data_1 = {8'b0, r18};
		 19 :  read_data_1 = {8'b0, r19};
		 20 :  read_data_1 = {8'b0, r20};
		 21 :  read_data_1 = {8'b0, r21};
		 22 :  read_data_1 = {8'b0, r22};
		 23 :  read_data_1 = {8'b0, r23};
		 24 :  read_data_1 = {8'b0, r24};
		 25 :  read_data_1 = {8'b0, r25};
		 26 :  read_data_1 = {8'b0, r26};
		 27 :  read_data_1 = {8'b0, r27};
		 28 :  read_data_1 = lr0;
		 29 :  read_data_1 = lr1;
		 30 :  read_data_1 = lr2;
		 31 :  read_data_1 = lr3;
	  endcase

	  case(read_index_2)
		 0 : read_data_2 = {8'b0, r0};
		 1 : read_data_2 = {8'b0, r1};
		 2 : read_data_2 = {8'b0, r2};
		 3 : read_data_2 = {8'b0, r3};
		 4 : read_data_2 = {8'b0, r4};
		 5 : read_data_2 = {8'b0, r5};
		 6 : read_data_2 = {8'b0, r6};
		 7 : read_data_2 = {8'b0, r7};
		 8 : read_data_2 = {8'b0, r8};
		 9 : read_data_2 = {8'b0, r9};
		 10 :  read_data_2 = {8'b0, r10};
		 11 :  read_data_2 = {8'b0, r11};
		 12 :  read_data_2 = {8'b0, r12};
		 13 :  read_data_2 = {8'b0, r13};
		 14 :  read_data_2 = {8'b0, r14};
		 15 :  read_data_2 = {8'b0, r15};
		 16 :  read_data_2 = {8'b0, r16};
		 17 :  read_data_2 = {8'b0, r17};
		 18 :  read_data_2 = {8'b0, r18};
		 19 :  read_data_2 = {8'b0, r19};
		 20 :  read_data_2 = {8'b0, r20};
		 21 :  read_data_2 = {8'b0, r21};
		 22 :  read_data_2 = {8'b0, r22};
		 23 :  read_data_2 = {8'b0, r23};
		 24 :  read_data_2 = {8'b0, r24};
		 25 :  read_data_2 = {8'b0, r25};
		 26 :  read_data_2 = {8'b0, r26};
		 27 :  read_data_2 = {8'b0, r27};
		 28 :  read_data_2 = lr0;
		 29 :  read_data_2 = lr1;
		 30 :  read_data_2 = lr2;
		 31 :  read_data_2 = lr3;
	  endcase
	end

	always@(posedge clk)
	begin
	  if(WRITE_ENABLE)
	  begin
		 case(write_index)
			0 : r0 <= write_data[15:0];
			1 : r1 <= write_data[15:0];
			2 : r2 <= write_data[15:0];
			3 : r3 <= write_data[15:0];
			4 : r4 <= write_data[15:0];
			5 : r5 <= write_data[15:0];
			6 : r6 <= write_data[15:0];
			7 : r7 <= write_data[15:0];
			8 : r8 <= write_data[15:0];
			9 : r9 <= write_data[15:0];
			10 :  r10 <= write_data[15:0];
			11 :  r11 <= write_data[15:0];
			12 :  r12 <= write_data[15:0];
			13 :  r13 <= write_data[15:0];
			14 :  r14 <= write_data[15:0];
			15 :  r15 <= write_data[15:0];
			16 :  r16 <= write_data[15:0];
			17 :  r17 <= write_data[15:0];
			18 :  r18 <= write_data[15:0];
			19 :  r19 <= write_data[15:0];
			20 :  r20 <= write_data[15:0];
			21 :  r21 <= write_data[15:0];
			22 :  r22 <= write_data[15:0];
			23 :  r23 <= write_data[15:0];
			24 :  r24 <= write_data[15:0];
			25 :  r25 <= write_data[15:0];
			26 :  r26 <= write_data[15:0];
			27 :  r27 <= write_data[15:0];
			28 :  lr0 <= write_data;
			29 :  lr1 <= write_data;
			30 :  lr2 <= write_data;
			31 :  lr3 <= write_data;
		 endcase
	  end
	end

endmodule
