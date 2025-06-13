`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2025 01:13:18 PM
// Design Name: 
// Module Name: bk_adder_tb
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

module tb_bkadder_32;

    // Inputs
    reg [31:0] A;
    reg [31:0] B;
    reg cin;


    // Outputs
    wire [31:0] Y;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    bkadder_32 uut (
        .Y(Y),
        .cout(cout),
        .A(A),
        .B(B),
        .cin(cin)   
    );



    // Test Stimulus
    initial begin
        // Initialize Inputs
        A = 0;
        B = 0;
        cin = 0;

        // Test Case 1: Adding two small numbers
        #10 A = 32'h00000005; B = 32'h00000003; cin = 1'b0; // 5 + 3
        #20;

        // Test Case 2: Adding with carry-in
        #10 A = 32'h00000007; B = 32'h00000009; cin = 1'b1; // 7 + 9 + 1
        #20;

        // Test Case 3: Adding two large numbers
        #10 A = 32'hFFFFFFFE; B = 32'h00000001; cin = 1'b0; // Max - 1 + 1
        #20;

        // Test Case 4: Adding with overflow
        #10 A = 32'hFFFFFFFF; B = 32'h00000001; cin = 1'b0; // Max + 1
        #20;

        // Test Case 5: Random test case
        #10 A = 32'h12345678; B = 32'h87654321; cin = 1'b1; // Random numbers
        #20;

        // Test Case 6: All zeros
        #10 A = 32'h00000000; B = 32'h00000000; cin = 1'b0; // Zero + Zero
        #20;

        // Test Case 7: All ones
        #10 A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; cin = 1'b1; // Max + Max + 1
        #20;

        // End simulation
        #10 $finish;
    end

    // Monitor Outputs
    initial begin
        $monitor("Time = %0t | A = %h | B = %h | cin = %b | Sum = %h | cout = %b",
                 $time, A, B, cin, Y, cout);
    end

endmodule


