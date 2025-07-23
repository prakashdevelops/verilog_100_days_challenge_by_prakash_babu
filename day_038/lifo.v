`timescale 1ns / 1ps


module lifo_tb(

    );
    reg clk,rst,re,we;
    reg [7:0]data_in;
    wire [7:0] data_out;
    wire full,empty;
    lifo uut(.clk(clk),.rst(rst),.data_in(data_in),
             .data_out(data_out),.full(full),.empty(empty),.we(we),.re(re));
    initial begin
        clk=0;
        rst=0;
        data_in=0;
        we=0;
        re=0;
    end
    always #5 clk=~clk;
    task data(input [7:0]a);
        begin
            @(negedge clk);
            data_in=a;
            we=1'b1;
            re=1'b0;
        end
    endtask
    task reset();
        begin
            @(negedge clk);
            rst=1'b1;
            @(negedge clk);
            rst=1'b0;
        end
    endtask
    task read();begin
        @(negedge clk);
        re=1'b1;
        we=1'b0;
        end
    endtask
    integer i;
    initial begin
        reset();
        for(i=0;i<8;i=i+1)begin
            data(i);
        end
        read();
    end
    
endmodule
