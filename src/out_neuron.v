`default_nettype none
`timescale 1ns/1ns

module out_neuron (
    input wire              clk,
    input wire              reset,
    input wire [127:0]      fan_in,
    output reg              spike,
    output reg [7:0]        state
);

    reg [7:0] threshold;
    wire [7:0] post_synaptic, state_hist;

    num_ones num_ones0 (.A(fan_in), .ones(post_synaptic));
    assign state_hist = post_synaptic + (spike ? 0 : (state >> 1)); // scale by 1/

    integer i;
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

module num_ones (
    input [127:0] A,
    output reg [7:0] ones
    );

    integer i;

    always@(A)
    begin
        ones = 0;  //initialize count variable.
        for(i=0;i<128;i=i+1)   //for all the bits.
            ones = ones + A[i]; //Add the bit to the count.
    end

endmodule