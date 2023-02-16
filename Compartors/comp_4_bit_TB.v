`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:10:06 02/04/2023
// Design Name:   comp_4_bit
// Module Name:   /home/ise/Compartor/comp_4_bit_TB.v
// Project Name:  Compartor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: comp_4_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module comp_4_bit_TB;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire a_eq_b;

	// Instantiate the Unit Under Test (UUT)
	comp_4_bit_behav uut (
		.a(a), 
		.b(b), 
		.a_eq_b(a_eq_b)
	);

	initial begin
		// Initialize Inputs
		a = 4'b0000;
		b = 4'b0000;
		#50; 		

      a = 4'b0001;
		b = 4'b0000;
		#50; 		
		
		a = 4'b0001;
		b = 4'b0001;
		#50; 	
		
		a = 4'b1111;
		b = 4'b1111;
		#50; 	
		
		a = 4'b1101;
		b = 4'b1111;
		#50; 
		
		a = 4'b1101;
		b = 4'b1101;
		#50; 
		// Add stimulus here

	end
      
endmodule

