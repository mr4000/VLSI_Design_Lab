`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2025 11:33:18 PM
// Design Name: 
// Module Name: Barrel_shifter_op
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

    
    module Barrel_Shifter_op(

    input [7:0] in1,   // 8-bit input data
    input [2:0] shift,     // 3-bit shift amount (0 to 7)
    input LR,             // Direction: 0 for left, 1 for right
    output reg [7:0] data_out  );
    
    
    always @(*)
    begin
    if(LR)
    data_out <= in1 <<(shift);
    else
    data_out <= in1 >>(shift);
  end
endmodule
