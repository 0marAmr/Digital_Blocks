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
module sat_cntr(clk, reset,cntr_out);
	parameter N = 4; // counter size in bits
	parameter max_count = 2**N - 1;
	
	input wire clk, reset;
	output reg [N-1:0] cntr_out;
	
	wire indicator;
	assign indicator = (cntr_out == max_count); // continious assign statement is executed when the LHS is changed
	
	always @ (posedge clk) begin
		if(reset == 1) begin
			cntr_out <= 0; //reset the counter
		end 
		else begin
			if(indicator) begin
				cntr_out <= cntr_out; // the counter saturates
			end else begin
				cntr_out <= cntr_out + 1;
			end
		end
	end
	
endmodule
