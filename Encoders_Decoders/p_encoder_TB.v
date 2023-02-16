`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:	  Omar Amr 
//
// Create Date:   21:32:52 02/05/2023
// Design Name:   pri_enc_8_to_3
// Module Name:   /home/ise/Encoders_an_Decoders/p_encoder_TB.v
// Project Name:  Encoders_an_Decoders
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pri_enc_8_to_3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module p_encoder_TB;

	// Inputs
	reg [7:0] D;

	// Outputs
	wire [2:0] A;
	wire V;

	// Instantiate the Unit Under Test (UUT)
	pri_enc_8_to_3 uut (
		.D(D), 
		.A(A), 
		.V(V)
	);

	initial begin
		// Initialize Inputs
		D = 8'b0;
		#50;
		
		D = 8'b1000_0000;
		#50;
		
		D = 8'b0100_0000;
		#50;
		
		D = 8'b0010_0000;
		#50;
		
		D = 8'b0001_0000;
		#50;
		
		D = 8'b0000_1000;
		#50;
		
		D = 8'b0000_0000;
		#50;
		
		D = 8'b0000_0100;
		#50;
		
		D = 8'b0000_0010;
		#50;
		
		D = 8'b0000_0001;
		#50;
		
		$stop;
	end
      
endmodule

