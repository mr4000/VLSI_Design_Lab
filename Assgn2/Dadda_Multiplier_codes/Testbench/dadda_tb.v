
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2025 12:35:38 AM
// Design Name: 
// Module Name: dadda_tb
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


`timescale 1ns / 1ps

module dadda_multiplier_tb;
  reg [15:0] A,B;
  wire [31:0] Y;

  d_mult dut(.A(A),.B(B),.res(Y));
    
    initial  begin
      $monitor("%d %d %d",A,B,Y);
        A = 0;
        B = 0;
        #200 $finish;
     end
     
    always begin
        A = $random;
        B = $random;
        #10;
    end
      
endmodule
