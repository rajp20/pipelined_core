//////////////////////////////////////////////////////////////////////////////////
//  Execution testbench module. This testbench is used to develop and test all
//  ALU operations in the Execution stage of the pipelined CPU.
//
//  UPDATED: Nov. 23, 2019
//  AUTHOR: Blaze Kotsenburg
//////////////////////////////////////////////////////////////////////////////////
module Execute_TB;
//Inputs to simulate Execute module
reg clk;
reg [4:0]  control_in, dest_index_in;
reg [15:0] reg1_data, reg2_data, npc;
reg [6:0]  immediate;
//Outputs to simulate Execute module
wire [4:0] dest_index_out;
wire [4:0] control_out;
wire [15:0] output_reg;
wire [15:0] result_out;
wire [15:0] target;
wire DEST_REG_WRITE_EN;
wire ZF;
wire GF;
wire LF;
//Opcode state
reg [4:0] opcode;

//Create an instance of the Execute module for testing
Execute mut(
//INPUTS
.clk(clk),
.control_in(control_in),
.dest_index_in(dest_index_in),
.reg1_data(reg1_data),
.reg2_data(reg2_data),
.npc(npc),
.immediate(immediate),
//OUTPUTS
.dest_index_out(dest_index_out),
.control_out(control_out),
.output_reg(output_reg),
.result_out(result_out),
.target(target),
.DEST_REG_WRITE_EN(DEST_REG_WRITE_EN),
.ZF(ZF),
.GF(GF),
.LF(LF)
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

//Initialize values needed to run the Execute module
initial
begin: CLOCK_GENERATOR
	clk = 1'b1;
	opcode = 5'b0;
	//Initialize inputs to begin testing with SUB instruction
	control_in    = 5'b00000; //SUB opcode
	dest_index_in = 5'b00000; //Simulate dest index as $R2
	reg1_data     = 16'd0;   //R1 data is 10 in decimal
	reg2_data     = 16'd0;    //R2 data is 3
        npc           = 16'd0;    //NPC set to 0
        immediate     = 7'd0;     //Immediate value set to zero
	#5 clk = ~clk;
	//TODO: fix issue from allowing to see first result of testing sequence
end

//Beginning of testing sequence
begin
	always
	begin
		#5 clk = ~clk;
		if(clk)
		begin
			
			case(opcode)

				NOP: begin
					control_in = control_in + 1'b1;
					opcode = opcode + 1'b1;
				end
				SUB: begin
					//Console validation for SUB operation
					//Initialize inputs to begin testing with SUB instruction
					control_in    = SUB; //SUB opcode
					dest_index_in = 5'b00010; //Simulate dest index as $R2
					reg1_data     = 16'd10;   //R1 data is 10 in decimal
					reg2_data     = 16'd3;    //R2 data is 3
			        	npc           = 16'd0;    //NPC set to 0
			        	immediate     = 7'd0;     //Immediate value set to zero

					$display("\nOpcode: SUB\n reg1_data: ", reg1_data, "\n reg2_data: ", reg2_data, "\n result_out: ", result_out);

					opcode = opcode + 1'b1;
				end
				ADD: begin
					//Initialize inputs to begin testing with ADD instruction
					control_in    = ADD; //ADD opcode
					dest_index_in = 5'b00010; //Simulate dest index as $R2
					reg1_data     = 16'd10;   //R1 data is 10 in decimal
					reg2_data     = 16'd5;    //R2 data is 5
		        		npc           = 16'd0;    //NPC set to 0
		        		immediate     = 7'd0;     //Immediate value set to zero

		        		//Console validation for ADD operation
					$display("\nOpcode: ADD\n reg1_data: ", reg1_data, "\n reg2_data: ", reg2_data, "\n result_out: ", result_out);
					
					opcode = opcode + 1'b1;
				end
				ADDI: begin
					//Initialize inputs to begin testing with ADDI instruction
					control_in    = ADDI; //ADDI opcode
					dest_index_in = 5'b00010; //Simulate dest index as $R2
					reg1_data     = 16'd10;   //R1 data is 10 in decimal
					reg2_data     = 16'd5;    //R2 data is 5
		        		npc           = 16'd0;    //NPC set to 0
		        		immediate     = 7'd7;     //Immediate value set to zero

		        		//Console validation for ADDI operation
					$display("\nOpcode: ADDI\n reg1_data: ", reg1_data, "\n immediate: ", immediate, "\n result_out: ", result_out);

					opcode = opcode + 1'b1;
				end
				SHLLI: begin
					//Initialize inputs to begin testing with SHLLI instruction
					control_in    = SHLLI; //ADDI opcode
					dest_index_in = 5'b00010; //Simulate dest index as $R2
					reg1_data     = 16'd8;   //R1 data is 10 in decimal
					reg2_data     = 16'd0;    //R2 data is 5
		        		npc           = 16'd0;    //NPC set to 0
		        		immediate     = 7'd1;     //Immediate value set to zero

		        		//Console validation for SHLLI operation
					$display("\nOpcode: SHLLI\n reg1_data: ", reg1_data, "\n immediate: ", immediate, "\n result_out: ", result_out);

					opcode = opcode + 1'b1;
				end
				SHRLI: begin
					//Initialize inputs to begin testing with SHLLI instruction
					control_in    = SHRLI; //ADDI opcode
					dest_index_in = 5'b00010; //Simulate dest index as $R2
					reg1_data     = 16'd8;    //R1 data is 10 in decimal
					reg2_data     = 16'd0;    //R2 data is 5
		        		npc           = 16'd0;    //NPC set to 0
		        		immediate     = 7'd1;     //Immediate value set to zero

		        		//Console validation for SHRLI operation
					$display("\nOpcode: SHRLI\n reg1_data: ", reg1_data, "\n immediate: ", immediate, "\n result_out: ", result_out);

					opcode = opcode + 1'b1;
				end
				JUMP: begin
					//Initialize inputs to begin testing JUMP instruction
					control_in    = JUMP; //JUMP opcode
					dest_index_in = 5'b00010; //Simulate dest index as $R2
					reg1_data     = 16'd8;    //R1 data is 8 in decimal
					reg2_data     = 16'd10;    //R2 data is 10
		        		npc           = 16'd5;    //NPC set to 0
		        		immediate     = 7'd1;     //Immediate value set to one
			
					//Console Validation for JUMP
					$display("\nOpcode: JUMP\n npc: ", npc, "\n reg2_data", reg2_data, "\n immediate: ", immediate, "\n target: ", target, "\n result_out", result_out);

					opcode = JUMPL;
				end
				JUMPL: begin
					if(control_in != CMP)
					begin
						control_in = CMP;
						dest_index_in = 5'b00010; //Simulate dest index as $R2
						reg1_data     = 16'd4;    //R1 data is 8 in decimal
						reg2_data     = 16'd8;    //R2 data is 0
		        			npc           = 16'd0;    //NPC set to 0
		        			immediate     = 7'd1;     //Immediate value set to one

						$display("\n**CMP -> JUMPL**\nreg1_data: ", reg1_data, "\nreg2_data: ", reg2_data, "\nimmediate: ", immediate, "\ntarget: ", target, "\nZF: ", ZF, "\nLF: ", LF, "\nGF: ", GF);
					end
					else
					begin
						control_in = JUMPL;
						dest_index_in = 5'b00010; //Simulate dest index as $R2
						reg1_data     = 16'd4;    //R1 data is 8 in decimal
						reg2_data     = 16'd8;    //R2 data is 0
		        			npc           = 16'd0;    //NPC set to 0
		        			immediate     = 7'd1;     //Immediate value set to one

						$display("\nOpcode: JUMPL\nreg1_data: ", reg1_data, "\nreg2_data: ", reg2_data, "\nimmediate: ", immediate, "\ntarget: ", target, "\nZF: ", ZF, "\nLF: ", LF, "\nGF: ", GF);

						opcode = JUMPG;
					end
				end
				JUMPG: begin
					if(control_in != CMP)
					begin
						control_in = CMP;
						dest_index_in = 5'b00010; //Simulate dest index as $R2
						reg1_data     = 16'd8;    //R1 data is 8 in decimal
						reg2_data     = 16'd4;    //R2 data is 0
		        			npc           = 16'd0;    //NPC set to 0
		        			immediate     = 7'd1;     //Immediate value set to one

						$display("\n**CMP -> JUMPG**\nreg1_data: ", reg1_data, "\nreg2_data: ", reg2_data, "\nimmediate: ", immediate, "\ntarget: ", target, "\nZF: ", ZF, "\nLF: ", LF, "\nGF: ", GF);
					end
					else
					begin
						//Initialize inputs to begin testing JUMPG instruction
						control_in    = JUMPG; //JUMPG opcode
						dest_index_in = 5'b00010; //Simulate dest index as $R2
						reg1_data     = 16'd8;    //R1 data is 8 in decimal
						reg2_data     = 16'd0;    //R2 data is 0
		        			npc           = 16'd0;    //NPC set to 0
		        			immediate     = 7'd1;     //Immediate value set to one
			
						//Console Validation for JUMPG
						$display("\nOpcode: JUMPG\nreg1_data: ", reg1_data, "\nreg2_data: ", reg2_data, "\nimmediate: ", immediate, "\ntarget: ", target, "\nZF: ", ZF, "\nLF: ", LF, "\nGF: ", GF);

						opcode = JUMPE;
					end
				end
				JUMPE: begin
					if(control_in != CMP)
					begin
						control_in = CMP;
						dest_index_in = 5'b00010; //Simulate dest index as $R2
						reg1_data     = 16'd7;    //R1 data is 8 in decimal
						reg2_data     = 16'd7;    //R2 data is 0
		        			npc           = 16'd0;    //NPC set to 0
		        			immediate     = 7'd1;     //Immediate value set to one

						$display("\n**CMP -> JUMPE**\nreg1_data: ", reg1_data, "\nreg2_data: ", reg2_data, "\nimmediate: ", immediate, "\ntarget: ", target, "\nZF: ", ZF, "\nLF: ", LF, "\nGF: ", GF);
					end
					else
					begin
						//Initialize inputs to begin testing JUMPE instruction
						control_in    = JUMPE; //JUMPE opcode
						dest_index_in = 5'b00010; //Simulate dest index as $R2
						reg1_data     = 16'd8;    //R1 data is 8 in decimal
						reg2_data     = 16'd0;    //R2 data is 0
		        			npc           = 16'd0;    //NPC set to 0
		        			immediate     = 7'd1;     //Immediate value set to one
				
						//Console Validation for JUMPE
						$display("\nOpcode: JUMPE\nreg1_data: ", reg1_data, "\nreg2_data: ", reg2_data, "\nimmediate: ", immediate, "\ntarget: ", target, "\nZF: ", ZF, "\nLF: ", LF, "\nGF: ", GF);

						opcode = JUMPNE;
					end
				end
				JUMPNE: begin
					if(control_in != CMP)
					begin
						control_in = CMP;
						dest_index_in = 5'b00010; //Simulate dest index as $R2
						reg1_data     = 16'd8;    //R1 data is 8 in decimal
						reg2_data     = 16'd4;    //R2 data is 0
		        			npc           = 16'd0;    //NPC set to 0
		        			immediate     = 7'd1;     //Immediate value set to one

						$display("\n**CMP -> JUMPNE**\nreg1_data: ", reg1_data, "\nreg2_data: ", reg2_data, "\nimmediate: ", immediate, "\ntarget: ", target, "\nZF: ", ZF, "\nLF: ", LF, "\nGF: ", GF);
					end
					else
					begin
						//Initialize inputs to begin testing JUMPNE instruction
						control_in    = JUMPNE; //JUMPNE opcode
						dest_index_in = 5'b00010; //Simulate dest index as $R2
						reg1_data     = 16'd8;    //R1 data is 8 in decimal
						reg2_data     = 16'd0;    //R2 data is 0
		        			npc           = 16'd0;    //NPC set to 0
		        			immediate     = 7'd1;     //Immediate value set to one
				
						//Console Validation for JUMPNE
						$display("\n**Opcode: JUMPNE**\nreg1_data: ", reg1_data, "\nreg2_data: ", reg2_data, "\nimmediate: ", immediate, "\ntarget: ", target, "\nZF: ", ZF, "\nLF: ", LF, "\nGF: ", GF);

						opcode = LOAD;
					end
				end
				LOAD: begin
					//Initialize inputs to begin testing LOAD instruction
					control_in    = LOAD; //LOAD opcode
					dest_index_in = 5'b01000; //Simulate dest index as $R2
					reg1_data     = 16'd8;    //R1 data is 8 in decimal
					reg2_data     = 16'd0;    //R2 data is 0
		        		npc           = 16'd0;    //NPC set to 0
		        		immediate     = 7'd1;     //Immediate value set to one
				
					//Console Validation for LOAD
					$display("\n**Opcode: LOAD**\nreg1_data: ", reg1_data, "\nreg2_data: ", reg2_data, "\nimmediate: ", immediate, "\ntarget: ", target, "\nZF: ", ZF, "\nLF: ", LF, "\nGF: ", GF);

					opcode = LOADI;
				end
				LOADI: begin
					//Initialize inputs to begin testing LOADI instruction
					control_in    = LOADI; //LOADI opcode
					dest_index_in = 5'b00011; //Simulate dest index as $R2
					reg1_data     = 16'd8;    //R1 data is 8 in decimal
					reg2_data     = 16'd0;    //R2 data is 0
		        		npc           = 16'd0;    //NPC set to 0
		        		immediate     = 7'd31;     //Immediate value set to one
			
					//Console Validation for LOADI
					$display("\n**Opcode: LOADI**\nreg1_data: ", reg1_data, "\nreg2_data: ", reg2_data, "\nimmediate: ", immediate, "\ntarget: ", target, "\nZF: ", ZF, "\nLF: ", LF, "\nGF: ", GF);

					opcode = STORE;
				end
				STORE: begin
					//Initialize inputs to begin testing STORE instruction
					control_in    = STORE; //STORE opcode
					dest_index_in = 5'b00011; //Simulate dest index as $R2
					reg1_data     = 16'd16;    //R1 data is 8 in decimal
					reg2_data     = 16'd0;    //R2 data is 0
		        		npc           = 16'd0;    //NPC set to 0
		        		immediate     = 7'd31;     //Immediate value set to one
				
					//Console Validation for STORE
					$display("\n**Opcode: STORE**\nreg1_data: ", reg1_data, "\nreg2_data: ", reg2_data, "\nimmediate: ", immediate, "\ntarget: ", target, "\nZF: ", ZF, "\nLF: ", LF, "\nGF: ", GF);

					opcode = MOV;
				end
				MOV: begin
					//Initialize inputs to begin testing STORE instruction
					control_in    = STORE; //STORE opcode
					dest_index_in = 5'b00011; //Simulate dest index as $R2
					reg1_data     = 16'd8;    //R1 data is 8 in decimal
					reg2_data     = 16'd11;    //R2 data is 0
		        		npc           = 16'd0;    //NPC set to 0
		        		immediate     = 7'd31;     //Immediate value set to one
				
					//Console Validation for STORE
					$display("\n**Opcode: STORE**\nreg1_data: ", reg1_data, "\nreg2_data: ", reg2_data, "\nimmediate: ", immediate, "\ntarget: ", target, "\nZF: ", ZF, "\nLF: ", LF, "\nGF: ", GF);

					opcode = MOV;
				end
			endcase
		end	
	end
end
endmodule
