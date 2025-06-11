`timescale 1ns / 1ps

module controller (
    input clk,              // Clock signal         
    input start_stop,       // Start/Stop signal
    input add_sub,          // Add/Subtract mode (0 = Add, 1 = Subtract)
    input [63:0] douta,     // Data output from BRAM
    output reg [31:0] A,    // Operand A
    output reg [31:0] B,    // Operand B
    output reg [3:0] addra =4'b0000,  // Address to BRAM
    output reg cin, 
    output reg ena  // Enable signal
             // Carry-in to the adder (add_sub passed here)
);

    // Sequential block for managing operations
// State encoding
  
 parameter IDLE      = 2'b00,  // Idle state
        INIT      = 2'b01,  // Initialization state
        RUNNING   = 2'b10;   // Normal operation state
   

    reg [1:0] current_state, next_state;

// Sequential block for state transitions
    always @(posedge clk) begin
        if (!start_stop) begin
            current_state <= IDLE; // Reset to IDLE when start_stop is low
        end else begin
            current_state <= next_state;
        end
    end

    // Combinational block for state logic and outputs
    always @(*) begin
        // Default values for outputs
        ena = 0;
        cin = 0;
        next_state = current_state; // Default state is the current state

        case (current_state)
            IDLE: begin
                // Reset all outputs in IDLE state
                A = 32'd0;
                B = 32'd0;
                addra = 4'd0;
                ena = 0;
                cin = 0;

                if (start_stop) begin
                    next_state = INIT; // Move to INIT state on start
                end
            end

            INIT: begin
                // Initialization phase: Read the first BRAM value
                A = douta[63:32];
                ena = 1; // Enable operation

                if (add_sub) begin
                    // Subtraction: 2's complement of B with cin = 1
                    B = ~douta[31:0] + 1; 
                    cin = 0;
                end else begin
                    // Addition: Use B as is with cin = 0
                    B = douta[31:0];
                    cin = 0;
                end

                next_state = RUNNING; // Move to RUNNING state after initialization
            end

            RUNNING: begin
                // Normal operation: Increment address and drive outputs
                ena = 1; // Keep enabled
                A = douta[63:32];

                if (add_sub) begin
                    // Subtraction: 2's complement of B with cin = 1
                    B = ~douta[31:0] + 1;
                    cin = 0;
                end else begin
                    // Addition: Use B as is with cin = 0
                    B = douta[31:0];
                    cin = 0;
                end

                // Increment address and wrap around
                if (addra == 4'd15) begin
                    addra = 4'd0; // Wrap around
                end else begin
                    addra = addra + 1;
                end
            end

            default: begin
                // Default behavior: Reset everything
                A = 32'd0;
                B = 32'd0;
                addra = 4'd0;
                ena = 0;
                cin = 0;
                next_state = IDLE;
            end
        endcase
    end

endmodule




