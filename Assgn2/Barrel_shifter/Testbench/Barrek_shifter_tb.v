`timescale 1ns / 1ps

module Barrel_Shifter_tb;

    
    reg [7:0] in;      
    reg [2:0] shift;   
    reg LR;            

    
    wire [7:0] data_out; 

    
    Barrel_Shifter_op uut (
        .in1(in),
        .shift(shift),
        .LR(LR),
        .data_out(data_out)
    );

    
    initial begin
       
        in = 8'b00110011;  
        $display("Time\tLR\tShift\tInput\t\tOutput");

        
       for( LR = 0; LR<=1;LR=LR+1)
       begin
       shift = 3'b000; #5;
        $display("%d\t%b\t%b\t%b\t%b", $time, LR, shift, in, data_out);

        shift = 3'b001; #5;
        $display("%d\t%b\t%b\t%b\t%b", $time, LR, shift, in, data_out);

        shift = 3'b010; #5;
        $display("%d\t%b\t%b\t%b\t%b", $time, LR, shift, in, data_out);

        shift = 3'b011; #5;
        $display("%d\t%b\t%b\t%b\t%b", $time, LR, shift, in, data_out);

        shift = 3'b100; #5;
        $display("%d\t%b\t%b\t%b\t%b", $time, LR, shift, in, data_out);

        shift = 3'b101; #5;
        $display("%d\t%b\t%b\t%b\t%b", $time, LR, shift, in, data_out);

        shift = 3'b110; #5;
        $display("%d\t%b\t%b\t%b\t%b", $time, LR, shift, in, data_out);

        shift = 3'b111; #5;
        $display("%d\t%b\t%b\t%b\t%b", $time, LR, shift, in, data_out);
        end


        $finish;
    end
endmodule
