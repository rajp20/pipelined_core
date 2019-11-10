module Execute(
	input clk,
	input[4:0] control,
	input[15:0] sourceREG,
	input[15:0] destREG,
	input[15:0] npc,
	output reg[15:0] destOUT,
	output reg[15:0] result,
	output reg[15:0] target,
	output reg[4:0] control
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

always@(posedge clk)
begin
	case(control):
		
	endcase
end

end