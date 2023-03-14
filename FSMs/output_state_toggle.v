`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:    Omar Amr
// 
// Create Date: 02/24/2023 10:24:03 PM
// Design Name: output state toggle
// Module Name: op_state_t
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: this generic design can be used as a switch that toggles the state of the output
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
/* Application:
        a lamp that is connected to a pushbutton. If the pushbutton is pressed once,
        the lamp will turn off if it is on, or it will turn on if it is off.
*/
//Additional Comments:
/*
there are 4 states, off_0, on_1, on_0, off_1, which designates the state of the lamp and the current input (the button)
for example: off_0 the lamp is off and the button is not pressed (0), on_1 the lamp is on and the button is pressed, and so on..
*/
// 
//////////////////////////////////////////////////////////////////////////////////


module op_state_t(
        input ip_signal, clk, n_reset,
        output reg op_signal
    );

    localparam state_reg_width = 2;
    localparam [state_reg_width-1: 0]   off_0   = 2'b00,
                                        on_1    = 2'b01,
                                        on_0    = 2'b10,
                                        off_1   = 2'b11;

reg [state_reg_width-1: 0] current_state, next_state;

// state register
always @(posedge clk or negedge n_reset) begin
    if (!n_reset)
        current_state <= off_0;
    else 
        current_state <= next_state;
end

// next state logic and output logic
always @(*) begin
    // default values
    // op_signal = 0;
    case (current_state)
        off_0: begin
            if(ip_signal) next_state = on_1;
            else next_state = off_0;

            op_signal = 0;
        end        
        on_1: begin
            if(ip_signal) next_state = on_1;
            else next_state = on_0;

            op_signal = 1;
        end        
        on_0: begin
            if(ip_signal) next_state = off_1;
            else next_state = off_0;

            op_signal = 1;
        end        
        off_1: begin
            if(ip_signal) next_state = off_1;
            else next_state = off_0;

            op_signal = 0;
        end 
    endcase
end

endmodule
