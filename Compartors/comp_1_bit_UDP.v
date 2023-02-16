`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Amr
// 
// Create Date:    15:16:57 02/01/2023 
// Design Name: 
// Module Name:    comp_1_bit_UDP 
// Project Name:   Compartors
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


//defining the user defined primitive
primitive comp_udp(op, x, y);
	output op;
	input x,y;
	
	table
	//	x	y	:	op
		0	0	:	1;
		0	1	:	0;
		1	0	:	0;
		1	1	:	1;
	endtable
	
endprimitive

module comp_1_bit_UDP(
		input i0,i1,
		output eq
    );
	 
	comp_udp compartor(.op(eq), .x(i0), .y(i1));
endmodule
