module btb_way(way_prediction, way_bubble, way_bubble_target, way_update, way_hit, way_target, way_empty, clk, rst, current_pc, entry_en, update_en, jump_en, entry_pc, entry_target);
	input clk, rst;
	input [15:0] current_pc;
	input entry_en;
	input update_en;
	input jump_en;
	input [15:0] entry_pc;
	input [15:0] entry_target;

	output way_prediction;
	output way_hit;
	output way_update;
	output way_bubble;
	output [15:0] way_target;
	output [15:0] way_bubble_target;
	output way_empty;
	
	wire [31:0] hit;
	wire [31:0] update_hit;
	wire [31:0] bubble_hit;
	wire [31:0] prediction;
	wire [31:0] empty;
	wire [31:0] line_en;
	wire [511:0] target;
	wire [2:0] operation;

	btb_entry L0(.clk(clk), .pc(current_pc), .enable(line_en[0]), .op(operation), .insert_bubble(bubble_hit[0]), .update_hit(update_hit[0]), .hit(hit[0]), .empty(empty[0]), .prediction(prediction[0]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[15:0]));
	btb_entry L1(.clk(clk), .pc(current_pc), .enable(line_en[1]), .op(operation), .insert_bubble(bubble_hit[1]), .update_hit(update_hit[1]), .hit(hit[1]), .empty(empty[1]), .prediction(prediction[1]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[31:16]));
	btb_entry L2(.clk(clk), .pc(current_pc), .enable(line_en[2]), .op(operation), .insert_bubble(bubble_hit[2]), .update_hit(update_hit[2]), .hit(hit[2]), .empty(empty[2]), .prediction(prediction[2]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[47:32]));
	btb_entry L3(.clk(clk), .pc(current_pc), .enable(line_en[3]), .op(operation), .insert_bubble(bubble_hit[3]), .update_hit(update_hit[3]), .hit(hit[3]), .empty(empty[3]), .prediction(prediction[3]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[63:48]));
	btb_entry L4(.clk(clk), .pc(current_pc), .enable(line_en[4]), .op(operation), .insert_bubble(bubble_hit[4]), .update_hit(update_hit[4]), .hit(hit[4]), .empty(empty[4]), .prediction(prediction[4]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[79:64]));
	btb_entry L5(.clk(clk), .pc(current_pc), .enable(line_en[5]), .op(operation), .insert_bubble(bubble_hit[5]), .update_hit(update_hit[5]), .hit(hit[5]), .empty(empty[5]), .prediction(prediction[5]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[95:80]));
	btb_entry L6(.clk(clk), .pc(current_pc), .enable(line_en[6]), .op(operation), .insert_bubble(bubble_hit[6]), .update_hit(update_hit[6]), .hit(hit[6]), .empty(empty[6]), .prediction(prediction[6]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[111:96]));
	btb_entry L7(.clk(clk), .pc(current_pc), .enable(line_en[7]), .op(operation), .insert_bubble(bubble_hit[7]), .update_hit(update_hit[7]), .hit(hit[7]), .empty(empty[7]), .prediction(prediction[7]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[127:112]));
	btb_entry L8(.clk(clk), .pc(current_pc), .enable(line_en[8]), .op(operation), .insert_bubble(bubble_hit[8]), .update_hit(update_hit[8]), .hit(hit[8]), .empty(empty[8]), .prediction(prediction[8]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[143:128]));
	btb_entry L9(.clk(clk), .pc(current_pc), .enable(line_en[9]), .op(operation), .insert_bubble(bubble_hit[9]), .update_hit(update_hit[9]), .hit(hit[9]), .empty(empty[9]), .prediction(prediction[9]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[159:144]));
	btb_entry L10(.clk(clk), .pc(current_pc), .enable(line_en[10]), .op(operation), .insert_bubble(bubble_hit[10]), .update_hit(update_hit[10]), .hit(hit[10]), .empty(empty[10]), .prediction(prediction[10]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[175:160]));
	btb_entry L11(.clk(clk), .pc(current_pc), .enable(line_en[11]), .op(operation), .insert_bubble(bubble_hit[11]), .update_hit(update_hit[11]), .hit(hit[11]), .empty(empty[11]), .prediction(prediction[11]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[191:176]));
	btb_entry L12(.clk(clk), .pc(current_pc), .enable(line_en[12]), .op(operation), .insert_bubble(bubble_hit[12]), .update_hit(update_hit[12]), .hit(hit[12]), .empty(empty[12]), .prediction(prediction[12]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[207:192]));
	btb_entry L13(.clk(clk), .pc(current_pc), .enable(line_en[13]), .op(operation), .insert_bubble(bubble_hit[13]), .update_hit(update_hit[13]), .hit(hit[13]), .empty(empty[13]), .prediction(prediction[13]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[223:208]));
	btb_entry L14(.clk(clk), .pc(current_pc), .enable(line_en[14]), .op(operation), .insert_bubble(bubble_hit[14]), .update_hit(update_hit[14]), .hit(hit[14]), .empty(empty[14]), .prediction(prediction[14]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[239:224]));
	btb_entry L15(.clk(clk), .pc(current_pc), .enable(line_en[15]), .op(operation), .insert_bubble(bubble_hit[15]), .update_hit(update_hit[15]), .hit(hit[15]), .empty(empty[15]), .prediction(prediction[15]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[255:240]));
	btb_entry L16(.clk(clk), .pc(current_pc), .enable(line_en[16]), .op(operation), .insert_bubble(bubble_hit[16]), .update_hit(update_hit[16]), .hit(hit[16]), .empty(empty[16]), .prediction(prediction[16]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[271:256]));
	btb_entry L17(.clk(clk), .pc(current_pc), .enable(line_en[17]), .op(operation), .insert_bubble(bubble_hit[17]), .update_hit(update_hit[17]), .hit(hit[17]), .empty(empty[17]), .prediction(prediction[17]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[287:272]));
	btb_entry L18(.clk(clk), .pc(current_pc), .enable(line_en[18]), .op(operation), .insert_bubble(bubble_hit[18]), .update_hit(update_hit[18]), .hit(hit[18]), .empty(empty[18]), .prediction(prediction[18]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[303:288]));
	btb_entry L19(.clk(clk), .pc(current_pc), .enable(line_en[19]), .op(operation), .insert_bubble(bubble_hit[19]), .update_hit(update_hit[19]), .hit(hit[19]), .empty(empty[19]), .prediction(prediction[19]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[319:304]));
	btb_entry L20(.clk(clk), .pc(current_pc), .enable(line_en[20]), .op(operation), .insert_bubble(bubble_hit[20]), .update_hit(update_hit[20]), .hit(hit[20]), .empty(empty[20]), .prediction(prediction[20]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[335:320]));
	btb_entry L21(.clk(clk), .pc(current_pc), .enable(line_en[21]), .op(operation), .insert_bubble(bubble_hit[21]), .update_hit(update_hit[21]), .hit(hit[21]), .empty(empty[21]), .prediction(prediction[21]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[351:336]));
	btb_entry L22(.clk(clk), .pc(current_pc), .enable(line_en[22]), .op(operation), .insert_bubble(bubble_hit[22]), .update_hit(update_hit[22]), .hit(hit[22]), .empty(empty[22]), .prediction(prediction[22]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[367:352]));
	btb_entry L23(.clk(clk), .pc(current_pc), .enable(line_en[23]), .op(operation), .insert_bubble(bubble_hit[23]), .update_hit(update_hit[23]), .hit(hit[23]), .empty(empty[23]), .prediction(prediction[23]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[383:368]));
	btb_entry L24(.clk(clk), .pc(current_pc), .enable(line_en[24]), .op(operation), .insert_bubble(bubble_hit[24]), .update_hit(update_hit[24]), .hit(hit[24]), .empty(empty[24]), .prediction(prediction[24]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[399:384]));
	btb_entry L25(.clk(clk), .pc(current_pc), .enable(line_en[25]), .op(operation), .insert_bubble(bubble_hit[25]), .update_hit(update_hit[25]), .hit(hit[25]), .empty(empty[25]), .prediction(prediction[25]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[415:400]));
	btb_entry L26(.clk(clk), .pc(current_pc), .enable(line_en[26]), .op(operation), .insert_bubble(bubble_hit[26]), .update_hit(update_hit[26]), .hit(hit[26]), .empty(empty[26]), .prediction(prediction[26]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[431:416]));
	btb_entry L27(.clk(clk), .pc(current_pc), .enable(line_en[27]), .op(operation), .insert_bubble(bubble_hit[27]), .update_hit(update_hit[27]), .hit(hit[27]), .empty(empty[27]), .prediction(prediction[27]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[447:432]));
	btb_entry L28(.clk(clk), .pc(current_pc), .enable(line_en[28]), .op(operation), .insert_bubble(bubble_hit[28]), .update_hit(update_hit[28]), .hit(hit[28]), .empty(empty[28]), .prediction(prediction[28]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[463:448]));
	btb_entry L29(.clk(clk), .pc(current_pc), .enable(line_en[29]), .op(operation), .insert_bubble(bubble_hit[29]), .update_hit(update_hit[29]), .hit(hit[29]), .empty(empty[29]), .prediction(prediction[29]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[479:464]));
	btb_entry L30(.clk(clk), .pc(current_pc), .enable(line_en[30]), .op(operation), .insert_bubble(bubble_hit[30]), .update_hit(update_hit[30]), .hit(hit[30]), .empty(empty[30]), .prediction(prediction[30]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[495:480]));
	btb_entry L31(.clk(clk), .pc(current_pc), .enable(line_en[31]), .op(operation), .insert_bubble(bubble_hit[31]), .update_hit(update_hit[31]), .hit(hit[31]), .empty(empty[31]), .prediction(prediction[31]), .in_pc(entry_pc[15:4]), .in_target(entry_target), .out_target(target[511:496]));

	assign operation = (rst == 0) ? {entry_en, update_en, jump_en} : 3'b111;

	assign line_en = (rst == 1) ? {32{1'b1}} :
			(entry_pc == 5'b00000) ? {{31{1'b0}}, 1'b1} : 
		 	(entry_pc == 5'b00001) ? {{30{1'b0}}, 1'b1, {1{1'b0}}} :	
			(entry_pc == 5'b00010) ? {{29{1'b0}}, 1'b1, {2{1'b0}}} :
			(entry_pc == 5'b00011) ? {{28{1'b0}}, 1'b1, {3{1'b0}}} :
			(entry_pc == 5'b00100) ? {{27{1'b0}}, 1'b1, {4{1'b0}}} :
			(entry_pc == 5'b00101) ? {{26{1'b0}}, 1'b1, {5{1'b0}}} :
			(entry_pc == 5'b00110) ? {{25{1'b0}}, 1'b1, {6{1'b0}}} :
			(entry_pc == 5'b00111) ? {{24{1'b0}}, 1'b1, {7{1'b0}}} :
			(entry_pc == 5'b01000) ? {{23{1'b0}}, 1'b1, {8{1'b0}}} :
			(entry_pc == 5'b01001) ? {{22{1'b0}}, 1'b1, {9{1'b0}}} :
			(entry_pc == 5'b01010) ? {{21{1'b0}}, 1'b1, {10{1'b0}}} :
			(entry_pc == 5'b01011) ? {{20{1'b0}}, 1'b1, {11{1'b0}}} :
			(entry_pc == 5'b01100) ? {{19{1'b0}}, 1'b1, {12{1'b0}}} :
			(entry_pc == 5'b01101) ? {{18{1'b0}}, 1'b1, {13{1'b0}}} :
			(entry_pc == 5'b01110) ? {{17{1'b0}}, 1'b1, {14{1'b0}}} :
			(entry_pc == 5'b01111) ? {{16{1'b0}}, 1'b1, {15{1'b0}}} :
			(entry_pc == 5'b10000) ? {{15{1'b0}}, 1'b1, {16{1'b0}}} :
			(entry_pc == 5'b10001) ? {{14{1'b0}}, 1'b1, {17{1'b0}}} :
			(entry_pc == 5'b10010) ? {{13{1'b0}}, 1'b1, {18{1'b0}}} :
			(entry_pc == 5'b10011) ? {{12{1'b0}}, 1'b1, {19{1'b0}}} :
			(entry_pc == 5'b10100) ? {{11{1'b0}}, 1'b1, {20{1'b0}}} :
			(entry_pc == 5'b10101) ? {{10{1'b0}}, 1'b1, {21{1'b0}}} :
			(entry_pc == 5'b10110) ? {{9{1'b0}}, 1'b1, {22{1'b0}}} :
			(entry_pc == 5'b10111) ? {{8{1'b0}}, 1'b1, {23{1'b0}}} :
			(entry_pc == 5'b11000) ? {{7{1'b0}}, 1'b1, {24{1'b0}}} :
			(entry_pc == 5'b11001) ? {{6{1'b0}}, 1'b1, {25{1'b0}}} :
			(entry_pc == 5'b11010) ? {{5{1'b0}}, 1'b1, {26{1'b0}}} :
			(entry_pc == 5'b11011) ? {{4{1'b0}}, 1'b1, {27{1'b0}}} :
			(entry_pc == 5'b11100) ? {{3{1'b0}}, 1'b1, {28{1'b0}}} :
			(entry_pc == 5'b11101) ? {{2{1'b0}}, 1'b1, {29{1'b0}}} :
			(entry_pc == 5'b11110) ? {{1{1'b0}}, 1'b1, {30{1'b0}}} : {1'b1, {31{1'b0}}};

		assign way_bubble = (entry_pc == 5'b00000) ? bubble_hit[0] :
				(entry_pc == 5'b00001) ? bubble_hit[1] :
				(entry_pc == 5'b00010) ? bubble_hit[2] :
				(entry_pc == 5'b00011) ? bubble_hit[3] :
				(entry_pc == 5'b00100) ? bubble_hit[4] :
				(entry_pc == 5'b00101) ? bubble_hit[5] :
				(entry_pc == 5'b00110) ? bubble_hit[6] :
				(entry_pc == 5'b00111) ? bubble_hit[7] :
				(entry_pc == 5'b01000) ? bubble_hit[8] :
				(entry_pc == 5'b01001) ? bubble_hit[9] :
				(entry_pc == 5'b01010) ? bubble_hit[10] :
				(entry_pc == 5'b01011) ? bubble_hit[11] :
				(entry_pc == 5'b01100) ? bubble_hit[12] :
				(entry_pc == 5'b01101) ? bubble_hit[13] :
				(entry_pc == 5'b01110) ? bubble_hit[14] :
				(entry_pc == 5'b01111) ? bubble_hit[15] :
				(entry_pc == 5'b10000) ? bubble_hit[16] :
				(entry_pc == 5'b10001) ? bubble_hit[17] :
				(entry_pc == 5'b10010) ? bubble_hit[18] :
				(entry_pc == 5'b10011) ? bubble_hit[19] :
				(entry_pc == 5'b10100) ? bubble_hit[20] :
				(entry_pc == 5'b10101) ? bubble_hit[21] :
				(entry_pc == 5'b10110) ? bubble_hit[22] :
				(entry_pc == 5'b10111) ? bubble_hit[23] :
				(entry_pc == 5'b11000) ? bubble_hit[24] :
				(entry_pc == 5'b11001) ? bubble_hit[25] :
				(entry_pc == 5'b11010) ? bubble_hit[26] :
				(entry_pc == 5'b11011) ? bubble_hit[27] :
				(entry_pc == 5'b11100) ? bubble_hit[28] :
				(entry_pc == 5'b11101) ? bubble_hit[29] :
				(entry_pc == 5'b11110) ? bubble_hit[30] : bubble_hit[31];

		assign way_update = (entry_pc == 5'b00000) ? update_hit[0] :
				(entry_pc == 5'b00001) ? update_hit[1] :
				(entry_pc == 5'b00010) ? update_hit[2] :
				(entry_pc == 5'b00011) ? update_hit[3] :
				(entry_pc == 5'b00100) ? update_hit[4] :
				(entry_pc == 5'b00101) ? update_hit[5] :
				(entry_pc == 5'b00110) ? update_hit[6] :
				(entry_pc == 5'b00111) ? update_hit[7] :
				(entry_pc == 5'b01000) ? update_hit[8] :
				(entry_pc == 5'b01001) ? update_hit[9] :
				(entry_pc == 5'b01010) ? update_hit[10] :
				(entry_pc == 5'b01011) ? update_hit[11] :
				(entry_pc == 5'b01100) ? update_hit[12] :
				(entry_pc == 5'b01101) ? update_hit[13] :
				(entry_pc == 5'b01110) ? update_hit[14] :
				(entry_pc == 5'b01111) ? update_hit[15] :
				(entry_pc == 5'b10000) ? update_hit[16] :
				(entry_pc == 5'b10001) ? update_hit[17] :
				(entry_pc == 5'b10010) ? update_hit[18] :
				(entry_pc == 5'b10011) ? update_hit[19] :
				(entry_pc == 5'b10100) ? update_hit[20] :
				(entry_pc == 5'b10101) ? update_hit[21] :
				(entry_pc == 5'b10110) ? update_hit[22] :
				(entry_pc == 5'b10111) ? update_hit[23] :
				(entry_pc == 5'b11000) ? update_hit[24] :
				(entry_pc == 5'b11001) ? update_hit[25] :
				(entry_pc == 5'b11010) ? update_hit[26] :
				(entry_pc == 5'b11011) ? update_hit[27] :
				(entry_pc == 5'b11100) ? update_hit[28] :
				(entry_pc == 5'b11101) ? update_hit[29] :
				(entry_pc == 5'b11110) ? update_hit[30] : update_hit[31];

	assign way_empty = (entry_pc == 5'b00000) ? empty[0] :
				(entry_pc == 5'b00001) ? empty[1] :
				(entry_pc == 5'b00010) ? empty[2] :
				(entry_pc == 5'b00011) ? empty[3] :
				(entry_pc == 5'b00100) ? empty[4] :
				(entry_pc == 5'b00101) ? empty[5] :
				(entry_pc == 5'b00110) ? empty[6] :
				(entry_pc == 5'b00111) ? empty[7] :
				(entry_pc == 5'b01000) ? empty[8] :
				(entry_pc == 5'b01001) ? empty[9] :
				(entry_pc == 5'b01010) ? empty[10] :
				(entry_pc == 5'b01011) ? empty[11] :
				(entry_pc == 5'b01100) ? empty[12] :
				(entry_pc == 5'b01101) ? empty[13] :
				(entry_pc == 5'b01110) ? empty[14] :
				(entry_pc == 5'b01111) ? empty[15] :
				(entry_pc == 5'b10000) ? empty[16] :
				(entry_pc == 5'b10001) ? empty[17] :
				(entry_pc == 5'b10010) ? empty[18] :
				(entry_pc == 5'b10011) ? empty[19] :
				(entry_pc == 5'b10100) ? empty[20] :
				(entry_pc == 5'b10101) ? empty[21] :
				(entry_pc == 5'b10110) ? empty[22] :
				(entry_pc == 5'b10111) ? empty[23] :
				(entry_pc == 5'b11000) ? empty[24] :
				(entry_pc == 5'b11001) ? empty[25] :
				(entry_pc == 5'b11010) ? empty[26] :
				(entry_pc == 5'b11011) ? empty[27] :
				(entry_pc == 5'b11100) ? empty[28] :
				(entry_pc == 5'b11101) ? empty[29] :
				(entry_pc == 5'b11110) ? empty[30] : empty[31];

	assign way_hit = (current_pc == 5'b00000) ? hit[0] :
				(current_pc == 5'b00001) ? hit[1] :
				(current_pc == 5'b00010) ? hit[2] :
				(current_pc == 5'b00011) ? hit[3] :
				(current_pc == 5'b00100) ? hit[4] :
				(current_pc == 5'b00101) ? hit[5] :
				(current_pc == 5'b00110) ? hit[6] :
				(current_pc == 5'b00111) ? hit[7] :
				(current_pc == 5'b01000) ? hit[8] :
				(current_pc == 5'b01001) ? hit[9] :
				(current_pc == 5'b01010) ? hit[10] :
				(current_pc == 5'b01011) ? hit[11] :
				(current_pc == 5'b01100) ? hit[12] :
				(current_pc == 5'b01101) ? hit[13] :
				(current_pc == 5'b01110) ? hit[14] :
				(current_pc == 5'b01111) ? hit[15] :
				(current_pc == 5'b10000) ? hit[16] :
				(current_pc == 5'b10001) ? hit[17] :
				(current_pc == 5'b10010) ? hit[18] :
				(current_pc == 5'b10011) ? hit[19] :
				(current_pc == 5'b10100) ? hit[20] :
				(current_pc == 5'b10101) ? hit[21] :
				(current_pc == 5'b10110) ? hit[22] :
				(current_pc == 5'b10111) ? hit[23] :
				(current_pc == 5'b11000) ? hit[24] :
				(current_pc == 5'b11001) ? hit[25] :
				(current_pc == 5'b11010) ? hit[26] :
				(current_pc == 5'b11011) ? hit[27] :
				(current_pc == 5'b11100) ? hit[28] :
				(current_pc == 5'b11101) ? hit[29] :
				(current_pc == 5'b11110) ? hit[30] : hit[31];

	assign way_prediction = (current_pc == 5'b00000) ? prediction[0] :
				(current_pc == 5'b00001) ? prediction[1] :
				(current_pc == 5'b00010) ? prediction[2] :
				(current_pc == 5'b00011) ? prediction[3] :
				(current_pc == 5'b00100) ? prediction[4] :
				(current_pc == 5'b00101) ? prediction[5] :
				(current_pc == 5'b00110) ? prediction[6] :
				(current_pc == 5'b00111) ? prediction[7] :
				(current_pc == 5'b01000) ? prediction[8] :
				(current_pc == 5'b01001) ? prediction[9] :
				(current_pc == 5'b01010) ? prediction[10] :
				(current_pc == 5'b01011) ? prediction[11] :
				(current_pc == 5'b01100) ? prediction[12] :
				(current_pc == 5'b01101) ? prediction[13] :
				(current_pc == 5'b01110) ? prediction[14] :
				(current_pc == 5'b01111) ? prediction[15] :
				(current_pc == 5'b10000) ? prediction[16] :
				(current_pc == 5'b10001) ? prediction[17] :
				(current_pc == 5'b10010) ? prediction[18] :
				(current_pc == 5'b10011) ? prediction[19] :
				(current_pc == 5'b10100) ? prediction[20] :
				(current_pc == 5'b10101) ? prediction[21] :
				(current_pc == 5'b10110) ? prediction[22] :
				(current_pc == 5'b10111) ? prediction[23] :
				(current_pc == 5'b11000) ? prediction[24] :
				(current_pc == 5'b11001) ? prediction[25] :
				(current_pc == 5'b11010) ? prediction[26] :
				(current_pc == 5'b11011) ? prediction[27] :
				(current_pc == 5'b11100) ? prediction[28] :
				(current_pc == 5'b11101) ? prediction[29] :
				(current_pc == 5'b11110) ? prediction[30] : prediction[31];
	
	assign way_target = (current_pc == 5'b00000) ? target[15:0] :
				(current_pc == 5'b00001) ? target[31:16] :
				(current_pc == 5'b00010) ? target[47:32] :
				(current_pc == 5'b00011) ? target[63:48] :
				(current_pc == 5'b00100) ? target[79:64] :
				(current_pc == 5'b00101) ? target[95:80] :
				(current_pc == 5'b00110) ? target[111:96] :
				(current_pc == 5'b00111) ? target[127:112] :
				(current_pc == 5'b01000) ? target[143:128] :
				(current_pc == 5'b01001) ? target[159:144] :
				(current_pc == 5'b01010) ? target[175:160] :
				(current_pc == 5'b01011) ? target[191:176] :
				(current_pc == 5'b01100) ? target[207:192] :
				(current_pc == 5'b01101) ? target[223:208] :
				(current_pc == 5'b01110) ? target[239:224] :
				(current_pc == 5'b01111) ? target[255:240] :
				(current_pc == 5'b10000) ? target[271:256] :
				(current_pc == 5'b10001) ? target[287:272] :
				(current_pc == 5'b10010) ? target[303:288] :
				(current_pc == 5'b10011) ? target[319:304] :
				(current_pc == 5'b10100) ? target[335:320] :
				(current_pc == 5'b10101) ? target[351:336] :
				(current_pc == 5'b10110) ? target[357:352] :
				(current_pc == 5'b10111) ? target[383:368] :
				(current_pc == 5'b11000) ? target[399:384] :
				(current_pc == 5'b11001) ? target[415:400] :
				(current_pc == 5'b11010) ? target[431:416] :
				(current_pc == 5'b11011) ? target[447:432] :
				(current_pc == 5'b11100) ? target[465:448] :
				(current_pc == 5'b11101) ? target[479:464] :
				(current_pc == 5'b11110) ? target[495:480] : target[511:496];


		assign way_bubble_target = (entry_pc == 5'b00000) ? target[15:0] :
				(entry_pc == 5'b00001) ? target[31:16] :
				(entry_pc == 5'b00010) ? target[47:32] :
				(entry_pc == 5'b00011) ? target[63:48] :
				(entry_pc == 5'b00100) ? target[79:64] :
				(entry_pc == 5'b00101) ? target[95:80] :
				(entry_pc == 5'b00110) ? target[111:96] :
				(entry_pc == 5'b00111) ? target[127:112] :
				(entry_pc == 5'b01000) ? target[143:128] :
				(entry_pc == 5'b01001) ? target[159:144] :
				(entry_pc == 5'b01010) ? target[175:160] :
				(entry_pc == 5'b01011) ? target[191:176] :
				(entry_pc == 5'b01100) ? target[207:192] :
				(entry_pc == 5'b01101) ? target[223:208] :
				(entry_pc == 5'b01110) ? target[239:224] :
				(entry_pc == 5'b01111) ? target[255:240] :
				(entry_pc == 5'b10000) ? target[271:256] :
				(entry_pc == 5'b10001) ? target[287:272] :
				(entry_pc == 5'b10010) ? target[303:288] :
				(entry_pc == 5'b10011) ? target[319:304] :
				(entry_pc == 5'b10100) ? target[335:320] :
				(entry_pc == 5'b10101) ? target[351:336] :
				(entry_pc == 5'b10110) ? target[357:352] :
				(entry_pc == 5'b10111) ? target[383:368] :
				(entry_pc == 5'b11000) ? target[399:384] :
				(entry_pc == 5'b11001) ? target[415:400] :
				(entry_pc == 5'b11010) ? target[431:416] :
				(entry_pc == 5'b11011) ? target[447:432] :
				(entry_pc == 5'b11100) ? target[465:448] :
				(entry_pc == 5'b11101) ? target[479:464] :
				(entry_pc == 5'b11110) ? target[495:480] : target[511:496];
endmodule
