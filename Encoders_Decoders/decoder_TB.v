`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:44:59 02/05/2023
// Design Name:   dec_2_to_4
// Module Name:   /home/ise/Encoders_an_Decoders/decoder_TB.v
// Project Name:  Encoders_an_Decoders
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dec_2_to_4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module decoder_TB;

	// Inputs
	reg [1:0] A;
	reg en;

	// Outputs
	wire [3:0] D;

	// Instantiate the Unit Under Test (UUT)
	dec_2_to_4 uut (
		.A(A), 
		.en(en), 
		.D(D)
	);

	initial begin
		en = 0;
		A = 2'b00;
		#50;
		
		en = 1;
		A = 2'b00;
		#50;

		A = 2'b01;
		#50;

		A = 2'b10;
		#50;

		A = 2'b11;
		#50;
		
		$stop;
	end
      
endmodule

