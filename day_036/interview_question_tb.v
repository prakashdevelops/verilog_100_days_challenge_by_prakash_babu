`timescale 1ns / 1ps

module interview_tb;
    reg clk;
    reg rst;
    wire out_clk;
    interview uut (
        .clk(clk),
        .rst(rst),
        .out_clk(out_clk)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        rst = 1;
        #20;
        rst = 0;
        #200;
        rst = 1;
        #20;
        rst = 0;
        #100;
        $finish;
    end
endmodule
