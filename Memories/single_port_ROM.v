`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 09:36:32 PM
// Design Name: 
// Module Name: single_port_ROM
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


module single_port_ROM
#(parameter ADDRESS_WIDTH = 32, 
            DATA_WIDTH = 32,
            DEPTH = 64
    )(
        input wire [ADDRESS_WIDTH-1: 0] addr,
        output wire [DATA_WIDTH-1: 0] data_out
    );

    // memory
    reg [DATA_WIDTH-1: 0] reg_array [DEPTH-1: 0] ;
    reg [DATA_WIDTH-1: 0] data ;

    integer i;

    always @ * begin
    case (addr)
        32'h0000_0000 : reg_array[addr] = 32'h0000_0001;
        32'h0000_0001 : reg_array[addr] = 32'h0000_0011;
        32'h0000_0010 : reg_array[addr] = 32'h0000_0011;
        32'h0000_0011 : reg_array[addr] = 32'h0000_000f;
        32'h0000_0100 : reg_array[addr] = 32'h0000_000c;
        32'h0000_0101 : reg_array[addr] = 32'h0000_d001;
        default:        reg_array[addr] = 32'h0000_0000;
    endcase
    end

    always @ * begin
        data = reg_array[addr];
    end
    
    assign data_out = data;
endmodule
