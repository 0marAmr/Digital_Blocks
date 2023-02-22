`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:    Omar Amr 
// 
// Create Date: 02/08/2023 08:39:39 AM
// Design Name: 2_to-1 multiplexer
// Module Name: mux_2_to_1
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


module mux_2_to_1(
        input I0, I1, S,
        output F
    );
    
    assign F = (I0 & ~S) | (I1 & S);
endmodule
