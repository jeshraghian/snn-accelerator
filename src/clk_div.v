`default_nettype none
`timescale 1ns/1ns

module clk_div (
    input wire  clk,
    input wire  reset,
    output reg  clk2,
    output reg  clk3,
    output reg  clk4,
    output reg  clk5
);

    // div by 2, i.e., beta=0.75
    always @(posedge clk) begin
        if (reset)
            clk2 <= 0;
        else
            clk2 <= ~clk2;
    end

    // div by 4, i.e., beta=0.875
    always @(posedge clk2) begin
        if (reset)
            clk3 <= 0;
        else
            clk3 <= ~clk3;
    end

    // div by 8, i.e., beta=0.9375
    always @(posedge clk3) begin
        if (reset)
            clk4 <= 0;
        else
            clk4 <= ~clk4;
    end

    // div by 16, i.e., beta=0.96875
    always @(posedge clk4) begin
        if (reset)
            clk5 <= 0;
        else
            clk5 <= ~clk5;
    end


endmodule