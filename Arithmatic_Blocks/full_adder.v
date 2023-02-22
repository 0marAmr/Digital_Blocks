`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Amr
// 
// Create Date:    16:57:57 02/01/2023 
// Design Name:    Binary Full Adder
// Module Name:    full_adder 
// Project Name:   Adders-Subtractors
// Target Devices: 
// Tool versions: 
// Description: 	 A binary full adder that takes three inputs (A, B, C_in) and outputs the sum and carry (S,C_out)
//
// Dependencies: No dependencies whatsoever
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: data folw modeling for full adder. structural modeling via two half instances is also included.
//
//////////////////////////////////////////////////////////////////////////////////
module full_adder(
//IO ports
    input A,
    input B,
    input C_in,
    output S,
    output C_out
    );

//used wires are implicitly declared

//moudle body 
assign S = w1 ^ C_in;
assign C_out = w2 | w3;
assign w1 = A ^ B;
assign w2 = w1 & C_in;
assign w3 = A & B;

endmodule

module FA(
		input A, B, C_in,
		output S, C_out
	);

assign {C_out, S} = A + B + C_in;
endmodule

//Implementation via two half adder instances
module full_adder_struct(
		input A, B, C_in,
		output S, C_out
	);

wire s1,c1,c2;

half_adder HA1(.X(A), .Y(B), .S(s1), .C(c1));
half_adder HA2(.X(s1), .Y(C_in), .S(S), .C(c2));
or G1(C_out, c1,c2);

endmodule