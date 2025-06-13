`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2025 03:36:10 PM
// Design Name: 
// Module Name: controller
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
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2025 22:02:53
// Design Name: 
// Module Name: ControlUnit
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
module ControlUnit(
    input clka,
    input [31:0] douta,
    input  start_stop,
    output reg ena,
    output reg [2:0] addra,
    output reg [15:0] a,
    output reg [15:0] b
);

  

  // Output logic
    always @(posedge clka) begin
        if(!start_stop)
        begin
                a <= 16'b0;
                b <= 16'b0;
                ena <= 0;        // Disable output enable in IDLE state
                addra <= 3'b000; // Set address to a default value (e.g., 0)
        end
        else 
        begin
                a <= douta[31:16];
                b <= douta[15:0]; 
                ena <= 1;        // Enable output in READ state
                addra <= addra + 1;  // Example address assignment, you can adjust it
        end 
    end 
endmodule
