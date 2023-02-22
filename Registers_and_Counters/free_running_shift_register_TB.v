`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2023 09:04:21 AM
// Design Name: 
// Module Name: free_running_shift_register_TB
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


module free_running_shift_register_TB;

// shift_reg Parameters
parameter PERIOD  = 20;


// shift_reg Inputs
reg   serial_in                            = 0 ;
reg   clk                                  = 0 ;
reg   n_reset                              = 0 ;

// shift_reg Outputs
wire  serial_out                           ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end



shift_reg  u_shift_reg (
    .serial_in               ( serial_in    ),
    .clk                     ( clk          ),
    .n_reset                 ( n_reset      ),
    .serial_out              ( serial_out   )
);

// parrern from left to right in waveform: 1111001
initial
begin
    clk = 0;
    serial_in = 0;
    n_reset = 0;
    #5;
    n_reset = 1;
    serial_in = 1;
    #55;
    serial_in = 0;
    #40;
    serial_in = 1;
    #20;
    serial_in = 0;
    #300;
    $stop;
end
endmodule
