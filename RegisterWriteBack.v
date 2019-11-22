module RegisterWriteBack(input              clk,
                         input [4:0]        dest_reg_index_ma,
                         input              dest_reg_write_en_ma,
                         input [15:0]       result_ma,
                         input [15:0]       data_ma,
                         input [4:0]        control_ma,
                         output reg [4:0]   write_index_rf,
                         output reg [15:0]  write_data_rf,
                         output reg         write_en_rf);  

   
   parameter LOAD = 4'b1100;
   
   always@(*)
     begin
	write_index_rf = dest_reg_index_ma;
	
	if(control_ma == LOAD)
          write_data_rf = data_ma;
	else
          write_data_rf = result_ma;
	
	write_en_rf = dest_reg_write_en_ma;
     end                                                                                                             
endmodule
