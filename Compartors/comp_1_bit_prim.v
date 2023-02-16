`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Amr
// 
// Create Date:    21:31:27 01/31/2023 
// Design Name:    1-bit compartor
// Module Name:    comp_1_bit
// Project Name:   Compartors
// Target Devices: 
// Tool versions: 
// Description: 	1-bit compartor using gate-level modeling (primitive blocks)
//
// Dependencies: NULL
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module comp_1_bit(
	input wire i0, i1,
	output wire op 
    );
	 
//internal signals declration
wire p0, p1;

//body
and G1(p0,~i0,~i1);
and G2 (p1,i0,i1);
or  G3 (op,p0,p1);

endmodule
