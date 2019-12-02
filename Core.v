module Core(input         clk,
	    input 	  reset,
            input [15:0]  data_from_instruction_memory,
	    input [15:0]  data_from_main_memory,
            output [3:0] address_to_instruction_memory,
            output [3:0] address_to_main_memory,
            output [15:0] data_to_main_memory,
            output 	  data_to_main_memory_write_en);

   // Wires & Registers for register file.
   wire [15:0] reg1_data_rf;
   wire [15:0] reg2_data_rf;
   wire [4:0]  reg1_index_rf;
   wire [4:0]  reg2_index_rf;
   wire [4:0]  write_index_rf;
   wire [15:0] write_data_rf;
   wire        write_en_rf;
   
   // Registers for Branch Predictor
   wire [15:0] target_bp;
   wire        target_en_bp;
   wire        branch_prediction_bp;
   
   // Registers for Fetch Stage
   wire [15:0] next_program_counter_if;
   wire [15:0] instruction_if;
   wire [15:0] next_program_counter_if_to_bp;
   
   // Registers for Decode Stage
   wire [15:0] next_program_counter_id;
   wire [15:0] reg1_data_id;
   wire [15:0] reg2_data_id;
   wire [4:0]  dest_reg_index_id;
   wire [6:0]  immediate_id;
   wire [3:0]  control_id;
   wire [3:0]  opcode_id;
   wire [15:0] target_address_id;
   
   // Registers for Execution Stage
   wire [15:0] reg_data_ex;
   wire [15:0] result_ex;
   wire [15:0] target_ex;
   wire [4:0]  dest_reg_index_ex;
   wire        des_reg_write_en_ex;
   wire [3:0]  control_ex;
   wire        ZF_ex;
   wire        GF_ex;
   wire        LF_ex;
   
   // Registers for Memory Access Stage.
   wire [4:0]  dest_reg_index_ma;
   wire        dest_reg_write_en_ma;
   wire [15:0] result_ma;
   wire [15:0] data_ma;
   wire [3:0]  control_ma;
   
   RegisterFile _RegisterFile(.clk          (clk),
                              .reg1_data    (reg1_data_rf),
                              .reg2_data    (reg2_data_rf),
                              .reg1_index   (reg1_index_rf),
                              .reg2_index   (reg2_index_rf),
                              .write_index  (write_index_rf),
                              .write_en     (write_en_rf),
                              .write_data   (write_data_rf));
   
   InstructionFetch _InstructionFetch(.clk                    		 (clk),
				      .reset				 (reset),
                                      .target_bp              		 (target_bp),
                                      .target_en_bp           		 (target_en_bp),
                                      .data_from_memory      	 	 (data_from_instruction_memory),
                                      .address_to_memory       		 (address_to_instruction_memory),
				      .next_program_counter_if_to_bp     (next_program_counter_if_to_bp),
                                      .next_program_counter_if 		 (next_program_counter_if),
                                      .instruction_if         		 (instruction_if));
   
   InstructionDecode _InstructionDecode(.clk                       (clk),
                                        .next_program_counter_if   (next_program_counter_if),
                                        .instruction_if            (instruction_if),
                                        .branch_prediction_bp      (branch_prediction_bp),
                                        .reg1_data_rf              (reg1_data_rf),
                                        .reg2_data_rf              (reg2_data_rf),
                                        .reg1_index_rf             (reg1_index_rf),
                                        .reg2_index_rf             (reg2_index_rf),
                                        .opcode_id                 (opcode_id),
                                        .target_address_id         (target_address_id),
                                        .next_program_counter_id   (next_program_counter_id),
                                        .reg1_data_id              (reg1_data_id),
                                        .reg2_data_id              (reg2_data_id),
                                        .dest_reg_index_id         (dest_reg_index_id),
                                        .immediate_id              (immediate_id),
                                        .control_id                (control_id));
   
   Execute _Execute(.clk               (clk),
                    .control_in        (control_id),
                    .reg1_data         (reg1_data_id),
                    .reg2_data         (reg2_data_id),
                    .npc               (next_program_counter_id),
                    .dest_index_in     (dest_reg_index_id),
                    .immediate         (immediate_id),
                    .dest_index_out    (dest_reg_index_ex),
                    .output_reg        (reg_data_ex),
                    .result_out        (result_ex),
                    .target            (target_ex),
                    .control_out       (control_ex),
                    .DEST_REG_WRITE_EN (des_reg_write_en_ex),
                    .ZF                (ZF_ex),
                    .GF                (GF_ex),
                    .LF                (LF_ex));
   
   MemoryAccess _MemoryAccess(.clk                      (clk),
			      			  .control_ex               (control_ex),
			      			  .result_ex                (result_ex),
                              .reg_data_ex              (reg_data_ex),
                              .dest_reg_index_ex        (dest_reg_index_ex),
                              .dest_reg_write_en_ex     (des_reg_write_en_ex),
                              .address_to_memory        (address_to_main_memory),
                              .data_from_memory         (data_from_main_memory),
                              .data_to_memory           (data_to_main_memory),
                              .data_to_memory_write_en  (data_to_main_memory_write_en),
                              .dest_reg_index_ma        (dest_reg_index_ma),
                              .dest_reg_write_en_ma     (dest_reg_write_en_ma),
                              .result_ma                (result_ma),
                              .data_ma                  (data_ma),
                              .control_ma               (control_ma));
   
   RegisterWriteBack _RegisterWriteBack(.clk                    (clk),
                                        .dest_reg_index_ma      (dest_reg_index_ma),
                                        .dest_reg_write_en_ma   (dest_reg_write_en_ma),
                                        .result_ma              (result_ma),
                                        .data_ma                (data_ma),
                                        .control_ma             (control_ma),
                                        .write_index_rf         (write_index_rf),
                                        .write_data_rf          (write_data_rf),
                                        .write_en_rf            (write_en_rf));

   btb _btb(.clk            (clk),
	    .rst            (reset),
	    .fetch_pc       (next_program_counter_if_to_bp),
	    .ex_pc          (target_ex),
	    .ex_opcode      (opcode_id),
	    .target_entry   (target_address_id),
	    .lflag          (LF_ex),
	    .gflag          (GF_ex),
	    .zflag          (ZF_ex),
	    .btb_target     (target_bp),
	    .btb_prediction (target_en_bp),
	    .r_nop          (branch_prediction_bp));  
   
endmodule
