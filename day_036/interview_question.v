//d flip flop
`timescale 1ns / 1ps
module d_flip_flop(
    input d,
    input clk,
    input clr,
    output reg q,
    output q_b
);
    always @(posedge clk) begin
        if(clr)
            q <= 1'b0;
        else 
            q <= d;
    end
    assign q_b = ~q;
endmodule

// t flip flop using d flip flop
`timescale 1ns / 1ps
module tff_using_d(
    input t,
    input clk,
    input clr,
    output q, 
    output q_b
);
    wire d;
    assign d = t ^ q;  // Toggle if T=1
    d_flip_flop dff_inst(
        .d(d),
        .clk(clk),
        .clr(clr),
        .q(q),
        .q_b(q_b)
    );
endmodule

// top module code

`timescale 1ns / 1ps
module interview(
    input clk,
    input rst,
    output out_clk
);
    wire w1, w2;

    tff_using_d tff_inst(
        .t(clk),      // assuming T input toggles with clk (not typical, but using your idea)
        .clk(clk),
        .clr(rst),
        .q(w1),
        .q_b(w2)
    );

    assign out_clk = w1 & clk;  // Logical AND for output
endmodule
