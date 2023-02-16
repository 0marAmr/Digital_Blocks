`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:45:22 02/04/2023
// Design Name:   ripple_addr_4_bit
// Module Name:   /home/ise/Adders/ripple_adder_4_bit__TB.v
// Project Name:  Adders
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ripple_addr_4_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ripple_adder_4_bit__TB;

	// Inputs
	reg [3:0] X;
	reg [3:0] Y;
	reg C_in;

	// Outputs
	wire [3:0] Z;
	wire C_out;

	// Instantiate the Unit Under Test (UUT)
	ripple_addr_4_bit uut (
		.X(X), 
		.Y(Y), 
		.C_in(C_in), 
		.Z(Z), 
		.C_out(C_out)
	);

	initial begin
		// Initialize Inputs
		
		// 1+2+1 = 4 = b0100
		X = 4'b0001;
		Y = 4'b0010;
		C_in = 1;
		#100;
		
		// 7 + 7 + 1 = 15 = b1111
		X = 4'b0111;
		Y = 4'b0111;
		C_in = 1;
		#100;
		
		X = 4'd6;
		Y = 4'd7;
		C_in = 1;
		#100;
		
		// 15 + 15 + 1 = 31 = b1 1111 
		X = 4'd15;
		Y = 4'd15;
		C_in = 1;
		#100;
        
		// Add stimulus here

	end
      
endmodule

