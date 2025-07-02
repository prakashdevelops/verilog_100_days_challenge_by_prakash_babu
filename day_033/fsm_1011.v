`timescale 1ns / 1ps
module fsm_1011(clk,rst,in,out);
    parameter s0=3'b000,
              s1=3'b001,
              s2=3'b010,
              s3=3'b011,
              s4=3'b100;
    reg [2:0] p_s,n_s;
    input clk,rst,in; 
    output out;
    always@(posedge clk)
        begin
        if(rst)
         begin
         p_s<=s0;
         //out<=1'b0;
         end
         else
         p_s<=n_s;
        end
   always@(*)
    begin
       n_s=s0;
        case(p_s)
            s0:if(in==1'b0)
                n_s=s0;
                else
                n_s=s1;
            s1:if(in==1'b0)
                n_s=s2;
                else
                n_s=s1;
            s2:if(in==1'b1)
                n_s=s3;
                else
                n_s=s0;
            s3:if(in==1'b1)
                n_s=s4;
                else
                n_s=s2;
            s4:if(in==1'b1)
                n_s=s1;
                else
                n_s=s2;
         endcase
    end
   assign out=(p_s==s4)?1:0;
endmodule
