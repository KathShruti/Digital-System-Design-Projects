`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2021 05:50:08
// Design Name: 
// Module Name: tb_top
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


module tb_top;
reg clock;
reg reset;
wire [23:0] out;
wire [7:0] t_seg;
wire [3:0] an_test;
wire tick;
wire found;


TopModule uut (.clk_in(clock), .reset(reset),.lfsr24_out(out),.aan(an_test),.seg(t_seg),.max_tick(tick),.found(found));

initial
begin
   clock=1'b1;
   reset=1'b0;
   #5
   reset=1'b1;
end

always

begin
     #1 clock = ~clock; // negate to oscillate
end
endmodule
