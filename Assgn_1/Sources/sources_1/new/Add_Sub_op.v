`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2025 12:25:41 PM
// Design Name: 
// Module Name: Add_Sub_op
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


module adder_subtractor_operator(
    output [31:0] sum,
    output cout,
    input [31:0] A,
    input [31:0] B,
    input cin  // Carry-in
  
);

    wire [31:0] B_complement;
    
 

    // Complement B if cin = 1
   assign B_complement = B ^ {32{cin}};

    // Perform addition with carry-in
    assign {cout, sum} = A + B_complement +  cin;

    // Output assignment


endmodule


