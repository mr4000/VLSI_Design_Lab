`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2025 04:26:37 PM
// Design Name: 
// Module Name: design_wrapper_tb_2
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




module tb_design_2_wrapper;

  // Inputs
  reg add_sub_0;
  reg clk_0;
  reg start_stop_0;

  // Outputs
  wire cout_0;
  wire [31:0] sum_0;

  // Instantiate the design_2_wrapper module
  design_2_wrapper uut (
    .add_sub_0(add_sub_0),
    .clk_0(clk_0),
    .cout_0(cout_0),
    .start_stop_0(start_stop_0),
    .sum_0(sum_0)
  );

  // Clock generation
  always begin
    clk_0 = 0; #5;
    clk_0 = 1; #5;
  end

  // Stimulus generation
  initial begin
    // Initialize inputs
  

    // Apply stimulus to the inputs
    
    add_sub_0 = 0; // Set add_sub_0 to 1 (for subtraction operation)
    start_stop_0 = 1; // Start operation

    // Test with different inputs
    #40;
    add_sub_0 = 0; // Subtraction operation
    start_stop_0 = 1; // Start operation
    #50;
    add_sub_0 = 1; // Addition operation
    start_stop_0 = 1; // Stop operation

    #100;
    
    // Finish the simulation
    $finish;
  end

  // Monitor the signals
  initial begin
    $monitor("Time = %0t, add_sub_0 = %b, start_stop_0 = %b, cout_0 = %b, sum_0 = %h", 
             $time, add_sub_0, start_stop_0, cout_0, sum_0);
  end

endmodule

