`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Amr
// 
// Create Date:    19:16:42 02/01/2023 
// Design Name:    4-bit multiplier circuit
// Module Name:    mul_4_bit mul_4_bit_op
// Project Name:   Multipliers
// Target Devices: 
// Tool versions: 
// Description:    multiplier circuit modeled via two approaches: structral modeling. data flow modeling
//
// Dependencies: None
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

/******** multiplier module structral design **********/
module mul_4_bit(
		input wire [3:0] X, Y,
		output wire [7:0] Z
    );
	 
	wire [15:0] W;


	assign W[3:0] = {4{Y[0]}} & X[3:0];
	assign W[7:4] = {4{Y[1]}} & X[3:0];
	assign W[11:8] = {4{Y[2]}} & X[3:0];
	assign W[15:12] = {4{Y[3]}} & X[3:0];

	assign Z[0] = W[0]; //LSB is X[0] & Y[0] 

	//output wires for the 1st two adders
	wire [3:0] S1,S2;
	wire C1, C2;

	//3 instances of 4-bit ripple adder
	ripple_addr_4_bit ADR1(.X({0,   W[3:1]}), .Y(W[7:4]),   .Z(S1), 	 	.C_out(C1),   .C_in(0));
	ripple_addr_4_bit ADR2(.X({C1, S1[3:1]}), .Y(W[11:8]),  .Z(S2), 		.C_out(C2),   .C_in(0));
	ripple_addr_4_bit ADR3(.X({C2, S2[3:1]}), .Y(W[15:12]), .Z(Z[6:3]),  .C_out(Z[7]), .C_in(0));

	assign Z[1] = S1[0];
	assign Z[2] = S2[0];

endmodule

/******** multiplier module via shifing (optimized) **********/
module mul_4_bit_op(
		input wire [3:0] X, Y,
		output wire [7:0] Z
    );
	
	/* W1, W2 and W3 can be 4, 5 and 6 bits, respectively.
		W5 and W6 are used as an optimization for propagation delay
	*/
	wire [6:0] W1, W2, W3, W4, W5, W6;
	
	assign W1 = (Y[0] == 1)? X : 0;
	assign W2 = (Y[1] == 1)? {X,1'b0} : 0;
	assign W5 = W1 + W2;
	
	assign W3 = (Y[2] == 1)? {X, 2'b00} : 0;
	assign W4 = (Y[3] == 1)? X << 3 : 0;
	assign W6 = W3 + W4;
	
	assign Z = W5 + W6;
	
endmodule
