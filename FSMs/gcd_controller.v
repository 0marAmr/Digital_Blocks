`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2023 04:31:36 AM
// Design Name: 
// Module Name: gcd_controller
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


module gcd_controller( 
    input clk, n_rst,
    input start,
    input a_eq_b, a_gt_b,
    output reg sel_A, sel_B, 
    output reg wr_A, wr_B, 
    output reg wr_res
    );

    

    localparam STATE_REG_WIDTH = 3;

    localparam [STATE_REG_WIDTH-1: 0]   start_check       = 3'b000,
                                        eqality_check     = 3'b001, 
                                        relation_check    = 3'b010, 
                                        assign_A          = 3'b011, 
                                        assign_B          = 3'b100, 
                                        assign_res        = 3'b101;

    reg [STATE_REG_WIDTH-1: 0] current_state, next_state;

    // status register
    always @(posedge clk or negedge n_rst) begin
        if(!n_rst)
            current_state <= 0;
        else
            current_state <= next_state;
    end

    // next state & output logic

    always @(*) begin
        next_state = start_check;
        {sel_A, sel_B, wr_A, wr_B, wr_res} = 0;

        case (current_state)
            start_check: begin
                // NS
                if(start)
                    next_state <= eqality_check;
                else
                next_state <= start_check;

                // OP
                wr_A    <= 1;
                wr_B    <= 1;
                sel_A   <= 0;
                sel_B   <= 0;
            end
            eqality_check: begin
                // NS
                if(a_eq_b)
                    next_state <= assign_res;
                else
                    next_state<= relation_check;
            end
            relation_check: begin
                // NS
                if(a_gt_b)
                    next_state <= assign_A;
                else
                    next_state<= assign_B;
            end
            
            assign_A: begin
                // NS
                next_state <= eqality_check;

                // OP
                wr_A <= 1;
                sel_A <= 1;
            end

            assign_B: begin
                // NS
                next_state <= eqality_check;
                
                // OP
                wr_B <= 1;
                sel_B <= 1;
            end

            assign_res: begin
                // NS
                next_state <= start_check;
                
                // OP
                wr_res <= 1;
            end

        endcase
    end

endmodule

