`timescale 1ns/1ps

module ring_counter (
    input  wire       clk,
    input  wire       reset,
    output reg  [3:0] q
);

    // Initialize one bit to 1.
    // The '1' rotates through the four flip-flops.
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b1000;
        else begin
            q[3] <= q[0];
            q[2] <= q[3];
            q[1] <= q[2];
            q[0] <= q[1];
        end
    end

endmodule