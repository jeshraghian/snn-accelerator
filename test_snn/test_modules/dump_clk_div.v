module dump();
    initial begin
        $dumpfile ("clk_div.vcd");
        $dumpvars (0, clk_div);
        #1;
    end
endmodule
