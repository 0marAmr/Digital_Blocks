`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:    Omar Amr 
// 
// Create Date:  02/10/2023 12:19:51 PM
// Design Name:  n-bit adder subtractor circuit
// Module Name:  n_bit_addr_sub
// Project Name: Adders_Subtractors
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


module n_bit_addr_sub
#(parameter N = 4 )(
        input [N-1:0] X, Y,
        input add_n,
        output [N-1:0] Z,
        output C_out, V
    );
    
    wire [N-1:0] Y_comp; // output of selective complement circuit
    wire [N:0] C; // output carry of each stage
    assign C[0] = add_n;
    assign C[N] = C_out;
    
    generate
       genvar i; // an integer that does not take negative values
       
       for(i = 0; i < N; i = i + 1)
       begin: stage //name for each iteration
           assign Y_comp[i] = add_n ^ Y[i]; //selective complement circuit
           full_adder FA (
                .A(X[i]),
                .B(Y_comp[i]),
                .C_in(C[i]),
                .S(Z[i]),
                .C_out(C[i+1])
            );
       end
       
    endgenerate
    
endmodule
