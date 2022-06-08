`default_nettype none
`timescale 1ns/1ns

module snn (
`ifdef USE_POWER_PINS
	inout vccd1,	// User area 1 1.8V power
	input vssd1,	// User area 1 digital ground
`endif
    input wire          clk,
    input wire          reset,
    input wire [7:0]    in1,
    output [1:0]        spike_out,
    output [7:0]        state1,
    output [9:0]        io_oeb
);

    assign io_oeb = 10'b0;
    wire [127:0] spike;
    wire [7:0]   state2;
    wire clk2, clk3, clk4, clk5;
    clk_div clk_div0 (.clk(clk), .reset(reset), .clk2(clk2), .clk3(clk3), .clk4(clk4), .clk5(clk5));

    genvar i;
    generate
        for (i=0; i < 16; i = i+1) begin
            neuron a0 (.clk(clk), .reset(reset), .post_synaptic(in1), .spike(spike[i]));
        end

        for (i=16; i < 2*16; i = i+1) begin
            neuron_slow b0 (.clk(clk), .clk_decay(clk2), .reset(reset), .post_synaptic(in1), .spike(spike[i]));
        end

        for (i=2*16; i < 3*16; i = i+1) begin
            neuron_slow c0 (.clk(clk), .clk_decay(clk3), .reset(reset), .post_synaptic(in1), .spike(spike[i]));
        end

        for (i=3*16; i < 4*16; i = i+1) begin
            neuron_slow d0 (.clk(clk), .clk_decay(clk4), .reset(reset), .post_synaptic(in1), .spike(spike[i]));
        end

        for (i=4*16; i < 5*16; i = i+1) begin
            neuron_slow e0 (.clk(clk), .clk_decay(clk5), .reset(reset), .post_synaptic(in1), .spike(spike[i]));
        end

        for (i=5*16; i < 6*16; i = i+1) begin
            neuron_2x f0 (.clk(clk), .reset(reset), .post_synaptic(in1), .spike(spike[i]));
        end

        for (i=6*16; i < 7*16; i = i+1) begin
            neuron_4x g0 (.clk(clk), .reset(reset), .post_synaptic(in1), .spike(spike[i]));
        end

        for (i=7*16; i < 8*16; i = i+1) begin
            neuron_8x h0 (.clk(clk), .reset(reset), .post_synaptic(in1), .spike(spike[i]));
        end

    endgenerate

    // out
    out_neuron out_neuron0 (.clk(clk), .reset(reset), .fan_in(spike), .spike(spike_out[0]), .state(state1));
    out_neuron out_neuron1 (.clk(clk), .reset(reset), .fan_in(spike), .spike(spike_out[1]), .state(state2));

endmodule
