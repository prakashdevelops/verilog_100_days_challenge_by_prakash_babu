`timescale 1ns / 1ps
module full_adder(a,b,cin,sum,carry);
    input a,b,cin;
    output sum,carry;
    assign sum=a^b^cin;
    assign carry=((a^b)&cin)|(a&b);    
endmodule


`timescale 1ns / 1ps
module ripple_carry_adder_adder(a,b,cin,cout,s);
    input [3:0]a,b;
    input cin;
    output cout;
    output [3:0]s;
    wire w0,w1,w2;
    full_adder fa0(a[0],b[0],cin,s[0],w0);
    full_adder fa1(a[1],b[1],w0,s[1],w1);
    full_adder fa2(a[2],b[2],w1,s[2],w2);
    full_adder fa3(a[3],b[3],w2,s[3],cout);
    
endmodule

`timescale 1ns / 1ps
module top_bcd_adder(a,b,cin,s,cout1,cout2,bcd_carry_bit);
    input [3:0]a,b;
    input cin;
    output cout1,cout2;
    output [3:0]s;
    output bcd_carry_bit;
    wire [3:0]w;
    wire y0,y1,y2;
    wire l=1'b0;
    wire g=1'b0;
    ripple_carry_adder stage1(a,b,cin,cout1,w);
    and gate0(y0,w[3],w[2]);
    and gate1(y1,w[3],w[1]);
    or gate2(y2,y0,y1);
    or gate3(bcd_carry_bit,cout1,y2);
    wire [3:0]six={1'b0,bcd_carry_bit,bcd_carry_bit,1'b0};
    ripple_carry_adder stage2(w,six,cin,cout2,s);
    wire [3:0]sum={cout1,s};
            
endmodule

//test bench


