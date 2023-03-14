`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:    Omar Amr
// 
// Create Date: 02/25/2023 02:13:31 AM
// Design Name: Traffic Light Controller control unit
// Module Name: traffic_light_controller_cu
// Project Name: Traffic Light Controller
// Target Devices: 
// Tool Versions: 
// Description: a FSM control unit for the traffic light controller
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module traffic_light_controller_cu(
        input clk, n_reset,
        input count_done,
        output reg n_dp_reset, 
        output reg [4:0] dp_value,
        output reg red_out, yel_out, green_out 
    );

    // maximum count in seconds
    localparam  MAX_COUNT_RED   = 30,
                MAX_COUNT_YEL   = 5,
                MAX_COUNT_GREEN = 30;

    localparam [2:0]    cntr_red    = 3'b000,    
                        wait_red    = 3'b001, 
                        cntr_yel    = 3'b010, 
                        wait_yel    = 3'b011, 
                        cntr_green  = 3'b100, 
                        wait_green  = 3'b101; 

    reg [2:0] current_state, next_state;
    
    // state register
    always @(posedge clk or negedge n_reset) begin
        if(!n_reset)
            current_state <= cntr_red;
        else
            current_state <= next_state;
    end

    // state logic
    always @(*) begin
        // default values
        n_dp_reset = 1;
        dp_value  = 0;
        {red_out, yel_out, green_out} = 3'b0;

        case (current_state)
            cntr_red: begin
                next_state = wait_red;

                n_dp_reset = 0;
                dp_value = MAX_COUNT_RED - 1;
            end
            wait_red : begin
                if(count_done) next_state = cntr_yel;
                else next_state = wait_red;

                n_dp_reset = 1;
                red_out = 1;
            end
            cntr_yel: begin
                next_state = wait_yel;

                n_dp_reset = 0;
                dp_value = MAX_COUNT_YEL - 1;
            end
            wait_yel : begin
                if(count_done) next_state = cntr_yel;
                else next_state = wait_yel;

                n_dp_reset = 1;
                yel_out = 1;
            end
            cntr_green: begin
                next_state = wait_green;

                n_dp_reset = 0;
                dp_value = MAX_COUNT_GREEN - 1;
            end
            wait_green : begin
                if(count_done) next_state = cntr_red;
                else next_state = wait_green;

                n_dp_reset = 1;
                green_out = 1;
            end
        endcase
    end

endmodule
