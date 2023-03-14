`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2023 02:26:59 PM
// Design Name: 
// Module Name: addr_4_bit
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


//https://hdlbits.01xz.net/wiki/Exams/m2014_q4j

module addr_4_bit (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire [4:0] C;
    assign C[0] = 1'b0;
    assign sum[4] = C[0]; // final output carry

    generate
        genvar i;
        for(i = 0; i < 4; i = i + 1) 
        begin: stage
            full_adder FA(
                .A(x),
                .B(y),
                .C_in(C[i]),
                .S(sum[i]),
                .C_out(C[i+1])
            );
        end

    endgenerate

endmodule

