`timescale 1ns / 1ps

module top_bcd_adder_tb;

    reg [3:0] a, b;
    reg cin;
    wire [3:0] s;
    wire bcd_carry_bit;
    wire cout1,cout2;

    top_bcd_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .bcd_carry_bit(bcd_carry_bit),
        .cout1(cout1),
        .cout2(cout2)
    );

    initial begin
    $monitor("a=%d b=%d cin=%b =>  bcd_carry=%b sum=%d", a, b, cin, bcd_carry_bit,s);

        a = 4'd1; b = 4'd7; cin = 1'b0; #10;
        a = 4'd10; b = 4'd2; cin = 1'b0; #10;
        a = 4'd1; b = 4'd5; cin = 1'b0; #10;
        a = 4'd9; b = 4'd9; cin = 1'b0; #10;
        a = 4'd8; b = 4'd7; cin = 1'b0; #10;
        a = 4'd0; b = 4'd8; cin = 1'b0; #10;
        a = 4'd0; b = 4'd5; cin = 1'b0; #10;
        a = 4'd9; b = 4'd9; cin = 1'b0; #10;
       $monitor("a=%d b=%d cin=%b =>  bcd_carry=%b sum=%d", a, b, cin, bcd_carry_bit,s);

        $finish;
    end

endmodule
