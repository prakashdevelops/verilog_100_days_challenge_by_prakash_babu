`timescale 1ns / 1ps
module posedge_detector_tb();
    reg clk,rst,in;
    wire out,y;
    posedge_detector uut(in,out,clk,rst,y);
    initial begin
        {clk,rst,in}=0;
    end
    always #5 clk=!clk;
    initial begin
        rst=1'b1;
        @(negedge clk);
        rst=1'b0;
        @(negedge clk);
        in=1'b1;
        repeat(6) 
            begin
            @(negedge clk);  
            in=1'b0;
            end 
        @(negedge clk);
            in=1'b1;
        @(negedge clk);
            in=1'b0;
    end
endmodule
