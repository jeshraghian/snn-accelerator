module dump();
    initial begin
        $dumpfile ("out_neuron.vcd");
        $dumpvars (0, out_neuron);
        #1;
    end
endmodule
