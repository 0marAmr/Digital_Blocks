`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:    Omar Amr
// 
// Create Date: 02/14/2023 09:42:50 PM
// Design Name: 
// Module Name: p_encoder_4_to_2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module p_encoder_4_to_2_casex(
        input wire [3:0] D,
        output reg V,
        output reg [1:0] A
    );
    
    always @ * begin
        V = 1'b0; 
        casex(D)
            4'b1???: A = 2'b11;
            4'b01??: A = 2'b10;
            4'b001?: A = 2'b01;
            4'b0001: A = 2'b00;
            default: begin
                V = 1'b1;
                A = 2'bxx;
            end
        endcase
    end
endmodule
