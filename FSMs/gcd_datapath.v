`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2023 04:31:36 AM
// Design Name: 
// Module Name: gcd_datapath
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


module gcd_datapath#(  parameter N = 32
)(  input clk, n_rst,
    input wire [N-1: 0] A_in, B_in,
    input sel_A, sel_B, 
    input wr_A, wr_B, wr_res,
    output wire a_eq_b, a_gt_b,
    output wire [N-1: 0] res
    );

    reg [N-1: 0] A, B, result;
        // reg [N-1: 0] A_current, B_current, result_current;
    // reg [N-1: 0] A_next, B_next, result_next;

    always @(posedge clk or negedge n_rst) begin
        if (!n_rst)
            A <= 0;
        else if(wr_A) begin
            if (sel_A) A <= A - B;
            else    A <= A_in;
        end
    end         
    
    always @(posedge clk or negedge n_rst) begin
        if (!n_rst)
            B <= 0;
        else if(wr_B) begin
            if (sel_B) B <= B - A;
            else    B <= B_in;
        end
    end         
    
    always @(posedge clk or negedge n_rst) begin
        if (!n_rst)
            result <= 0;
        else if(wr_res) begin
            result <= A;
        end
    end         
    
    assign a_eq_b = (A == B)? 1 : 0;
    assign a_gt_b = (A > B)? 1 : 0;
    assign res = result;

endmodule
