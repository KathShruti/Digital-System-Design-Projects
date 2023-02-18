`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2021 05:52:19
// Design Name: 
// Module Name: counter
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
module counter
(
input wire clk,
input wire in, clr,
output reg [3:0] d3, d2, d1, d0     //ADDED d3 for minute digit
);

initial
   begin
    d3=4'b0000;
    d2=4'b0000;
    d1=4'b0000;
    d0=4'b0000;
end
   always@(posedge clk, posedge clr)
     begin
     if(clr)
        begin
         d3<=4'b0000;
         d2<=4'b0000;
         d1<=4'b0000;
         d0<=4'b0000;
end
    else if(in)
     begin
      if(d0<9)
       d0=d0+1;
    else if(d1<9)
     begin
       d0=0;
       d1=d1+1;
     end
    else if(d2<9)
      begin
       d0=0;
       d1=0;
       d2=d2+1;
      end
    else if(d3<9)
      begin
       d0=0;
       d1=0;
       d2=0;
       d3=d3+1;
       end
    else
      begin
        d3=4'b0000;
        d2=4'b0000;
        d1=4'b0000;
        d0=4'b0000;
end
end
end
endmodule