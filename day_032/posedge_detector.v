`timescale 1ns / 1ps
module posedge_detector(in,out,clk,rst,y);
    input in,clk,rst;
    output reg out;
    output y;
    always @(posedge clk)
        begin
            if(rst)
                out<=1'b0;
            else    
                out<=in;
        end
     assign y=(in & ~out);
endmodule
//if we use xor gate it will detect both posedge and negedge 
