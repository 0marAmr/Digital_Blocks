`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Omar Amr
// 
// Create Date:    19:22:02 02/01/2023 
// Design Name:    4-bit Ripple Carry Adder
// Module Name:    ripple_addr_4_bit 
// Project Name:   Adders-Subtractors
// Target Devices: 
// Tool versions: 
// Description: a 4-bit binary ripple adder that takes two 4-bit vectors (X,Y), and outputs their sum (Z), and 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ripple_addr_4_bit(
		input wire [3:0] X, Y,		// input vectors
		input C_in, 					// input carry (from prev. stage)
		output wire [3:0] Z,			// output vector
		output C_out					// output carry
    );

wire [3:1] C; // interconnections between the op & ip carry ports of the full adders

// module body
// 4 Full Adders instances 

full_adder FA1(.A(X[0]), .B(Y[0]), .C_in(C_in), .S(Z[0]), .C_out(C[1]));
full_adder FA2(.A(X[1]), .B(Y[1]), .C_in(C[1]), .S(Z[1]), .C_out(C[2]));
full_adder FA3(.A(X[2]), .B(Y[2]), .C_in(C[2]), .S(Z[2]), .C_out(C[3]));
full_adder FA4(.A(X[3]), .B(Y[3]), .C_in(C[3]), .S(Z[3]), .C_out(C_out));

endmodule
