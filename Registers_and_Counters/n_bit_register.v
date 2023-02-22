`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2023 09:01:55 PM
// Design Name: 
// Module Name: reg_n_bit
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


module reg_n_bit
#(parameter N = 8)(
        input wire clk, n_clr, n_reset, en,
        input wire [N-1 : 0] D,
        output reg [N-1 : 0] Q, Q_bar
    );
    
    reg [N-1 : 0] R_current, R_next;
    
    // D FF
    always @ (posedge clk or negedge n_reset) begin
        if(~n_reset)
            R_current <= 0;
        else 
            R_current <= R_next;
     end

     // next state logic (muxs)
     always @ * begin
        if(~n_clr)
            R_next = 0;
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

