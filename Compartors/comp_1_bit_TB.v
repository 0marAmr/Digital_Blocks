// Verilog test fixture created from schematic /home/ise/Compartor/compartor_1_bit_primitive.sch - Tue Jan 31 20:04:54 2023

`timescale 1ns / 1ps

module compartor_1_bit_primitive_compartor_1_bit_primitive_sch_tb();

// Inputs
   reg a;
   reg b;

// Output
   wire a_eb_b;

// Bidirs

// Instantiate the UUT
   compartor_1_bit_primitive UUT (
		.a(a), 
		.b(b), 
		.a_eb_b(a_eb_b)
   );
// Initialize Inputs
   
	initial begin
		{a,b} = 2'b00;		#100;
		{a,b} = 2'b01;		#100;
		{a,b} = 2'b10;		#100;
		{a,b} = 2'b11;		#100;
		{a,b} = 2'b00;		#100;
	end
endmodule
