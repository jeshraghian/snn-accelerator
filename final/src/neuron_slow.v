`default_nettype none
`timescale 1ns/1ns
module neuron_slow (
    input wire               clk,
    input wire               clk_decay,
    input wire               reset,
    input wire [7:0]    post_synaptic,
    output reg               spike
);

    reg  [7:0] state, state_shift, threshold;
    wire [7:0] state_hist;

    assign state_hist = post_synaptic + (spike ? 0 : state >> 1); // scale by 1/2

    always @(posedge clk_decay) begin
        if (reset)
            state <= 0;
        else
            state <= state_hist; 
    end

    // to-do: check for overflow
    always @(posedge clk) begin
        if (reset) begin
            threshold <= 32;
            // state <= 0; 
            state_shift <= 0;
            spike <= 0;
        end else begin
            // state <= state_hist; 
            spike <= (state >= threshold);

        end
    end

endmodule