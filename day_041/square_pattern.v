`timescale 1ns / 1ps
module pattern();
    integer i,j;
    initial begin
        for(i=1;i<=6;i=i+1)
            begin
            for(j=0;j<i;j=j+1)
                $write("");
            for(j=0;j<=6-i;j=j+1)
                $write("%d",i);
            end
            $display("");
    end     
endmodule
