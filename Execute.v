//////////////////////////////////////////////////////////////////////////////////
//	Execution stage for the pipelined processor. This stage contains an ALU in 
//  a case statement to produce a result that will be fed back to DECODE stage and
//  the MEM stage.
//
//  UPDATED: Nov. 21, 2019
//  AUTHOR: Blaze Kotsenburg
//////////////////////////////////////////////////////////////////////////////////
module Execute(
	input clk,
	input [4:0] control_in,
	input [15:0] reg1_data,
	input [15:0] reg2_data,
	input [15:0] npc,
	input [5:0] dest_index_in,
	output reg [5:0] dest_out_index,
	output reg [15:0] result,
	output reg [15:0] target,
	output reg [4:0] control_out,
	output reg WRITE_ENABLE //Not sure if we want this to be a reg or output reg
);

// Parameters for each instruction that the processor can execute
parameter NOP    = 4'b0000;
parameter SUB    = 4'b0001;
parameter ADD    = 4'b0010;
parameter ADDI   = 4'b0011;
parameter SHLLI  = 4'b0100;
parameter SHRLI  = 4'b0101;
parameter JUMP   = 4'b0110;
parameter JUMPL  = 4'b0111;
parameter JUMPG  = 4'b1000;
parameter JUMPE  = 4'b1001;
parameter JUMPNE = 4'b1010;
parameter CMP    = 4'b1011;
parameter LOAD   = 4'b1100;
parameter LOADI  = 4'b1101;
parameter STORE  = 4'b1110;
parameter MOV    = 4'b1111;

//Target updates any time npc or control updates
assign target = npc + control_in;
//Assign the output control to the input control
assign control_out = control_in;
//Assign destination index
assign dest_out_index = dest_in_index;

reg [6:0] immediate; //Not sure if we need different immediate sizes or not.

//Initialize status flags for JUMP and CMP instructions

reg ZF; //Following MIPS ISA, ZF should update after every operation
reg GF;
reg LF;
initial ZF = 0;
initial GF = 0;
initial LF = 0;

//Set up next status flags
reg ZF_next;
reg GF_next;
reg LF_next;

//write_index will probably be needed for brandons MEM module for writing to memory

// This may not be what we want, might only want to update on npc change or control
always@(*)
begin

	/************** BEGIN ALU **************/
	case(control_in):
		NOP: begin

		end
		SUB: begin
			result = reg1_data - reg2_data;
			ZF = (result == 16'b0) ? 1 : 0;
			WRITE_ENABLE = 1;
		end
		ADD: begin
			result = reg1_data + reg2_data;
			ZF = (result == 16'b0) ? 1 : 0;
			WRITE_ENABLE = 1;
		end
		ADDI: begin
			result = reg1_data + immediate;
			ZF = (result == 16'b0) ? 1 : 0;
			WRITE_ENABLE = 1;
		end
		SHLLI: begin
			result = reg1_data << immediate;
			ZF = (result == 16'b0) ? 1 : 0;
			WRITE_ENABLE = 1;
		end
		SHRLI:
			result = reg1_data >> immediate;
			ZF = (result == 16'b0) ? 1 : 0;
			WRITE_ENABLE = 1;
		end
		JUMP: begin
			target = npc + reg2_data;
		end
		JUMPL: begin
			if(LF) 
			begin
				target = (npc + 1'b1) + {{9{immediate[6]}}, immediate};
			end
		end
		JUMPG: begin
			if(GF)
			begin
				target = (npc + 1'b1) + {{9{immediate[6]}}, immediate};
			end
		end
		JUMPE: begin
			if(ZF)
			begin
				target = (npc + 1'b1) + {{9{immediate[6]}}, immediate};
			end
		end
		JUMPNE: begin
			if(ZF == 0)
			begin
				target = (npc + 1'b1) + {{9{immediateL[6]}}, immediate};
			end
		end
		CMP: begin
			ZF_next = !(|(reg1_data - reg2_data)); //OR all the bits together and invert for ZF bit
			if ($signed(reg1_data) < $signed(reg2_data))
			begin
				LF_next = 1'b1;
			end
			if ($signed(reg1_data) > $signed(reg2_data))
			begin
				GF_next = 1'b1;
			end
		end
		LOAD: begin
			result = dest_out_index;
		end
		LOADI: begin
			//write_index = dest_reg_index;
			result = immediate;
			WRITE_ENABLE = 1;
		end
		STORE: begin
			result = reg1_data;
		end
		MOV: begin
			result = reg2_data;
			WRITE_ENABLE = 1;
		end
	endcase
	/************** END ALU **************/
end

endmodule