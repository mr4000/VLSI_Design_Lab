`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2025 12:47:59 PM
// Design Name: 
// Module Name: Add_sub_tb
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


module tb_adder_subtractor_with_cin;

    // Inputs
    reg [31:0] A;
    reg [31:0] B;
    reg cin;
   

    // Outputs for Brent-Kung
    wire [31:0] result_bk;
    wire cout_bk;

    // Outputs for Operator-Based
    wire [31:0] result_op;
    wire cout_op;

    // Instantiate Brent-Kung Adder/Subtractor
    adder_subtractor_bk bk_uut (
        .sum(result_bk),
        .cout(cout_bk),
        .A(A),
        .B(B),
        .cin(cin)
        
    );

//    // Instantiate Operator-Based Adder/Subtractor
//    adder_subtractor_operator op_uut (
//        .sum(result_op),
//        .cout(cout_op),
//        .A(A),
//        .B(B),
//        .cin(cin)
        
//    );

    // Test stimulus
    initial begin
        $monitor("Time: %0t | A: %h | B: %h | cin: %b | op: %b | BK_Result: %h | BK_Cout: %b | OP_Cout: %b", 
                 $time, A, B, cin,result_bk, cout_bk, result_op, cout_op);

        // Test Case 1: Addition with carry-in
         A = 32'h0000000F; B = 32'h00000001; cin = 1;   // 15 + 1 + 1
        #10 A = 32'hFFFFFFFF; B = 32'h00000001; cin = 0;   // Max + 1 (Overflow)

        // Test Case 2: Subtraction with carry-in
        #10 A = 32'h00000010; B = 32'h00000001; cin = 1;  // 16 - 1 + 1
        #10 A = 32'h00000000; B = 32'h00000001; cin = 0;   // 0 - 1

        // Test Case 3: Random values with carry-in
        #10 A = 32'h12345678; B = 32'h87654321; cin = 1; // Random addition
        #10 A = 32'h87654321; B = 32'h12345678; cin = 0;  // Random subtraction

        // Test Case 4: Large numbers with carry-in
        #10 A = 32'h80000000; B = 32'h80000000; cin = 1;   // Large addition
        #10 A = 32'h80000000; B = 32'h00000001; cin = 0;  // Large subtraction

        // End simulation
        #10 $finish;
    end

endmodule
