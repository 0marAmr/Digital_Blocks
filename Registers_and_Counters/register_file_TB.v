`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2023 03:05:46 PM
// Design Name: 
// Module Name: register_file_TB
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


module register_file_TB;
        parameter W = 5, B = 8;
        reg [W-1 : 0] r_addr_A, r_addr_B, w_addr;
        reg clk, wr_en, n_reset;
        reg [B-1 : 0] w_data;
        wire [B-1 : 0] r_data_A, r_data_B;
        
        reg_file #(.W(W), .B(B)) uut  (
            .r_addr_A(r_addr_A), 
            .r_addr_B(r_addr_B), 
            .w_addr(w_addr), 
            .clk(clk), 
            .wr_en(wr_en),
            .n_reset(n_reset), 
            .w_data(w_data), 
            .r_data_A(r_data_A), 
            .r_data_B(r_data_B)
        );

        always #15 clk = ~clk;
        initial begin
            clk = 0;
            r_addr_A =0;
            r_addr_B = 0;
            w_addr = 0;
            wr_en = 0;
            n_reset = 0;
            w_data  = 0;
            #20;
            n_reset = 1;
            wr_en = 1;
            w_addr = 5'd0;
            w_data = 8'd10;
            #30;
            w_addr = 5'd1;
            w_data = 8'd15;
            #30;
            r_addr_A = 5'd0;
            r_addr_B = 5'd1;
            #30;
            $stop;
        end
endmodule
