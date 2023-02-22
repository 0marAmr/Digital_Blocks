`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Amr
// 
// Create Date: 02/19/2023 03:22:00 PM
// Design Name: 
// Module Name: univ_cntr
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
/*
An N bit Universal binary counter that can count up or down, pause, be loaded with a specific value, or be asynchronously or synchronously cleared.
*/
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module univ_cntr
#(parameter N = 4 )
    (
        input wire clk, n_reset,
        input wire syn_n_clr, en, up, load,
        input wire [N-1: 0] D,
        output wire max_tick, min_tick,
        output wire [N-1: 0] Q
    );

    localparam MAX_COUNT = 2**N -1;
    localparam MIN_COUNT = 0;

    reg [N-1: 0] R_current, R_next;

    // register
    always @(posedge clk or negedge n_reset) begin
        if(~n_reset)
            R_current <= 0;
        else
        R_current <= R_next;
    end

    // NS logic
    always @(*) begin
        if(~syn_n_clr)
            R_next = 0;
        else if(load)
            R_next = D;
        else if(~en)  
            R_next = R_current;
        else if(up) 
            R_next = R_current + 1;
        else
            R_next = R_current - 1;
    end

    // OP logic
    assign Q = R_current;
    assign max_tick = (R_current == MAX_COUNT)? 1'b1 : 1'b0;
    assign min_tick = (R_current == MIN_COUNT)? 1'b1 : 1'b0;

endmodule
