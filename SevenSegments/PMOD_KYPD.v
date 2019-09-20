`timescale 1ns / 1ps
module Decoder(
input clk, input [3:0] Row, output reg [3:0] Col, output reg [3:0] DecodeOut
    );
   
    reg [19:0] sclk = 0;
   
   
    always@(posedge clk) begin
   
        //100000   
        if(sclk == 20'b0011000011010100000) begin
            Col <= 4'b0111;
            sclk <= sclk + 1'b1;
         end  
        //100008
         else if(sclk == 20'b0011000011010101000) begin
            if(Row == 4'b0111) begin
                DecodeOut <= 4'b0001; //1
            end
            if(Row == 4'b1011) begin
                DecodeOut <= 4'b0100; //4
            end
            if(Row == 4'b1101) begin
                DecodeOut <= 4'b0111; //7
            end
            if(Row == 4'b1110) begin
                DecodeOut <= 4'b0000; //0
            end
            sclk <= sclk + 1'b1;
         end
        
         //200000        
         else if(sclk == 20'b00110000110101000000) begin
            Col <= 4'b1011;
            sclk <= sclk + 1'b1;
         end

         //200008
         else if(sclk == 20'b00110000110101001000) begin
            if(Row == 4'b0111) begin
                DecodeOut <= 4'b0010; //2
            end
            if(Row == 4'b1011) begin
                DecodeOut <= 4'b0101; //5
            end
            if(Row == 4'b1101) begin
                DecodeOut <= 4'b1000; //8
            end
            if(Row == 4'b1110) begin
                DecodeOut <= 4'b1111; //F
            end
            sclk <= sclk + 1'b1;
         end
        
        //300000
         else if(sclk == 20'b1001001001111100000) begin
            Col <= 4'b1101;
            sclk <= sclk + 1'b1;
         end

         //300008
         else if(sclk == 20'b1001001001111101000) begin
            if(Row == 4'b0111) begin
                DecodeOut <= 4'b0011; //3
            end
            if(Row == 4'b1011) begin
                DecodeOut <= 4'b0110; //6
            end
            if(Row == 4'b1101) begin
                DecodeOut <= 4'b1001; //9
            end
            if(Row == 4'b1110) begin
                DecodeOut <= 4'b1110; //E
            end
            sclk <= sclk + 1'b1;
         end
        
        //400000
         else if(sclk == 20'b1100001101010000000) begin
            Col <= 4'b1110;
            sclk <= sclk + 1'b1;
         end

         //400008
         else if(sclk == 20'b1100001101010001000) begin
            if(Row == 4'b0111) begin
                DecodeOut <= 4'b1010; //A
            end
            if(Row == 4'b1011) begin
                DecodeOut <= 4'b1011; //B
            end
            if(Row == 4'b1101) begin
                DecodeOut <= 4'b1100; //C
            end
            if(Row == 4'b1110) begin
                DecodeOut <= 4'b1101; //D
            end
            sclk <= sclk + 1'b1;
         end
        
         else
             sclk <= sclk + 1'b1;
        
      end
endmodule
