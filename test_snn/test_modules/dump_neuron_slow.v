module dump();
    initial begin
        $dumpfile ("neuron_slow.vcd");
        $dumpvars (0, neuron_slow);
        #1;
    end
endmodule
