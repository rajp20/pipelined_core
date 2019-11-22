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
	input [4:0] dest_index_in,
	input [6:0] immediate,
	output reg [4:0] dest_index_out,
	output reg [15:0] output_reg,
	output reg [15:0] result_out,
	output reg [15:0] target,
	output reg [4:0] control_out,
	output reg WRITE_ENABLE, //Not sure if we want this to be a reg or output reg
	output reg ZF,
	output reg GF,
	output reg LF
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

//Initialize status flags for JUMP and CMP instructions
initial ZF = 0;
initial GF = 0;
initial LF = 0;

//Set up next status flags
reg ZF_next;
reg GF_next;
reg LF_next;

//Current state unlatched
reg [15:0] result;
reg [15:0] target_next;

//Set all status flags to result of corresponding next status flag
always@(posedge clk)
begin
	ZF <= ZF_next;
	GF <= GF_next;
	LF <= LF_next;
	dest_index_out <= dest_index_in;
	result_out <= result;
	output_reg <= reg2_data;
	target <= target_next;
	control_out <= control_in;
end

//Updates for specific opcodes
always@(*)
begin

	//Reset next status flags so that they are only changed on CMP and JUMP instructions
	ZF_next = 1'b0;
	GF_next = 1'b0;
	LF_next = 1'b0;

	/************** BEGIN ALU **************/
	case(control_in):
		NOP: begin

		end
		SUB: begin
			result = reg1_data - reg2_data;
			ZF_next = (result == 16'b0) ? 1 : 0;
			WRITE_ENABLE = 1;
		end
		ADD: begin
			result = reg1_data + reg2_data;
			ZF_next = (result == 16'b0) ? 1 : 0;
			WRITE_ENABLE = 1;
		end
		ADDI: begin
			result = reg1_data + immediate;
			ZF_next = (result == 16'b0) ? 1 : 0;
			WRITE_ENABLE = 1;
		end
		SHLLI: begin
			result = reg1_data << immediate;
			ZF_next = (result == 16'b0) ? 1 : 0;
			WRITE_ENABLE = 1;
		end
		SHRLI:
			result = reg1_data >> immediate;
			ZF_next = (result == 16'b0) ? 1 : 0;
			WRITE_ENABLE = 1;
		end
		JUMP: begin
			target_next = npc + reg2_data;
		end
		JUMPL: begin
			if(LF) 
			begin
				target_next = (npc + 1'b1) + {{9{immediate[6]}}, immediate};
			end
		end
		JUMPG: begin
			if(GF)
			begin
				target_next = (npc + 1'b1) + {{9{immediate[6]}}, immediate};
			end
		end
		JUMPE: begin
			if(ZF)
			begin
				target_next = (npc + 1'b1) + {{9{immediate[6]}}, immediate};
			end
		end
		JUMPNE: begin
			if(ZF == 0)
			begin
				target_next = (npc + 1'b1) + {{9{immediateL[6]}}, immediate};
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
			result = {{11{0}}, dest_index_out}; //Make top 11 bits 0 and fill bottom 5 bits with destination index to fit width correctly
		end
		LOADI: begin
			result = {{9{0}}, immediate}; //Make top 9 bits 0 and fill bottom 7 bits with immediate index to fit width correctly
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
