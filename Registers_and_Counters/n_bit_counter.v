`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:09:06 02/04/2023 
// Design Name: 	 N bit counter
// Module Name:    cntr 
// Project Name: 	 Registers and Counters
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module cntr
#(parameter N = 4)(
	input clk, n_reset,
	output wire [N-1: 0] Q
);
		
	reg [N-1: 0] R_current, R_next;

	// register
	always @(posedge clk or negedge n_reset) begin
		if(~n_reset) begin
			R_current <= 0;
		end
		else begin
			R_current <= R_next;
		end
	end

	// NS logic
	always @(*) begin
		R_next = R_current + 1;
	end

	// OP logic
	assign Q = R_current;
	
endmodule
