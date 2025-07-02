`timescale 1ns / 1ps
module fsm_1011_tb();
    reg in,clk,rst;
    wire out;
    fsm_1011 uut(clk,rst,in,out);
    initial begin
        {clk,rst,in}=0;
    end
    always #5 clk=!clk;
    
    initial begin
        rst=1'b1;
        @(posedge clk);
        rst=1'b0;
        in=1'b1;
        @(posedge clk);
        in=1'b0;
        @(posedge clk);
        in=1'b1;
        @(posedge clk);
        in=1'b1;
        @(posedge clk);
          in=1'b1;
        @(posedge clk);
        in=1'b0;
        @(posedge clk);
        in=1'b1;
        @(posedge clk);
        in=1'b1;
        @(posedge clk);     
    end
endmodule
