module dump();
    initial begin
        $dumpfile ("snn.vcd");
        $dumpvars (0, snn);
        #1;
    end
endmodule
