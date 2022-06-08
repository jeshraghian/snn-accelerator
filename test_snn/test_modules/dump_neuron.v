module dump();
    initial begin
        $dumpfile ("neuron.vcd");
        $dumpvars (0, neuron);
        #1;
    end
endmodule
