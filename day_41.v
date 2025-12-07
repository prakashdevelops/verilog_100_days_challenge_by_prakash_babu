`timescale 1ns / 1ps
module counter_122333(clk,rst,count);
    input clk,rst;
    output reg [5:0]count;
    reg [5:0] curr_value;
    reg [5:0] rep_value;
    always@(posedge clk or posedge rst)
        begin
            if(rst)
                begin
                count<=6'd1;
                curr_value<=6'd1;
                rep_value<=6'd1;
                end
            else 
                begin
                    count<=curr_value;
                    if(rep_value==curr_value) begin
                        curr_value<=curr_value+6'd1;
                        rep_value<=6'd1;
                    end else begin
                            rep_value<=rep_value+6'd1;
                        end
                end
                      
        end
endmodule

//test bench

`timescale 1ns / 1ps
module tb_counter_122333();

    reg clk;
    reg rst;
    wire [5:0] count; 

    
    counter_122333 dut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );
    
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        #20;
        rst = 0;
        #1000;
      
        $stop;
    end

    initial begin
        $monitor("Time = %0t | count = %0d | rst = %b", $time, count, rst);
    end

endmodule
