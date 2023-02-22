`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Amr
// 
// Create Date:    22:24:31 02/04/2023 
// Design Name: 	 saturating_counter
// Module Name:    sat_cntr
// Project Name:   Registers and Counters
// Target Devices: 
// Tool versions: 
// Description: 	 n-bit counter that saturates when reaching a specified value
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module sat_cntr(clk, n_reset, Q);
	parameter N = 4; // counter size in bits
	parameter max_count = 2**N - 1;
	
	input wire clk, n_reset;
	output reg [N-1:0] Q;
	
	wire indicator;
	assign indicator = (Q == max_count); // continious assign statement is executed when the LHS is changed
	
	always @ (posedge clk or negedge n_reset) begin
		if(n_reset == 0) begin
			Q <= 0; // reset the counter
		end 
		else if(indicator) 
			Q <= Q; // the counter saturates
		else 
			Q <= Q + 1;
	end
		
	
	
endmodule
