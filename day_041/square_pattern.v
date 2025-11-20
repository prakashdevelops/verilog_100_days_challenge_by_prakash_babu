module pattern;

integer i, j;

initial begin
    for (i = 0; i < 5; i = i + 1) begin
        for (j = 0; j < 5; j = j + 1) begin
            
            if ((i == 1 || i == 3) && (j == 1 || j == 3))
                $write("  ");
            else
                $write("* ");

        end
        $display();
    end
end

endmodule
