`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 	   Omar Amr
// 
// Create Date:    22:13:08 02/05/2023 
// Design Name:    2 to 4 binary decoder
// Module Name:    dec_2_to_4 
// Project Name:   Encoders_Decoders
// Target Devices: 
// Tool versions: 
// Description:    behavioural modeling for 2 to 4 binary decoder
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module dec_2_to_4(
		input wire [1:0] A,
		input en,
		output reg [3:0] D
    );

	always @ * begin
		if(~en)
			D = 4'b0000;
		else if(A == 2'b00)
			D = 4'b0001;
		else if(A == 2'b01)
			D = 4'b0010;
		else if(A == 2'b10)
			D = 4'b0100;
		else
			D = 4'b1000;
	end

endmodule
