//////////////////////////////////////////////////////////////////////////////////
//	REGISTER FILE stage of the pipelined processor.
//
//	UPDATED: Nov. 21, 2019
//	AUTHOR: Blaze Kotsenburg, Raj Patel
//////////////////////////////////////////////////////////////////////////////////
module RegisterFile(
	input clk,
	input [4:0] read_index_1,
	input [4:0] read_index_2,
	input [4:0] write_index,
	input [15:0] write_data,
	input write_enable,
	output reg [15:0] read_data_1,
	output reg [15:0] read_data_2
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
   	reg [15:0] r28;
   	reg [15:0] r29;
   	reg [15:0] r30;
   	reg [15:0] r31;


	always@*
	begin
	   case(read_index_1)
	     0 :   read_data_1 = r0;
	     1 :   read_data_1 = r1;
	     2 :   read_data_1 = r2;
	     3 :   read_data_1 = r3;
	     4 :   read_data_1 = r4;
	     5 :   read_data_1 = r5;
	     6 :   read_data_1 = r6;
	     7 :   read_data_1 = r7;
	     8 :   read_data_1 = r8;
	     9 :   read_data_1 = r9;
	     10 :  read_data_1 = r10;
	     11 :  read_data_1 = r11;
	     12 :  read_data_1 = r12;
	     13 :  read_data_1 = r13;
	     14 :  read_data_1 = r14;
	     15 :  read_data_1 = r15;
	     16 :  read_data_1 = r16;
	     17 :  read_data_1 = r17;
	     18 :  read_data_1 = r18;
	     19 :  read_data_1 = r19;
	     20 :  read_data_1 = r20;
	     21 :  read_data_1 = r21;
	     22 :  read_data_1 = r22;
	     23 :  read_data_1 = r23;
	     24 :  read_data_1 = r24;
	     25 :  read_data_1 = r25;
	     26 :  read_data_1 = r26;
	     27 :  read_data_1 = r27;
	     28 :  read_data_1 = r28;
	     29 :  read_data_1 = r29;
	     30 :  read_data_1 = r30;
	     31 :  read_data_1 = r31;
	   endcase
	   
	   case(read_index_2)
	     0 :   read_data_2 = r0;
	     1 :   read_data_2 = r1;
	     2 :   read_data_2 = r2;
	     3 :   read_data_2 = r3;
	     4 :   read_data_2 = r4;
	     5 :   read_data_2 = r5;
	     6 :   read_data_2 = r6;
	     7 :   read_data_2 = r7;
	     8 :   read_data_2 = r8;
	     9 :   read_data_2 = r9;
	     10 :  read_data_2 = r10;
	     11 :  read_data_2 = r11;
	     12 :  read_data_2 = r12;
	     13 :  read_data_2 = r13;
	     14 :  read_data_2 = r14;
	     15 :  read_data_2 = r15;
	     16 :  read_data_2 = r16;
	     17 :  read_data_2 = r17;
	     18 :  read_data_2 = r18;
	     19 :  read_data_2 = r19;
	     20 :  read_data_2 = r20;
	     21 :  read_data_2 = r21;
	     22 :  read_data_2 = r22;
	     23 :  read_data_2 = r23;
	     24 :  read_data_2 = r24;
	     25 :  read_data_2 = r25;
	     26 :  read_data_2 = r26;
	     27 :  read_data_2 = r27;
	     28 :  read_data_2 = r28;
	     29 :  read_data_2 = r29;
	     30 :  read_data_2 = r30;
	     31 :  read_data_2 = r31;
	   endcase
	end

	always@(posedge clk)
	begin
	  if(write_enable)
	  begin
	     case(write_index)
	       0 :   r0 <= write_data;
	       1 :   r1 <= write_data;
	       2 :   r2 <= write_data;
	       3 :   r3 <= write_data;
	       4 :   r4 <= write_data;
	       5 :   r5 <= write_data;
	       6 :   r6 <= write_data;
	       7 :   r7 <= write_data;
	       8 :   r8 <= write_data;
	       9 :   r9 <= write_data;
	       10 :  r10 <= write_data;
	       11 :  r11 <= write_data;
	       12 :  r12 <= write_data;
	       13 :  r13 <= write_data;
	       14 :  r14 <= write_data;
	       15 :  r15 <= write_data;
	       16 :  r16 <= write_data;
	       17 :  r17 <= write_data;
	       18 :  r18 <= write_data;
	       19 :  r19 <= write_data;
	       20 :  r20 <= write_data;
	       21 :  r21 <= write_data;
	       22 :  r22 <= write_data;
	       23 :  r23 <= write_data;
	       24 :  r24 <= write_data;
	       25 :  r25 <= write_data;
	       26 :  r26 <= write_data;
	       27 :  r27 <= write_data;
	       28 :  r28 <= write_data;
	       29 :  r29 <= write_data;
	       30 :  r30 <= write_data;
	       31 :  r31 <= write_data;
	     endcase
	  end
	end
   
endmodule
