`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:20:18 02/04/2023
// Design Name:   full_adder
// Module Name:   /home/ise/Adders/full_adder_TB.v
// Project Name:  Adders
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: full_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module full_adder_TB;

	// Inputs
	reg A;
	reg B;
	reg C_in;

	// Outputs
	wire S;
	wire C_out;

	// Instantiate the Unit Under Test (UUT)
	full_adder uut (
		.A(A), 
		.B(B), 
		.C_in(C_in), 
		.S(S), 
		.C_out(C_out)
	);

	initial begin
		// Initialize Inputs
		{A, B, C_in} = 3'b000;
		#100;
      {A, B, C_in} = 3'b001;
		#100;
		{A, B, C_in} = 3'b010;
		#100;
		{A, B, C_in} = 3'b011;
		#100;
		{A, B, C_in} = 3'b100;
		#100;
		{A, B, C_in} = 3'b101;
		#100;
		{A, B, C_in} = 3'b110;
		#100;
		{A, B, C_in} = 3'b111;
		#100;
		{A, B, C_in} = 3'b000;
		#100;
		// Add stimulus here

	end
      
endmodule

