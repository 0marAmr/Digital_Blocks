`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2023 07:17:42 PM
// Design Name: 
// Module Name: d_flip_flop_TB
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


module d_flip_flop_TB;
    reg clk, D, n_clr, n_reset, en;
    wire Q,Q_bar;
    
    d_ff uut(
        .clk(clk),
        .D(D),
        .n_clr(n_clr),
        .n_reset(n_reset),
        .en(en),
        .Q(Q),
        .Q_bar(Q_bar)
    );
    
    always #15 clk = ~clk;
    
    initial begin
        clk = 0;
        D = 0;
        n_clr = 1;
        n_reset = 1;
        en = 0;
        // synchronous clear
        #40;
        n_clr = 0;
        #30;
        en = 1;
        n_clr = 1;
        D = 1;
        //asynch. reset
        #30;
        n_reset = 0;
        #10;
        n_reset = 1;
        en = 0;
        D=1;
        #30;
        en = 1;
        #30;
        $stop;
    end
    
endmodule
