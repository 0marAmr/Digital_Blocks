`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Amr
// 
// Create Date:    16:38:30 02/01/2023 
// Design Name: 	 Binary Half Adder		
// Module Name:    half_adder 
// Project Name: 	 Adders-Subtractors
// Target Devices: 
// Tool versions: 
// Description: A binary half adder that takes two binary inputs A,B, and outputs sum (S) and carry (C)
//
// Dependencies: None
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module half_adder(
		input X,Y,
		output S,C
    );

xor G1(S,X,Y);
and G2(C,X,Y);
endmodule
