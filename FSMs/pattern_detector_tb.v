`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2023 11:25:34 PM
// Design Name: 
// Module Name: pattern_detector_tb
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

module pattern_detector_tb;

// input signals
reg  clk;
reg  n_rst;
reg  stream_in;

// output signals
wire  pattern_found;

// instantiation
pattern_detector uut(
	.clk(clk),
	.n_rst(n_rst),
	.stream_in(stream_in),
	.pattern_found(pattern_found)
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

task serial_in(
	input data
);	
    begin
	   stream_in = data;
	   @(negedge clk);
	   $display("serial input = %1d pattern detected = %1d",data, pattern_found);
	end
endtask
// test vector generator
initial begin

@(negedge  clk); // wait for the device to reset

serial_in(1);
serial_in(1);
serial_in(0);
serial_in(1);
serial_in(0); // now pattern is found
serial_in(1);

$finish; 
end

endmodule
