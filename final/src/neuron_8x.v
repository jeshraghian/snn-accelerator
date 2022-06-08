`default_nettype none
`timescale 1ns/1ns
module neuron_8x (
    input wire               clk,
    input wire               reset,
    input wire [7:0]         post_synaptic,
    output reg               spike
);

    reg  [7:0] state, threshold;
    wire [7:0] state_hist;

    assign state_hist = post_synaptic + (spike ? 0 : (state >> 4)); // scale by 1/16


    // to-do: check for overflow
    always @(posedge clk) begin
        if (reset) begin
            threshold <= 32;
            state <= 0;
            spike <= 0;
        end else begin
            state <= state_hist;
            spike <= (state >= threshold);

        end
    end

endmodule