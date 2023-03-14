`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 08:46:56 PM
// Design Name: 
// Module Name: single_port_BRAM_TB
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

module tb_single_port_BRAM;

// single_port_BRAM Parameters
parameter PERIOD  = 10;

parameter DATA_WIDTH = 32;
parameter ADDRESS_WIDTH = 6;

// single_port_BRAM Inputs
reg   clk                                  = 0 ;
reg   read_en                              = 0 ;
reg   write_en                             = 0 ;
reg   n_clr                                = 0 ;
reg   [DATA_WIDTH-1: 0]  data_in           = 0 ;
reg   [ADDRESS_WIDTH-1: 0]  addr           = 0 ;

// single_port_BRAM Outputs
wire  [DATA_WIDTH-1: 0]  data_out          ;


initial
begin
    clk = 0;
    forever #(PERIOD/2)  clk=~clk;
end


single_port_BRAM  u_single_port_BRAM (
    .clk                     ( clk                            ),
    .read_en                 ( read_en                        ),
    .write_en                ( write_en                       ),
    .n_clr                   ( n_clr                          ),
    .data_in                 ( data_in   [DATA_WIDTH-1: 0]    ),
    .addr                    ( addr      [ADDRESS_WIDTH-1: 0] ),

    .data_out                ( data_out  [DATA_WIDTH-1: 0]    )
);

initial
begin
    read_en =0;
    write_en =0;
    n_clr = 0;
    data_in = 0;
    addr = 0;
    @(negedge clk);
    n_clr = 1;
    write_en = 0;
    data_in = 32;
    addr = 10;
    @(negedge clk);
    write_en =1;
    @(negedge clk);
    data_in = 0;
    write_en = 0;
    read_en = 1;
    addr = 10;
    @(negedge clk);
    $finish;
end

endmodule
