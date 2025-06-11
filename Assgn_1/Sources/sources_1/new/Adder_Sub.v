`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2025 12:22:42 PM
// Design Name: 
// Module Name: Adder_Sub
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
module adder_subtractor_bk (
    output [31:0] sum,
    output cout,
    input [31:0] A,
    input [31:0] B,
    input cin  // Carry-in; use cin=0 for addition, cin=1 for subtraction
);
    wire [31:0] B_mod;   // Modified B based on cin
        

    // If cin = 0: B_mod = B (for addition)
    // If cin = 1: B_mod = ~B (for subtraction)
    //
   // assign B_mod = B ^ {32{cin}};

    // Brent-Kung Adder Instance
    bkadder_32 bk_adder (
        .Y(sum),
        .cout(cout),
        .A(A),
        .B(B),
        .cin(cin)  // Pass carry-in to the adder
    );

endmodule


