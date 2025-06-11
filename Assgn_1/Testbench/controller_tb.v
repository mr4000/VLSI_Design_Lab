`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/13/2025 12:00:13 PM
// Design Name: 
// Module Name: controller_tb
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



module tb_controller;

    reg clk;
    reg ena;
    reg start_stop;
    reg add_sub;
    reg [63:0] douta;
    wire [31:0] A;
    wire [31:0] B;
    wire [3:0] addr;
    wire cin;

    // Instantiate the controller module
    controller uut (
        .clk(clk),
        .ena(ena),
        .start_stop(start_stop),
        .add_sub(add_sub),
        .douta(douta),
        .A(A),
        .B(B),
        .addr(addr),
        .cin(cin)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        ena = 0;
        start_stop = 0;
        add_sub = 0; // Start with addition mode
        douta = 64'h0;

        // Wait for a few cycles
        #20;

        // Enable controller
        ena = 1;

        // Test addition mode
        start_stop = 1;
        add_sub = 0; // Add mode

        // Provide some BRAM data (example data)
        #10 douta = 64'h12345678_9ABCDEF0;  // Address 0
        #10 douta = 64'h11112222_33334444;  // Address 1
        #10 douta = 64'h55556666_77778888;  // Address 2

        // Test subtraction mode
        add_sub = 1; // Subtract mode
        #10 douta = 64'h99999999_88888888;  // Address 3
        #10 douta = 64'h00001111_22223333;  // Address 4

        // Stop the controller
        #10 start_stop = 0;

        // Hold the controller in reset
        #20 ena = 0;

        // End simulation
        #50 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t | ena: %0b | start_stop: %0b | add_sub: %0b | addr: %0d | A: %h | B: %h | cin: %b | douta: %h",
                 $time, ena, start_stop, add_sub, addr, A, B, cin, douta);
    end

endmodule


