`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:40:52 02/05/2023 
// Design Name: 
// Module Name:    comp_1_bit_behav 
// Project Name: 
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
module comp_1_bit_behav(
		input wire i0, i1,
		output reg op //must be delcared as reg to be used in the procedural assignment
    );
	 
	 reg p1, p2;
	always @(i0, i1) begin
		//order is crutual here
		p1 = i0 & i1;
		p2 = ~i0 & ~i1;
		op = p1 & p2;
	end

endmodule
