module Core(input              clk,
            input       [15:0] data_from_memory,
            output reg  [15:0] address_to_memory,
            output reg  [15:0] data_to_memory,
            output reg         data_to_memory_write_en);

   // Wires & Registers for register file.
   wire [15:0] reg1_data_rf;
   wire [15:0] reg2_data_rf;
   reg [4:0]   reg1_index_rf;
   reg [4:0]   reg2_index_rf;
   reg [4:0]   write_index_rf;
   reg [15:0]  write_data_rf;
   reg         write_en_rf;
   
   // Registers for Branch Predictor
   reg [15:0]  target_bp;
   reg         target_en_bp;
   reg         branch_prediction_bp;
   
   // Registers for Fetch Stage
   reg [15:0]  next_program_counter_if;
   reg [15:0]  instruction_if;
   wire [15:0] next_program_counter_if_to_br;
   
   // Registers for Decode Stage
   reg [15:0]  next_program_counter_id;
   reg [15:0]  reg1_data_id;
   reg [15:0]  reg2_data_id;
   reg [4:0]   dest_reg_index_id;
   reg [6:0]   immediate_id;
   reg [3:0]   control_id;
   wire [3:0]  opcode_id;
   wire [15:4] target_address_id;
   
   // Registers for Execution Stage
   reg [15:0]  reg_data_ex;
   reg [15:0]  result_ex;
   reg [15:0]  target_ex;
   reg [4:0]   dest_reg_index_ex;
   reg         des_reg_write_en_ex;
   reg [3:0]   control_ex;
   reg         ZF_ex;
   reg         GF_ex;
   reg         LF_ex;
   
   // Registers for Memory Access Stage.
   reg [4:0]   dest_reg_index_ma;
   reg         dest_reg_write_en_ma;
   reg [15:0]  result_ma;
   reg [15:0]  data_ma;
   reg [3:0]   control_ma;
   
   RegisterFile _RegisterFile(.clk          (clk),
                              .reg1_data    (reg1_data_rf),
                              .reg2_data    (reg2_data_rf),
                              .reg1_index   (reg1_index_rf),
                              .reg2_index   (reg2_index_rf),
                              .write_index  (write_index_rf),
                              .write_en     (write_en_rf),
                              .write_data   (write_data_rf));
   
   InstructionFetch _InstructionFetch(.clk                    		 (clk),
                                      .target_bp              		 (target_bp),
                                      .target_en_bp           		 (target_en_bp),
                                      .data_from_memory      	 	 (data_from_memory),
                                      .address_to_memory       		 (address_to_memory),
									  .next_program_counter_if_to_bp (next_program_counter_if_to_bp),
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
                    .ouput_reg         (reg_data_ex),
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
                              .address_to_memory        (address_to_memory),
                              .data_from_memory         (data_from_memory),
                              .data_to_memory           (data_to_memory),
                              .data_to_memory_write_en  (data_to_memory_write_en),
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
   
endmodule
