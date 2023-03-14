`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 07:58:00 PM
// Design Name: 
// Module Name: single_port_BRAM
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


module single_port_BRAM
#(parameter ADDRESS_WIDTH = 32, 
            DATA_WIDTH = 32
    )(
        input wire clk, n_clr,
        input wire  read_en, write_en,
        input wire [DATA_WIDTH-1: 0] data_in,
        input wire [ADDRESS_WIDTH-1: 0] addr,
        output wire [DATA_WIDTH-1: 0] data_out
    );

    localparam DEPTH = 2**ADDRESS_WIDTH;

    // memory
    reg [DATA_WIDTH-1: 0] reg_array [DEPTH-1: 0] ;
    reg [DATA_WIDTH-1: 0] data ;

    integer i;

    always @(posedge clk) begin
        if(~n_clr) 
            for (i= 0 ; i < DEPTH ; i = i + 1 ) begin
                reg_array [i] <= 0;
            end
        else if(write_en)
            reg_array [addr] <= data_in;
    end

    always @ * begin
        if (read_en)
            data = reg_array[addr];
        else
            data = 32'bx;
    end
    
    assign data_out = data;
endmodule
