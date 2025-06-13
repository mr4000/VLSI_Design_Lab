`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2025 11:45:18 PM
// Design Name: 
// Module Name: design_wrapper_tb
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

  
  reg reset_rtl;
  reg sys_clock;

  
  design_1_wrapper DUT (
    .reset_rtl(reset_rtl),
    .sys_clock(sys_clock)
  );

  
  initial begin
    sys_clock = 0;
    forever #5 sys_clock = ~sys_clock; 
  end

  
  initial begin
    reset_rtl = 0; 
    $finish;
  end

endmodule

