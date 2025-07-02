`timescale 1ns / 1ps
module ring_counter_tb();
    reg clk,rst;
    wire [3:0]out;
    ring_counter uut(clk,rst,out);
    initial begin
      {clk,rst}=0;  
    end 
    always #5 clk=!clk;
    initial begin
        rst=1'b1;
        @(negedge clk);
        rst=1'b0;
    end
endmodule

