`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Omar Amr 
// 
// Create Date:    21:19:48 02/05/2023 
// Design Name:    8 to 3 priority encoder
// Module Name:    pri_enc_8_to_3 
// Project Name:   Encoders_Decoders
// Target Devices: 
// Tool versions: 
// Description:    modeling a priority encoder via behavioural approach
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module pri_enc_8_to_3(
		input wire [7:0] D,
		output reg [2:0] A,
		output reg V //valid output is high if at least one ip is high
    );

	always @ * begin 
		if(~(|D)) begin
			V = 1'b0;
			A = 3'bxxx;
		end	
		else begin
			V = 1'b1;
			if(D[7]) 
				A = 3'b111;
			else if(D[6])					
				A = 3'b110;
			else if(D[5])					
				A = 3'b101;
			else if(D[4])					
				A = 3'b100;
			else if(D[3])					
				A = 3'b011;
			else if(D[2])					
				A = 3'b010;
			else if(D[1])					
				A = 3'b001;
			else if(D[0])					
				A = 3'b000;
		end
	end
endmodule
