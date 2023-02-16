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
#(parameter N = 8)(
	input clk, reset,
	output reg [N-1:0] cntr_out
);
		
	always @(posedge clk) begin
		if(reset == 1) begin
			cntr_out <= 0;
		end
		else begin
			cntr_out <= cntr_out + 1;
		end
	end

endmodule
