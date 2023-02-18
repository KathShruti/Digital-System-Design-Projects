`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2021 18:18:05
// Design Name: 
// Module Name: lfsr24_bit
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
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2021 05:37:02
// Design Name: 
// Module Name: lfsr16bit
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


module lfsr24_bit(
    input wire clk,reset,
    output [23:0] lfsr_out,
    output max_tick_reg
    );
    
    reg [23:0] lfsr_reg;
    reg [23:0] lfsr_next;
    reg lfsr_tap;
    reg[23:0] count=24'b000000000000000000000000;
    reg tick_var=1'b0;
    
    always @(posedge clk)
    if(reset)
    lfsr_reg <=24'b100111111001000000000000;
    else
    lfsr_reg <= lfsr_next;
    
    always @(posedge clk)
    if(count== 24'b111111111111111111111111)   //2*N-1 cycles
       begin
       tick_var <= 1'b1;
       count <= 24'b000000000000000000000000;
       end
    else
      begin
      tick_var <=1'b0;
      count <= count + 1'b1;
      end
      
    always @*
    begin
    lfsr_tap =lfsr_reg[23]^lfsr_reg[22]^lfsr_reg[21]^lfsr_reg[16];
    lfsr_next = {lfsr_reg[22:0],lfsr_tap };
    end
    
    assign lfsr_out =lfsr_reg;
    assign max_tick_reg =tick_var;
  endmodule
