`timescale 1 ns / 1 ps

module design_1_wrapper_tb;

  // Testbench signals
  reg reset_rtl;
  reg sys_clock;

  // Instantiate the design under test (DUT)
  design_1_wrapper DUT (
    .reset_rtl(reset_rtl),
    .sys_clock(sys_clock)
  );

  // Generate a clock signal
  initial begin
    sys_clock = 0;
    forever #3 sys_clock = ~sys_clock; // 100 MHz clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset_rtl = 0;

    // Apply reset
    #20 reset_rtl = 0; // De-assert reset after 20 ps
    #100 reset_rtl = 0; // Re-assert reset
    #50 reset_rtl = 0; // De-assert reset again

    // Run simulation for some time
    #500;

    // Finish simulation
    $stop;
  end

endmodule
