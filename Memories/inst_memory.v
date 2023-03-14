`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 11:31:17 PM
// Design Name: 
// Module Name: inst_memory
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


module inst_memory
    #(parameter ADDRESS_WIDTH = 32, 
            DATA_WIDTH = 32,
            DEPTH = 64
    )(
        input wire clk, PC_n_reset, // reset signal for program counter
        output wire [DATA_WIDTH-1: 0] RD
    );

    wire [ADDRESS_WIDTH-1: 0 ] PC_out ;
    cntr #(.N(32)) PC(
        .clk(clk),
        .n_reset(PC_n_reset),
        .Q(PC_out)
    );

    single_port_ROM ROM (
        .addr(PC_out),
        .data_out(RD)
    );

endmodule
