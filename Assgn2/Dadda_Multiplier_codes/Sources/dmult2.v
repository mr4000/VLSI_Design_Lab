`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2025 11:18:42 PM
// Design Name: 
// Module Name: dmult2
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


module d_mult2(
  input [15:0] A,
  input [15:0] B,
  output [31:0] res
);

  assign res = A * B;

endmodule

