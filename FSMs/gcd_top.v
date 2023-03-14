`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2023 04:31:36 AM
// Design Name: 
// Module Name: gcd_top
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


module gcd_top
#(parameter N =32)(
    input clk, n_rst,
    input start,
    input wire [N-1: 0] A, B,
    output wire [N-1: 0] res
    );

    // input clk, n_rst,
    // input start,
    // input a_eq_b, a_gt_b,
    // output reg sel_A, sel_B, 
    // output reg wr_A, wr_B, 
    // output reg wr_res
    wire a_eq_b, a_gt_b, sel_A, sel_B, wr_A, wr_B,wr_res;
    
    gcd_controller controller(
        .clk(clk),
        .n_rst(n_rst),
        .start(start),
        .a_eq_b(a_eq_b),
        .a_gt_b(a_gt_b),
        .sel_A(sel_A),
        .sel_B(sel_B),
        .wr_A(wr_A),
        .wr_B(wr_B),
        .wr_res(wr_res)
    );

//  input clk, n_rst,
//     input wire [N-1: 0] A_in, B_in,
//     input sel_A, sel_B, 
//     input wr_A, wr_B, wr_res,
//     output wire a_eq_b, a_gt_b,
//     output wire [N-1: 0] res

    gcd_datapath datapath(
        .clk(clk),
        .n_rst(n_rst),
        .A_in(A), 
        .B_in(B),
        .sel_A(sel_A),
        .sel_B(sel_B),
        .wr_A(wr_A),
        .wr_B(wr_B),
        .wr_res(wr_res),
        .a_eq_b(a_eq_b),
        .a_gt_b(a_gt_b),
        .res(res)
    );
    
endmodule
