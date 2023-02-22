`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:    Omar Amr
// 
// Create Date: 02/16/2023 06:09:01 PM
// Design Name: 
// Module Name: d_flip_flop
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


module d_ff(
        input wire clk, D, n_clr, n_reset, en,
        output reg Q, Q_bar
        
    );
    
    reg R_current, R_next;
    
    // D FF
    always @ (posedge clk or negedge n_reset) begin
        if(~n_reset)
            R_current <= 1'b0;
        else 
            R_current <= R_next;
     end

     // next state logic (muxs)
     always @ * begin
        if(~n_clr)
            R_next = 1'b0;
        else if(en)
            R_next = D;
        else
            R_next = R_current;
     end
    
    // output logic
     always @ * begin
        Q <= R_current;
        Q_bar <= ~Q;
     end

    endmodule
