`timescale 1ns / 1ps
module ring_counter(clk,rst,out);
    input clk,rst;
    reg flag;
    reg [8:0]count;
    output reg [0:3]out;
    always @(posedge clk or posedge rst)
        begin
            if(rst || count%4==0) begin
                out[0]<=1'b1;
                out[1]<=1'b0;
                out[2]<=1'b0;
                out[3]<=1'b0;
                count<=4'b1;
                end 
             else 
                begin
                    out<=out>>1;
                    count<=count+4'b1;
                end                                                 
        end    
endmodule
