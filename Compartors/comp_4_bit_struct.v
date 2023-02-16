`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Amr
// 
// Create Date:    15:00:55 02/01/2023 
// Design Name:    4-bit compartor
// Module Name:    comp_4_bit_struct 
// Project Name: 	 Compartor
// Target Devices: 
// Tool versions: 
// Description: Design of 4-bit compartor using instances of 1-bit compartor (structural modeling)
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module comp_4_bit //structural 
			(		//IO ports
				input wire [3:0] a, b,
				output wire a_eq_b
				);

	//internal signals
	wire eq0, eq1, eq2, eq3;

	//body
	//1-bit compartor instances
	comp_1_bit bit_0_compartor(.i0(a[0]), .i1(b[0]), .op(eq0));
	comp_1_bit bit_1_compartor(.i0(a[1]), .i1(b[1]), .op(eq1));
	// omitting the portnames of lower level module, keeping order in mind
	comp_1_bit_behav bit_2_compartor(a[2], b[2], eq2);
	comp_1_bit_behav bit_3_compartor(a[3], b[3], eq3);

	assign a_eq_b = eq0 & eq1 & eq2 & eq3;

endmodule

module comp_4_bit_behav(
		input wire [3:0] a, b,
		output reg a_eq_b
		);

	
	always @ * begin
		a_eq_b = (a == b); //as negan once said: easy peasy leamon squeezy
	end
endmodule