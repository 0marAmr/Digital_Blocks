`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2023 06:09:31 AM
// Design Name: 
// Module Name: gcd_top_tb
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
/*test bench is automatically generated*/

module gcd_top_tb;

parameter N = 32;
// input signals
reg  clk;
reg  n_rst;
reg  start;
reg [N-1:0] A;
reg [N-1:0] B;

// output signals
wire [N-1:0] res;

// instantiation
gcd_top uut(
	.clk(clk),
	.n_rst(n_rst),
	.start(start),
	.A(A),
	.B(B),
	.res(res)
	);

// clock signal
parameter PERIOD  = 20;

initial begin
clk = 0;
forever #(PERIOD/2)  clk=~clk; 
end


// reset pulse
initial begin
 n_rst = 1'b0;
#(PERIOD/2);
 n_rst = 1'b1;
 end

task test_values(
	input [N-1: 0] data1, data2
);
	begin
		A = data1;
		B = data2;
		start = 1;
		@(negedge clk);
		start = 0;
		repeat(20)@(negedge clk);
		$display("the greatest common divisor = %3d",res);
	end
endtask
// test vector generator
initial begin
start = 0;
A = 0;
B = 0;
@(negedge clk); // wait for the device to reset
test_values(24,8);
test_values(36,60);
test_values(50,10);

$finish; 
end

endmodule