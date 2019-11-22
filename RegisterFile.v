//////////////////////////////////////////////////////////////////////////////////
//	REGISTER FILE stage of the pipelined processor.
//
//	UPDATED: Nov. 21, 2019
//	AUTHOR: Blaze Kotsenburg, Raj Patel
//////////////////////////////////////////////////////////////////////////////////
module RegisterFile(input             clk,
	                input [4:0]       reg1_index,
	                input [4:0]       reg2_index,
	                input [4:0]       write_index,
	                input [15:0]      write_data,
	                input             write_en,
	                output reg [15:0] reg1_data,
	                output reg [15:0] reg2_data);

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
	   case(reg1_index)
	     0 :   reg1_data = r0;
	     1 :   reg1_data = r1;
	     2 :   reg1_data = r2;
	     3 :   reg1_data = r3;
	     4 :   reg1_data = r4;
	     5 :   reg1_data = r5;
	     6 :   reg1_data = r6;
	     7 :   reg1_data = r7;
	     8 :   reg1_data = r8;
	     9 :   reg1_data = r9;
	     10 :  reg1_data = r10;
	     11 :  reg1_data = r11;
	     12 :  reg1_data = r12;
	     13 :  reg1_data = r13;
	     14 :  reg1_data = r14;
	     15 :  reg1_data = r15;
	     16 :  reg1_data = r16;
	     17 :  reg1_data = r17;
	     18 :  reg1_data = r18;
	     19 :  reg1_data = r19;
	     20 :  reg1_data = r20;
	     21 :  reg1_data = r21;
	     22 :  reg1_data = r22;
	     23 :  reg1_data = r23;
	     24 :  reg1_data = r24;
	     25 :  reg1_data = r25;
	     26 :  reg1_data = r26;
	     27 :  reg1_data = r27;
	     28 :  reg1_data = r28;
	     29 :  reg1_data = r29;
	     30 :  reg1_data = r30;
	     31 :  reg1_data = r31;
	   endcase
	   
	   case(reg2_index)
	     0 :   reg2_data = r0;
	     1 :   reg2_data = r1;
	     2 :   reg2_data = r2;
	     3 :   reg2_data = r3;
	     4 :   reg2_data = r4;
	     5 :   reg2_data = r5;
	     6 :   reg2_data = r6;
	     7 :   reg2_data = r7;
	     8 :   reg2_data = r8;
	     9 :   reg2_data = r9;
	     10 :  reg2_data = r10;
	     11 :  reg2_data = r11;
	     12 :  reg2_data = r12;
	     13 :  reg2_data = r13;
	     14 :  reg2_data = r14;
	     15 :  reg2_data = r15;
	     16 :  reg2_data = r16;
	     17 :  reg2_data = r17;
	     18 :  reg2_data = r18;
	     19 :  reg2_data = r19;
	     20 :  reg2_data = r20;
	     21 :  reg2_data = r21;
	     22 :  reg2_data = r22;
	     23 :  reg2_data = r23;
	     24 :  reg2_data = r24;
	     25 :  reg2_data = r25;
	     26 :  reg2_data = r26;
	     27 :  reg2_data = r27;
	     28 :  reg2_data = r28;
	     29 :  reg2_data = r29;
	     30 :  reg2_data = r30;
	     31 :  reg2_data = r31;
	   endcase
	end

	always@(posedge clk)
	begin
	  if(write_en)
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
