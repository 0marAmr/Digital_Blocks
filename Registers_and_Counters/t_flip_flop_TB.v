`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:59:41 02/05/2023
// Design Name:   tff
// Module Name:   /home/ise/Registers_and_Counters/t_flip_flop_TB.v
// Project Name:  Registers_and_Counters
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: tff
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module t_flip_flop_TB;

	// Inputs
	reg clk;
	reg rstn;
	reg T;

	// Outputs
	wire Q;

	// Instantiate the Unit Under Test (UUT)
	tff uut (
		.clk(clk), 
		.rstn(rstn), 
		.T(T), 
		.Q(Q)
	);

	always #30 clk = ~clk;//clock signal simulation
	
	initial begin
		// Initialize Inputs
		clk = 0;
		
		//asynchronous reset
		rstn = 0; 
		#5		//notice that no clock edge is needed to reset
		rstn = 1;
		
		T = 0;
		#100;
		
		T = 1;
		#100;
        
		// Add stimulus here

	end
      
endmodule

