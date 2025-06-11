module Control_Unit (
    input  clk,               
    input  start_stop,  
    input  left_right,                        
    input wire [10:0] douta,      
    output reg [7:0] in1,        
    output reg [2:0] shift,    
    
    output reg ena,  
    output reg LR,        
    output reg [2:0] addra        
);

    

   always @(posedge clk) begin
        if (!start_stop) begin
            ena <= 0;                  // Disable BRAM read
            addra <= 3'b000;           // Reset BRAM address to 0
            in1 <= 8'b00000000;        // Reset input data
            shift <= 3'b000;           // Reset shift amount
        end 
        else begin
            ena <= 1;   
            in1 <= douta[10:3];        
            shift <= douta[2:0];       
            LR <= left_right ? 1 : 0;

            if (addra == 3'b111) begin
                addra <= 3'b000;       
            end else begin
                addra <= addra + 1;    
            end
        end
    end
endmodule
