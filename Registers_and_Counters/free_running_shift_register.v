`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:    Omar Amr
// 
// Create Date: 02/17/2023 06:58:52 PM
// Design Name: 
// Module Name: shift_reg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: N bit shift register shifts its content to the 
//              right by one position in each clock cycle
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
/*
    though it's obvious, it's worth mentioning that declaring N regs R_current is to store the current state, which corresponds to synthesizing N flipflops
    R_next is the next state of the flipflops which corresponds to an input connected to D-port, hence it's declared as wire
*/
// 
//////////////////////////////////////////////////////////////////////////////////


module shift_reg
#(parameter N = 8)(
    input wire serial_in, clk, n_reset,
    output wire serial_out
    );
    
    reg [N-1: 0] R_current;
    wire [N-1: 0] R_next;

    always @(posedge clk or negedge n_reset ) begin
        if(~n_reset)
            R_current <= 0;
        else
            R_current <= R_next;
    end
    assign R_next = {serial_in, R_current[N-1: 1]};
    assign serial_out = R_current[0];

endmodule
