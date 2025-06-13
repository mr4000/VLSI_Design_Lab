`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/13/2025 10:15:02 PM
// Design Name: 
// Module Name: design_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module design_1_wrapper_tb;

  // Inputs for the wrapper module
  reg reset_rtl;
  reg sys_clock;

  // Instantiate the design_1_wrapper module
  design_1_wrapper uut (
    .reset_rtl(reset_rtl),
    .sys_clock(sys_clock)
  );

  // Clock generation (50 MHz clock, period = 20 ns)
  always begin
    #10 sys_clock = ~sys_clock; // Toggle clock every 10 ns
  end

  // Simulation process
  initial begin
    // Initialize inputs
    reset_rtl = 0;
    sys_clock = 0;

    // Apply reset
    $display("Time: %0t | Reset applied", $time);
 //   reset_rtl = 1;
    #100;  // Hold reset for 100 ns

    // Release reset
    $display("Time: %0t | Reset released", $time);
    reset_rtl = 0;

    // Allow the simulation to run for a while
    #1000;

    // End simulation
    $display("Time: %0t | End of simulation", $time);
    $stop;
  end

endmodule

