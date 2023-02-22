`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:53:41 02/05/2023 
// Design Name: 
// Module Name:    t_flip_flop 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: t-flip flop with active low async. reset
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module t_ff
	(
		input wire clk, rstn, T,
		output reg Q 
    );
	 
	always @ (posedge clk or negedge rstn) begin //notice that the reset signal must be included in the sensitivity list, so that reset becomes asynchronous
		if(!rstn) begin
			Q = 1'b0;
		end 
		else begin
			if(T) begin
				Q <= ~Q;
			end 
			else begin
				Q <= Q;
			end
		end
	end


endmodule
