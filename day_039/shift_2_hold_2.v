module shift_2(clk, rst, in, out);
    input clk;
    input rst;
    input in;
    output out;

    reg [3:0] temp;
    reg [1:0] count;

    always @(posedge clk) begin
        if (rst) begin
            temp  <= 4'b0;
            count <= 2'b0;
        end
        else begin
            if (count == 2'b00 || count == 2'b01) begin
                temp[3] <= temp[2];
                temp[2] <= temp[1];
                temp[1] <= temp[0];
                temp[0] <= in;
            end

            count <= count + 1'b1; 
        end
    end

    assign out = temp[3];


//test bench 
`timescale 1ns/1ps

module tb_shift_2;

    reg clk;
    reg rst;
    reg in;
    wire out;
    
   
    shift_2 uut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .out(out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin

        $display("Time\tclk rst in count temp out");
        rst = 1;
        in  = 0;
        #20;
        rst = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #100;

        $finish;
    end
    
    initial begin
        $monitor("t=%0d  clk=%b rst=%b in=%b   temp=%b  count=%b  out=%b",
                 $time, clk, rst, in, uut.temp, uut.count, out);
    end

endmodule


