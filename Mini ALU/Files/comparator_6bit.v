`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2021 18:40:42
// Design Name: 
// Module Name: comparator_6bit
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
module comparator_6bit (
input [5:0] in1,
input [5:0] in2,
output [5:0] y
);

comparator bit0 (.i1(in1[0]), .i2(in2[0]), .less_than(y[0]));
comparator bit1 (.i1(in1[1]), .i2(in2[1]), .less_than(y[1]));
comparator bit2 (.i1(in1[2]), .i2(in2[2]), .less_than(y[2]));
comparator bit3 (.i1(in1[3]), .i2(in2[3]), .less_than(y[3]));
comparator bit4 (.i1(in1[4]), .i2(in2[4]), .less_than(y[4]));
comparator bit5 (.i1(in1[5]), .i2(in2[5]), .less_than(y[5]));

endmodule

