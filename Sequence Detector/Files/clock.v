`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2021 05:50:59
// Design Name: 
// Module Name: clock
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
module clock(clk_in,clk_out
 );
input clk_in; // input clock on FPGA
output reg clk_out; // output clock after dividing the input clock by divisor
     
     parameter DIV = 32'd50000;
     reg [27:0] counter = 32'd0;
     
     always @(posedge clk_in)
        begin
            counter <= counter + 1;
            if(counter > DIV)
                counter <= 32'b0;
            clk_out <= (counter < DIV/2) ? 1'b1: 1'b0;
        end
        
 





endmodule

