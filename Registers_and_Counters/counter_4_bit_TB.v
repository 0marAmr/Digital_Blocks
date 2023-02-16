`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:16:55 02/04/2023
// Design Name:   cntr_4_bit
// Module Name:   /home/ise/Registers_and_Counters/counter_4_bit_TB.v
// Project Name:  Registers_and_Counters
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cntr_4_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counter_4_bit_TB;
	
	parameter N = 8;
	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [N-1:0] cntr_out;

	// Instantiate the Unit Under Test (UUT)
	cntr uut (
		.clk(clk), 
		.reset(reset), 
		.cntr_out(cntr_out)
	);

	initial begin
		clk = 0;
		forever #30 clk = ~clk;
	end
   
	initial begin
		reset = 1;
		#50
		reset = 0;
	end
endmodule

