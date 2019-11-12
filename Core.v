module Core(input             clk,
	    input      [15:0] from_mem_data,
	    output reg [15:0] to_mem_addr,
	    output reg [15:0] core_to_mem_data,
	    output reg        core_to_mem_write_enable);

   // Wires for register file.
   wire [23:0]  read_data_1;
   wire [23:0]  read_data_2;

   reg  [4:0]   read_index_1;
   reg  [4:0]   read_index_2;
   reg  [4:0]   write_index;
   reg  [23:0] 	write_data;
   reg 		write_enable;

   reg [15:0] 	PC;
   
   reg [15:0] 	NPC_IF;
   reg [15:0] 	TARGET;
   reg  	TARGET_EN;
   reg [15:0] 	INST_IF;

   reg [15:0] 	NPC_ID;
   reg [5:0] 	REG1_ID;
   reg [5:0] 	REG2_ID;
   reg [4:0] 	CTRL_ID;

   reg [5:0] 	REG_EX;
   reg [15:0] 	RES_EX;
   reg [4:0] 	CTRL_EX;

   reg [15:0] 	RES_MA;
   reg [15:0] 	DATA_MA;
   reg [4:0] 	CTRL_MA;

   initial      PC = 1'b0; 

   RegisterFile _RegisterFile(.clk          (clk),
			      .read_data_1  (read_data_1),
			      .read_data_2  (read_data_2),
			      .read_index_1 (read_index_1),
			      .read_index_2 (read_index_2),
			      .write_index  (write_index),
			      .write_enable (write_enable),
			      .write_data   (write_data));

   InstructionFetch _InstructionFetch(.clk           (clk),
				      .PC            (PC),
				      .TARGET        (TARGET),
				      .TARGET_EN     (TARGET_EN),
				      .from_mem_data (from_mem_data),
				      .to_mem_addr   (to_mem_addr),
				      .NPC_IF        (NPC_IF),
				      .INST_IF       (INST_IF));

   InstructionDecode _InstructionDecode();

   Execute _Execute();

   MemoryAccess _MemoryAccess();

   RegisterWriteBack _RegisterWriteBack();
   
   

endmodule
