`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2023 11:59:48 AM
// Design Name: 
// Module Name: n_bit_adder_tb
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


module n_bit_adder_tb;

    // Parameters
    parameter N = 4;
    
    // Inputs
    reg [N-1:0] X, Y;
    
    // Outputs
    wire [N-1:0] Z;
    wire C_out;
    
    // Instantiate the module to be tested
    n_bit_adder #(.N(N)) dut (
        .X(X),
        .Y(Y),
        .Z(Z),
        .C_out(C_out)
    );
    
    // Clock signal
    reg clk = 0;
    
    // Testbench code
    initial begin
        // Test case 1
        X = 4'b0000;
        Y = 4'b0000;
        #10;
        if (Z !== 0 || C_out !== 1'b0) $display("Test case 1 failed");
        
        // Test case 2
        X = 4'b0011;
        Y = 4'b0001;
        #10;
        if (Z !== 4 || C_out !== 1'b0) $display("Test case 2 failed");
        
        // Test case 3
        X = 4'b0110;
        Y = 4'b1011;
        #10;
        if (Z !== 17 || C_out !== 1'b1) $display("Test case 3 failed");
        
        $display("Testbench complete");
        $finish;
    end
    
    // Toggle the clock
    always #5 clk = ~clk;
    
endmodule
