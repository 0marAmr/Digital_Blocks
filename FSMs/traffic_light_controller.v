`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:    Omar Amr
// 
// Create Date: 02/25/2023 02:05:11 AM
// Design Name: Traffic Light Controller
// Module Name: traffic_light_controller
// Project Name: Traffic Light Controller
// Target Devices: 
// Tool Versions: 
// Description: A Traffic Light Controller that stays red for 30 seconds, yellow for 5 seconds, and  green for 30 seconds.
//              The controller reset state goes to red light. 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Assuming input clock is 1Hz and 
//
//////////////////////////////////////////////////////////////////////////////////


module tlc(
        input clk, n_reset,
        output wire red_out, yel_out, green_out
    );


    wire [4:0] dp_value;
    wire count_done, n_dp_reset;

    traffic_light_controller_cu control_unit (
        .clk(clk),
        .n_reset(n_reset),
        .count_done(count_done),
        .n_dp_reset(n_dp_reset),
        .dp_value(dp_value),
        .red_out(red_out),
        .yel_out(yel_out),
        .green_out(green_out)
    );

    traffic_light_controller_dp datapath(
            .clk(clk),
            .n_reset(n_dp_reset),
            .max_count(dp_value),
            .count_done(count_done)
    );
endmodule
