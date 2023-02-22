`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2023 02:05:51 PM
// Design Name: 
// Module Name: universal_shift_register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
/*
    An N universal shift register with parallel load. it can either shift its content left or right, or remain in the same state.
*/
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module univ_shift_reg
#(parameter N = 4)(
        input wire  clk, n_reset,
        input wire [1:0] ctrl,
        input wire [N-1: 0] D,
        output wire [N-1: 0] Q
    );

    reg  [N-1: 0] R_current; // resembles the current state.
    reg  [N-1: 0] R_next;    // resembles the next state.
    
    // register
    always @(posedge clk or negedge n_reset) begin
        if(~n_reset)
            R_current <= 0;
        else 
            R_current <= R_next;
    end

    // next state logic
    always @(*) begin
        case (ctrl)
            2'b00: R_next = R_current;                      // Store 
            2'b01: R_next = {R_current[N-2: 0], D[0]};      // shift left
            2'b10: R_next = {D[N-1], R_current[N-1: 1]};    // shift right
            2'b11: R_next = D;                              // parallel load 
        endcase
    end
    
    // OP logic
    assign Q = R_current;
endmodule
