`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2023 11:57:39 AM
// Design Name: 
// Module Name: n_bit_adder
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


module n_bit_adder
#(  parameter N = 4
)(
    input [N-1:0] X, Y,
    output [N-1:0] Z,
    output C_out
    );
    
    wire [N:0] C; // output carry of each stage
    assign C[0] = 1'b0;
    assign C_out = C[N] ;
    
    generate
       genvar i; // an integer that does not take negative values
       
       for(i = 0; i < N; i = i + 1)
       begin: stage //name for each iteration
           full_adder FA (
                .A(X[i]),
                .B(Y[i]),
                .C_in(C[i]),
                .S(Z[i]),
                .C_out(C[i+1])
            );
       end
       
    endgenerate
    
endmodule
