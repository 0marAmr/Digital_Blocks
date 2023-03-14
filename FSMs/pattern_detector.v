`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2023 10:44:03 PM
// Design Name: 
// Module Name: pattern_detector
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: an overlapping pattern detector that detects the sequence 11010
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: we have 6 states in total (moore machine requires an extra state for the output)
// 
//////////////////////////////////////////////////////////////////////////////////


module pattern_detector(
        input clk, n_rst,
        input stream_in,
        output reg pattern_found,
        output test 
    );


    localparam state_reg_width = 3;
    localparam [state_reg_width-1: 0]   N = 3'b000, // 1
                                        A = 3'b001, // 11
                                        B = 3'b010, // 11
                                        C = 3'b011, // 110
                                        D = 3'b100, // 1101
                                        E = 3'b101; // 11010
    
    reg [state_reg_width-1: 0 ] current_state, next_state;
    
    // state register
    always @(posedge clk or negedge n_rst) begin
        if(!n_rst) begin
            current_state <= A;
        end
        else begin
            current_state <= next_state;
        end
    end

wire test2;
    // next state & output logic
    always @(*) begin
        // initial values
        next_state = N;
        pattern_found = 0;
        case (current_state)
            
            N: begin 
                // NS logic
                if (stream_in) 
                    next_state = A;
                else 
                    next_state = N;
            end

            A: begin 
                // NS logic
                if (stream_in) 
                    next_state = B;
                else 
                    next_state = N;
            end
                        
            B: begin
                // NS logic
                if (stream_in) 
                    next_state = B;
                else 
                    next_state = C;
            end
                        
            C: begin
                // NS logic
                if (stream_in) 
                    next_state = D;
                else 
                    next_state = N; // 00
            end
                        
            D: begin
                // NS logic
                if (stream_in) 
                    next_state = B; // 11
                else 
                    next_state = E;
            end
                        
            E: begin
                // NS logic
                if (stream_in) 
                    next_state = A;
                else 
                    next_state = N; // 00

                // OP logic
                pattern_found = 1;
            end
        endcase
    end

endmodule
