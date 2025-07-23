`timescale 1ns / 1ps

module lifo(
    input clk, rst, we, re,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output full, empty
);

    reg [7:0] mem[15:0];
    reg [4:0] pointer; // Changed from integer to 5-bit register
    integer i;

    // Synchronous logic
    always @(posedge clk) begin
        if (rst) begin
            data_out <= 8'd0;
            pointer <= 5'd0;
            for (i = 0; i < 16; i = i + 1)
                mem[i] <= 8'd0;
        end
        else if (we && !full) begin
            mem[pointer] <= data_in;
            pointer <= pointer + 1;
        end
        else if (re && !empty) begin
            pointer <= pointer - 1;
            data_out <= mem[pointer - 1];
        end
    end

    assign full = (pointer == 5'd16); // Full when pointer reaches 16
    assign empty = (pointer == 5'd0); // Empty when pointer is 0

endmodule

