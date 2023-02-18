`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2021 18:43:57
// Design Name: 
// Module Name: negativeAB
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

`timescale 1ns / 1ps 
module negativeAB(
input [5:0] a,
output [5:0] s
);
wire [5:0]p = 000001;
wire [5:0] invert; 
assign invert = ~a;
/*ripple_carry_adder i0(.x(invert), .y(6'b00_0001), .sel(1'b0), .sum(s));*/
assign s =invert + p;
endmodule

