`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2021 18:35:48
// Design Name: 
// Module Name: bitwise_xnor
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
 module bitwise_xnor(
input [5:0] a,
input [5:0] b,
output [5:0] xor_
);

assign xor_ = a ~^b; 
endmodule
