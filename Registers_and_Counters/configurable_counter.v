`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Omar Amr
// 
// Create Date:    22:55:02 02/05/2023 
// Design Name: 	 configurable counter
// Module Name:    cntr_config 
// Project Name: 	 Registers_and_Counters
// Target Devices: 
// Tool versions: 
// Description: 	a configurable counter in which: increment can be configured, Reset value can be configured.
//						A signal that indicates whether the counter reaches the configured value
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module cntr_config(
	input wire reset,
	input wire clk,
	input wire [3:0] cntr_start,
	input wire [3:0] ind_val,
	input wire [3:0] incr,
	output wire ind,
	output reg [3:0] cntr_out
    );
	
	assign ind = (ind_val == cntr_out); // indicator signal that the counter reached it's end value
	
	always @ (posedge clk or posedge reset) begin 		// async active high reset
			if(reset) begin
				cntr_out = cntr_start;
			end
			else begin
				if(ind || (cntr_out > ind_val)) //  to prevent reseting the counter if overflow occours
					cntr_out = cntr_out;
				else
					cntr_out = cntr_out + incr;
			end
	end
	
endmodule
