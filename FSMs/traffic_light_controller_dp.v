`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:    Omar Amr
// 
// Create Date: 02/25/2023 02:13:31 AM
// Design Name: Traffic Light Controller datapath
// Module Name: traffic_light_controller_dp
// Project Name: Traffic Light Controller
// Target Devices: 
// Tool Versions: 
// Description: a 5-bit counter with maximum count and a count_done indicator output signal
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module traffic_light_controller_dp(
    input clk, n_reset,
    input [4:0] max_count,
    output reg count_done
    );

    // counter register 
    reg [4:0] cntr;

    always @(posedge clk or negedge n_reset ) begin
        if(!n_reset) begin
            cntr <= 0;
            count_done <= 0;
        end
        else if(cntr == max_count) begin
            // counter keeps it's value
            count_done <= 1; 
        end
        else begin
            cntr <= cntr + 1;
            count_done <= 0;
        end
    end

endmodule
