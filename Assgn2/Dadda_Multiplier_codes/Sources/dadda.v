`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2025 10:53:42 PM
// Design Name: 
// Module Name: dadda_mult
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


module d_mult(
  input [15:0] A,
  input [15:0] B,
  output [31:0] res
);

reg [30:0] pp[15:0];
integer i, j;
reg [1:0] ha_tmp;
reg [1:0] fa_tmp, fa_tmp1, fa_tmp2, fa_tmp3;
reg c_tmp, c_tmp1, c_tmp2, c_tmp3;
reg [31:0] s_temp, s_temp1;

task half_adder;
  input p, q;
  output [1:0] result;
  begin
    result[0] = p ^ q;
    result[1] = p & q;
  end
endtask


task full_adder;
  input m, n, cin;
  output [1:0] result;
  begin
    result[0] = m ^ n ^ cin;
    result[1] = (m & n) | (n & cin) | (m & cin);
  end
endtask

always @(*)
begin
    // Initialize partial products to zero
    for (i = 0; i < 16; i = i + 1)
    begin
        pp[i] = 31'd0;
    end

    // Partial products calculation
    for (i = 0; i < 16; i = i + 1)
    begin
        for (j = 0; j < 16; j = j + 1)
        begin
            pp[i][j + i] = B[i] & A[j];
        end
    end

    // Creating triangle structure for better visualization and reducing complexity
    for (j = 16; j < 31; j = j + 1)
    begin
        for (i = (j - 15); i < 16; i = i + 1)
        begin
            pp[i - (j - 15)][j] = pp[i][j];
            pp[i][j] = 0;
        end
    end

    // Reduction to d = 13
    half_adder(pp[12][13], pp[13][13], ha_tmp);
    pp[12][13] = ha_tmp[0];
    c_tmp = ha_tmp[1];

    full_adder(pp[12][14], pp[13][14], pp[14][14], fa_tmp);
    half_adder(fa_tmp[0], c_tmp, ha_tmp);
    pp[12][14] = ha_tmp[0];
    c_tmp = fa_tmp[1];
    c_tmp1 = ha_tmp[1];

    full_adder(pp[13][15], pp[14][15], pp[15][15], fa_tmp1);
    full_adder(pp[12][15], c_tmp1, c_tmp, fa_tmp2);
    half_adder(fa_tmp1[0], fa_tmp2[0], ha_tmp);
    pp[12][15] = ha_tmp[0];
    c_tmp = fa_tmp1[1];
    c_tmp1 = fa_tmp2[1];
    c_tmp2 = ha_tmp[1];

    full_adder(pp[12][16], pp[13][16], pp[14][16], fa_tmp1);
    full_adder(c_tmp2, c_tmp1, c_tmp, fa_tmp2);
    half_adder(fa_tmp1[0], fa_tmp2[0], ha_tmp);
    pp[12][16] = ha_tmp[0];
    c_tmp = fa_tmp1[1];
    c_tmp1 = fa_tmp2[1];
    c_tmp2 = ha_tmp[1];

    full_adder(c_tmp2, pp[12][17], pp[13][17], fa_tmp1);
    full_adder(fa_tmp1[0], c_tmp1, c_tmp, fa_tmp2);
    pp[12][17] = fa_tmp2[0];
    c_tmp = fa_tmp1[1];
    c_tmp1 = fa_tmp2[1];

    full_adder(pp[12][18], c_tmp, c_tmp1, fa_tmp1);
    pp[12][18] = fa_tmp1[0];
    pp[12][19] = fa_tmp1[1];

    // Reduction to d = 9
    half_adder(pp[8][9], pp[9][9], ha_tmp);
    pp[8][9] = ha_tmp[0];
    c_tmp = ha_tmp[1];

    full_adder(pp[8][10], pp[9][10], pp[10][10], fa_tmp);
    half_adder(fa_tmp[0], c_tmp, ha_tmp);
    pp[8][10] = ha_tmp[0];
    c_tmp = fa_tmp[1];
    c_tmp1 = ha_tmp[1];

    full_adder(pp[9][11], pp[10][11], pp[11][11], fa_tmp1);
    full_adder(pp[8][11], c_tmp1, c_tmp, fa_tmp2);
    half_adder(fa_tmp1[0], fa_tmp2[0], ha_tmp);
    pp[8][11] = ha_tmp[0];
    c_tmp = fa_tmp1[1];
    c_tmp1 = fa_tmp2[1];
    c_tmp2 = ha_tmp[1];

    full_adder(pp[10][12], pp[11][12], pp[12][12], fa_tmp);
    full_adder(pp[8][12], pp[9][12], c_tmp, fa_tmp1);
    full_adder(fa_tmp[0], c_tmp1, c_tmp2, fa_tmp2);
    half_adder(fa_tmp1[0], fa_tmp2[0], ha_tmp);
    pp[8][12] = ha_tmp[0];
    c_tmp = fa_tmp[1];
    c_tmp1 = fa_tmp1[1];
    c_tmp2 = fa_tmp2[1];
    c_tmp3 = ha_tmp[1];

    for (j = 13; j < 20; j = j + 1)
    begin
        full_adder(pp[10][j], pp[11][j], pp[12][j], fa_tmp);
        full_adder(pp[8][j], pp[9][j], c_tmp, fa_tmp1);
        full_adder(fa_tmp[0], fa_tmp1[0], c_tmp1, fa_tmp2);
        full_adder(fa_tmp2[0], c_tmp2, c_tmp3, fa_tmp3);
        pp[8][j] = fa_tmp3[0];
        c_tmp = fa_tmp[1];
        c_tmp1 = fa_tmp1[1];
        c_tmp2 = fa_tmp2[1];
        c_tmp3 = fa_tmp3[1];
    end

    full_adder(pp[8][20], pp[9][20], pp[10][20], fa_tmp);
    full_adder(fa_tmp[0], c_tmp, c_tmp1, fa_tmp1);
    full_adder(fa_tmp1[0], c_tmp2, c_tmp3, fa_tmp2);
    pp[8][20] = fa_tmp2[0];
    c_tmp = fa_tmp[1];
    c_tmp1 = fa_tmp1[1];
    c_tmp2 = fa_tmp2[1];

    full_adder(c_tmp, pp[8][21], pp[9][21], fa_tmp);
    full_adder(fa_tmp[0], c_tmp1, c_tmp2, fa_tmp1);
    pp[8][21] = fa_tmp1[0];
    c_tmp = fa_tmp[1];
    c_tmp1 = fa_tmp1[1];

    full_adder(c_tmp, c_tmp1, pp[8][22], fa_tmp);
    pp[8][22] = fa_tmp[0];
    pp[8][23] = fa_tmp[1];

    // Reduction to d = 6
    half_adder(pp[5][6], pp[6][6], ha_tmp);
    pp[5][6] = ha_tmp[0];
    c_tmp = ha_tmp[1];

    full_adder(pp[5][7], pp[6][7], pp[7][7], fa_tmp);
    half_adder(fa_tmp[0], c_tmp, ha_tmp);
    pp[5][7] = ha_tmp[0];
    c_tmp = fa_tmp[1];
    c_tmp1 = ha_tmp[1];

    full_adder(pp[6][8], pp[7][8], pp[8][8], fa_tmp1);
    full_adder(pp[5][8], c_tmp1, c_tmp, fa_tmp2);
    half_adder(fa_tmp1[0], fa_tmp2[0], ha_tmp);
    pp[5][8] = ha_tmp[0];
    c_tmp = fa_tmp1[1];
    c_tmp1 = fa_tmp2[1];
    c_tmp2 = ha_tmp[1];

    for (j = 9; j < 24; j = j + 1)
    begin
        full_adder(pp[8][j], pp[7][j], pp[6][j], fa_tmp);
        full_adder(pp[5][j], c_tmp, c_tmp1, fa_tmp1);
        full_adder(fa_tmp[0], fa_tmp1[0], c_tmp2, fa_tmp2);
        pp[5][j] = fa_tmp2[0];
        c_tmp = fa_tmp[1];
        c_tmp1 = fa_tmp1[1];
        c_tmp2 = fa_tmp2[1];
    end

    full_adder(pp[6][24], pp[5][24], c_tmp, fa_tmp);
    full_adder(fa_tmp[0], c_tmp1, c_tmp2, fa_tmp1);
    pp[5][24] = fa_tmp1[0];
    c_tmp = fa_tmp[1];
    c_tmp1 = fa_tmp1[1];

    full_adder(pp[5][25], c_tmp, c_tmp1, fa_tmp);
    pp[5][25] = fa_tmp[0];
    pp[5][26] = fa_tmp[1];

    // Reduction to d = 4
    half_adder(pp[3][4], pp[4][4], ha_tmp);
    pp[3][4] = ha_tmp[0];
    c_tmp = ha_tmp[1];

    full_adder(pp[3][5], pp[4][5], pp[5][5], fa_tmp);
    half_adder(fa_tmp[0], c_tmp, ha_tmp);
    pp[3][5] = ha_tmp[0];
    c_tmp = fa_tmp[1];
    c_tmp1 = ha_tmp[1];

    for (j = 6; j < 27; j = j + 1)
    begin
        full_adder(pp[3][j], pp[4][j], pp[5][j], fa_tmp);
        full_adder(c_tmp, c_tmp1, fa_tmp[0], fa_tmp1);
        pp[3][j] = fa_tmp1[0];
        c_tmp = fa_tmp[1];
        c_tmp1 = fa_tmp1[1];
    end

    full_adder(pp[3][27], c_tmp, c_tmp1, fa_tmp);
    pp[3][27] = fa_tmp[0];
    pp[3][28] = fa_tmp[1];

    // Reduction to d = 3
    half_adder(pp[2][3], pp[3][3], ha_tmp);
    pp[2][3] = ha_tmp[0];
    c_tmp = ha_tmp[1];

    for (j = 4; j < 29; j = j + 1)
    begin
        full_adder(pp[3][j], pp[2][j], c_tmp, fa_tmp);
        pp[2][j] = fa_tmp[0];
        c_tmp = fa_tmp[1];
    end
    pp[2][29] = c_tmp;

    // Reduction to d = 2
    half_adder(pp[1][2], pp[2][2], ha_tmp);
    pp[1][2] = ha_tmp[0];
    c_tmp = ha_tmp[1];

    for (j = 3; j < 30; j = j + 1)
    begin
        full_adder(pp[1][j], pp[2][j], c_tmp, fa_tmp);
        pp[1][j] = fa_tmp[0];
        c_tmp = fa_tmp[1];
    end
    pp[1][30] = c_tmp;

    for (j = 0; j < 31; j = j + 1)
    begin
        s_temp[j] = pp[0][j];
    end

    for (j = 0; j < 31; j = j + 1)
    begin
        s_temp1[j] = pp[1][j];
    end

    s_temp[31] = 0;
    s_temp1[31] = 0;
end

wire cout;
bkadder_32 add (
    .A(s_temp),
    .B(s_temp1),
    .cin(1'b0),
    .Y(res),
    .cout(cout)
);

endmodule

