`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2025 07:49:33 PM
// Design Name: 
// Module Name: Barrel_Shifter
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


module Barrel_Shifter(

    input [7:0] in1,   // 8-bit input data
    input [2:0] shift,     // 3-bit shift amount (0 to 7)
    input LR,             // Direction: 0 for left, 1 for right
    output [7:0] data_out  );
    
    
    wire p1,p2,p3,p4,p5,p6,p7,p8;
    wire q1,q2,q3,q4,q5,q6,q7,q8;
    wire r1,r2,r3,r4,r5,r6,r7,r8;
    wire [7:0] out;
    
    // selecting Inputs based on LR
    
    mux2x1 m1(in1[0],in1[7],LR,p1);
    mux2x1 m2(in1[1],in1[6],LR,p2);
    mux2x1 m3(in1[2],in1[5],LR,p3);
    mux2x1 m4(in1[3],in1[4],LR,p4);
    mux2x1 m5(in1[4],in1[3],LR,p5);
    mux2x1 m6(in1[5],in1[2],LR,p6);
    mux2x1 m7(in1[6],in1[1],LR,p7);
    mux2x1 m8(in1[7],in1[0],LR,p8);
    
    //
     mux2x1 n1(p1,p2,shift[0],q1);
     mux2x1 n2(p2,p3,shift[0],q2);
     mux2x1 n3(p3,p4,shift[0],q3);
     mux2x1 n4(p4,p5,shift[0],q4);
     mux2x1 n5(p5,p6,shift[0],q5);
     mux2x1 n6(p6,p7,shift[0],q6);
     mux2x1 n7(p7,p8,shift[0],q7);
     mux2x1 n8(p8,1'b0,shift[0],q8);
     
     mux2x1 o1(q1,q3,shift[1],r1);
     mux2x1 o2(q2,q4,shift[1],r2);
     mux2x1 o3(q3,q5,shift[1],r3);
     mux2x1 o4(q4,q6,shift[1],r4);
     mux2x1 o5(q5,q7,shift[1],r5);
     mux2x1 o6(q6,q8,shift[1],r6);
     mux2x1 o7(q7,1'b0,shift[1],r7);
     mux2x1 o8(q8,1'b0,shift[1],r8);
     
     mux2x1 k1(r1,r5,shift[2],out[7]);
     mux2x1 k2(r2,r6,shift[2],out[6]);
     mux2x1 k3(r3,r7,shift[2],out[5]);
     mux2x1 k4(r4,r8,shift[2],out[4]);
     mux2x1 k5(r5,1'b0,shift[2],out[3]);
     mux2x1 k6(r6,1'b0,shift[2],out[2]);
     mux2x1 k7(r7,1'b0,shift[2],out[1]);
     mux2x1 k8(r8,1'b0,shift[2],out[0]);
     
genvar i;
generate
    for (i = 0; i < 8; i = i + 1) begin : gen_block
      assign data_out[i] = LR ? out[i] : out[7-i];
  end
endgenerate

     
     

    
endmodule
    
    // 2-to-1 Multiplexer module
module mux2x1 (
    input in0,   // Input 0
    input in1,   // Input 1
    input sel,   // Select signal
    output out   // Output
);
    assign out = sel ? in1 : in0;
endmodule
    
    
   
   



