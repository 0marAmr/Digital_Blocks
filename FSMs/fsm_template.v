module fsm_template(
    input n_rst,
    input clk,
    input in1,
    output out1
    // continue prots
);

/* the required number of state register bits, with 4 states corresponds to 2^2 -> 2bits */
localparam state_reg_width = 2 ;

localparam [state_reg_width-1: 0]   state0 = 2'd0,
                                    state1 = 2'd1,
                                    state2 = 2'd2
                                    state3 = 2'd3; // 2^state_reg_width states
                            
reg  [state_reg_width-1: 0] current_state, next_state;
reg out_register_current, out_register_next; // to store the output in a register

// state register
always @(posedge clk ) begin
    if(!n_rst) begin
        current_state <= state0;
    end
    else begin
        current_state <= next_state;
        out_register_current <= out_register_next;
    end

end

// next state logic
always @(*) begin
    case (current_state)
        state0: begin
            if (in1) 
                next_state = state1;
            else 
                next_state = state0; 
        end 
// the rest of the states
    endcase
end

// output logic
always @(*) begin
    /* outputs initial vaules are set here so that we do not infer latches
        usually for specific states we're interested in specific outputs only, so we set the initial values here for all the outputs
        then, inside various states we give the desired output a specific values based on a certain output logic 
    */
    out1 = 0;
    // the rest of the outputs
    case (current_state)
        state0: begin
            // if we're using mealy FSM, the outputs are also input dependent, not only on the current state
            
            // if(in1) begin
            out1 = 1;
            // end

        end
        state1: begin
            out1 = 0;
        end
    
    // the rest of the states
    
    endcase
end

/*notice that both the output and input logic blocks can be gathered in one single always combinational block*/

endmodule
