`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:		Omar Amr
//
// Create Date:   23:41:00 02/05/2023
// Design Name:   cntr_config
// Module Name:   /home/ise/Registers_and_Counters/configurable_counter_TB.v
// Project Name:  Registers_and_Counters
// Target Device:  
// Tool versions:  
// Description: 	Testbench for configurable counter
//
// Verilog Test Fixture created by ISE for module: cntr_config
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module configurable_counter_TB;

	// Inputs
	reg reset;
	reg clk;
	reg [3:0] cntr_start;
	reg [3:0] ind_val;
	reg [3:0] incr;

	// Outputs
	wire ind;
	wire [3:0] cntr_out;

	// Instantiate the Unit Under Test (UUT)
	cntr_config uut (
		.reset(reset), 
		.clk(clk), 
		.cntr_start(cntr_start), 
		.ind_val(ind_val), 
		.incr(incr), 
		.ind(ind), 
		.cntr_out(cntr_out)
	);

	always #20 clk = ~clk; // clock simulation
	
	initial begin
	clk = 0;
	
	// reaching the ind value after 5 edges
	ind_val = 4'd10;
	incr = 4'd2;
	cntr_start = 4'd2;
	
	reset = 1'b1;
	#10;
	reset = 1'b0;
	
	#300;
	
	// this combination of values fail to reach the ind value.
	ind_val = 4'd12;
	incr = 4'd3;
	cntr_start = 4'd1;
	
	reset = 1'b1;
	#10;
	reset = 1'b0;
	#500
	
	ind_val = 4'd12;
	incr = 4'd2;
	cntr_start = 4'd2;
	
	reset = 1'b1;
	#10;
	reset = 1'b0;
	#500
	
	$stop;
	end
      
endmodule

