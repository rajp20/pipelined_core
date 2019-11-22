module Core(input              clk,
            input       [15:0] from_mem_data,
    	    output reg  [15:0] to_mem_addr,
	        output reg  [15:0] core_to_mem_data,
	        output reg         core_to_mem_write_enable);

   // Wires for register file.
   wire [15:0]  read_data_1;
   wire [15:0]  read_data_2;

   reg  [4:0]   read_index_1;
   reg  [4:0]   read_index_2;
   reg  [4:0]   write_index;
   reg  [15:0] 	write_data;
   reg 		WRITE_ENABLE;

   // Registers for Branch Predictor
   reg [15:0] 	TARGET;
   reg  	TARGET_EN;
   reg          BRANCH_PRED;
   

   // Registers for Fetch Stage
   reg [15:0] 	NPC_IF; 
   reg [15:0] 	INST_IF;

   // Registers for Decode Stage
   reg [15:0] 	NPC_ID;
   reg [15:0] 	REG1_DATA_ID;
   reg [15:0] 	REG2_DATA_ID;
   reg [4:0] 	DEST_REG_INDEX_ID;
   reg [6:0] 	IMMEDIATE_ID; 	
   reg [3:0] 	CTRL_ID;

   // Registers for Execution Stage
   reg [15:0] 	REG_DATA_EX;
   reg [15:0] 	RES_EX;
   reg [4:0] 	DEST_REG_INDEX_EX;
   reg [3:0] 	CTRL_EX;

   // Registers for Memory Access Stage.
   reg [15:0] 	RES_MA;
   reg [15:0] 	DATA_MA;
   reg [3:0] 	CTRL_MA;

   RegisterFile _RegisterFile(.clk          (clk),
			      .read_data_1  (read_data_1),
			      .read_data_2  (read_data_2),
			      .read_index_1 (read_index_1),
			      .read_index_2 (read_index_2),
			      .write_index  (write_index),
			      .WRITE_ENABLE (WRITE_ENABLE),
			      .write_data   (write_data));

   InstructionFetch _InstructionFetch(.clk           (clk),
				      .TARGET        (TARGET),
				      .TARGET_EN     (TARGET_EN),
				      .BRANCH_PRED   (BRANCH_PRED),
				      .from_mem_data (from_mem_data),
				      .to_mem_addr   (to_mem_addr),
				      .NPC_IF        (NPC_IF),
				      .INST_IF       (INST_IF));

   InstructionDecode _InstructionDecode(.clk               (clk),
					.NPC_IF            (NPC_IF),
					.INST_IF           (INST_IF),
					.BRANCH_PRED       (BRANCH_PRED),
					.read_data_1       (read_data_1),
					.read_data_2       (read_data_2),
					.read_index_1      (read_index_1),
					.read_index_2      (read_index_2),
					.OP_BR             (OP_BR),
					.TARGET_BR         (TARGET_BR),
					.NPC_ID            (NPC_ID),
					.REG1_DATA_ID      (REG1_DATA_ID),
					.REG2_DATA_ID      (REG2_DATA_ID),
					.DEST_REG_INDEX_ID (DEST_REG_INDEX_ID),
					.IMMEDIATE_ID      (IMMEDIATE_ID),
					.CTRL_ID           (CTRL_ID));

   Execute _Execute(.clk (clk),
		    .control_in (CTRL_ID),
		    .reg1_data (REG1_DATA_ID),
		    .reg2_data (REG2_DATA_ID),
		    .npc (NPC_ID),
		    .dest_index_in (DEST_REG_INDEX_ID),
		    .immediate (IMMEDIATE_ID),
		    .dest_index_out (DEST_REG_INDEX_EX),
		    .ouput_reg (REG_DATA_EX)
		    .result_out (RES_EX)
		    .target ()
		    .control_out (CTRL_EX)
		    .DEST_REG_WRITE_EN (DEST_REG_WRITE_EN)
		    .ZF (ZF_EX)
		    .GF (GF_EX)
		    .LF (LF_EX));

   MemoryAccess _MemoryAccess(.clk (clk),
			      .CTRL_EX (CTRL_EX)
			      );

   RegisterWriteBack _RegisterWriteBack();
   
   

endmodule
