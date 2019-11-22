module RegisterWriteBack(input             clk,
                    input [4:0]  DEST_REG_INDEX_MA,                                                              
                    input        DEST_REG_WRITE_EN_MA,                                                       
                    input [15:0] RES_MA,                                                                         
                    input [15:0] DATA_MA,                                                                        
                    input [4:0]  CTRL_MA,
                    output reg [4:0] WRITE_INDEX_RF,
                    output reg [15:0] WRITE_DATA_RF,
                    output reg WRITE_EN_RF);  


   parameter LOAD   = 4'b1100;                                                                                                                   

   always@(*) begin                                                                                                   
      WRITE_INDEX_RF = DEST_REG_INDEX_MA;

      if(CTRL_MA == LOAD)
      begin
        WRITE_DATA_RF = DATA_MA;
      end                                
      else
      begin
        WRITE_DATA_RF = RES_MA;
      end
      WRITE_EN_RF = DEST_REG_WRITE_EN_MA;                                                                                
   end                                                                                                             
                                                                                                                      
endmodule