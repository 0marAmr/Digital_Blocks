`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:06:11 02/04/2023
// Design Name:   mul_4_bit
// Module Name:   /home/ise/Multipliers/mul_4_bit_TB.v
// Project Name:  Multipliers
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mul_4_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mul_4_bit_TB;

	// Inputs
	reg [3:0] X;
	reg [3:0] Y;

	// Outputs
	wire [7:0] Z;

	// Instantiate the Unit Under Test (UUT)
	multiplier_4_bit uut (
		.X(X), 
		.Y(Y), 
		.Z(Z)
	);

	initial begin
		// Initialize Inputs
		// 2 * 4 = b1000
		X = 4'b0010;
		Y = 4'b0100;
		#100;
		
		// b0110
		X = 4'b0110;
		Y = 4'b0001;
		#100;
		
		// b0000
		X = 4'b0110;
		Y = 4'b0000;
		#100;
		
		// 5 * 4 = 20 = b1_0100
		X = 4'b0101;
		Y = 4'b0100;
		#100;
		
		// 15*15 = b11100001
		X = 4'd15;
		Y = 4'd15;
		#100;
        
		$stop;
		
	end
      
endmodule

