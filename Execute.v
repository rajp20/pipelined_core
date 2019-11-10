module Execute(
	input clk,
	input [4:0] control,
	input [15:0] source_reg,
	input [15:0] dest_reg,
	input [15:0] npc,
	output reg [15:0] dest_out_reg,
	output reg [15:0] result,
	output reg [15:0] target,
	output reg [4:0] control,
	output reg WRITE_ENABLE //Not sure if we want this to be a reg or output reg
);

parameter ADD     = 5'b00000;
parameter SUB     = 5'b00001;
parameter ADDI     = 5'b00010;
parameter SHLLI     = 5'b00011;
parameter SHRLI     = 5'b00100;
parameter JUMP     = 5'b00101;
parameter JUMPLI   = 5'b00110;
parameter JUMPL     = 5'b00111;
parameter JUMPG     = 5'b01000;
parameter JUMPE     = 5'b01001;
parameter JUMPNE   = 5'b01010;
parameter CMP     = 5'b01011;
parameter RET     = 5'b01100;
parameter LOAD     = 5'b01101;
parameter LOADI     = 5'b01110;
parameter STORE     = 5'b01111;
parameter MOV     = 5'b10000;

assign target = npc + control;

reg [4:0] immediate; //Not sure if we need different immediate sizes or not.

always@(posedge clk)
begin
	case(control):
		ADD: begin
			result = source_reg + dest_reg;
			WRITE_ENABLE = 1;
		end
		SUB: begin
			result = source_reg - dest_reg;
			WRITE_ENABLE = 1;
		end
		ADDI: begin
			result = source_reg + immediate;
			WRITE_ENABLE = 1;
		end
		SHLLI: begin
			result = source_reg << immediate;
			WRITE_ENABLE = 1;
		end
		SHRLI:
			result = source_reg >> immediate;
			WRITE_ENABLE = 1;
		end
		JUMP: begin
			npc = immediate;
		end
		JUMPLI: begin
			//flag
		end
		JUMPL: begin
			//flag
		edn
		JUMPG: begin
			//flag
		end
		JUMPE: begin
			// flag
		end
		JUMPNE: begin
			//flag
		end
		CMP: begin

		end
		RET: begin

		end
		MOV: begin
			result = dest_reg;
			// write_index = dest_reg_index; //not sure if what we want to actually set here
			WRITE_ENABLE = 1;
		end
	endcase
end

end