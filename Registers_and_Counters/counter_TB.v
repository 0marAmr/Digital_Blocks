`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:21:53 02/04/2023
// Design Name:   cntr
// Module Name:   /home/ise/Registers_and_Counters/counter_TB.v
// Project Name:  Registers_and_Counters
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cntr
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counter_TB;
	
	parameter N = 4;
	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [N-1:0] cntr_out;

	// Instantiate the Unit Under Test (UUT)
	sat_cntr uut (
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
		#50		// a positive edge must capture the reset signal, so we need a sufficient time (greater thatn 30ns)
		reset = 0;
	end
endmodule

