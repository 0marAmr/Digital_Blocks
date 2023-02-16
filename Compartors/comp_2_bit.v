`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Amr
// 
// Create Date:    11:29:17 02/01/2023 
// Design Name: 	 2-bit compartor
// Module Name:    comp_2_bit
// Project Name: 	 Compartor
// Target Devices: 
// Tool versions: 
// Description: 	2-bit compartor dataflow modeling
//
// Dependencies: NULL
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module comp_2_bit //data flow
//IO prots
(
input wire [1:0] a,b,
output wire a_eq_b
);

// no internal signal declration, we'll use implicit net (which is wire !)

// product terms
assign p0 = (~a[0] & ~b[0]) & (~a[1] & ~b[1]);
assign p1 = (a[0] & b[0]) & (~a[1] & ~b[1]);
assign p2 = (~a[0] & ~b[0]) & (a[1] & b[1]);
assign p3 = (a[0] & b[0]) & (a[1] & b[1]);

assign a_eq_b = p0 | p1 | p2 | p3; // SOPs 

endmodule