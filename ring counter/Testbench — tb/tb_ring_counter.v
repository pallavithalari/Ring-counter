`timescale 1ns/1ps

module tb_ring_counter;

    reg       clk;
    reg       reset;
    wire [3:0] q;

    // Instantiate DUT
    ring_counter uut (
        .clk   (clk),
        .reset (reset),
        .q     (q)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // Create waveform file
        $dumpfile("ring_counter.vcd");
        $dumpvars(0, tb_ring_counter);

        // Initialize signals
        clk   = 1'b0;
        reset = 1'b1;

        $display("========================================");
        $display("       4-BIT RING COUNTER TEST");
        $display("========================================");
        $display("Time\tReset\tQ");
        $display("----------------------------------------");

        $monitor("%0t\t%b\t%b", $time, reset, q);

        // Hold reset for 12 ns
        #12;
        reset = 1'b0;

        // Allow 8 clock cycles
        #80;

        $display("----------------------------------------");
        $display("Simulation completed successfully.");
        $finish;
    end

endmodule