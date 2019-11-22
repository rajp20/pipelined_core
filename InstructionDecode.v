module InstructionDecode(input             clk,
                         input [15:0] 	   next_program_counter_if,
                         input [15:0] 	   instruction_if,
                         input			   branch_prediction_bp,
                         input [15:0] 	   reg1_data_rf,
                         input [15:0] 	   reg2_data_rf,
                         output reg [4:0]  reg1_index_rf,
                         output reg [4:0]  reg2_index_rf,
                         output [3:0] 	   opcode_id,
                         output [11:0] 	   target_address_id,
                         output reg [15:0] next_program_counter_id,
                         output reg [15:0] reg1_data_id,
                         output reg [15:0] reg2_data_id,
                         output reg [6:0]  immediate_id,
                         output reg [4:0]  dest_reg_index_id,
                         output reg [3:0]  control_id);
   
   parameter NOP = 4'b0000;

   reg [3:0] next_control;
   initial next_control = NOP;

   assign opcode_id = next_control;
   assign target_address_id = {{4{1'b0}}, instruction_if[11:0]};
   
   // Need to figure out a way to pass immediate values to the next stage.
   always@(*) 
     begin
		reg1_index_rf = instruction_if[9:5];
		reg2_index_rf = instruction_if[4:0];
		if (branch_prediction_bp)
		  next_control = NOP;
		else
		  next_control = instruction_if[15:12];
     end
   
   always@(posedge clk) 
     begin
		next_program_counter_id <= next_program_counter_if;
	    control_id <= next_control;
		reg1_data_id <= reg1_data_rf;
		reg2_data_id <= reg2_data_rf;
		immediate_id <= instruction_if[11:5];
		dest_reg_index_id <= instruction_if[4:0];
     end
   
endmodule
