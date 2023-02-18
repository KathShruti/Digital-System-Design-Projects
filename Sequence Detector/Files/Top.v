`timescale 1ns / 1ps
module TopModule(

input wire clk_in,
input wire reset,
output wire [13:0] lfsr24_bout,
//output wire [13:0] lfsr24_bout,
output wire [3:0] aan,
output wire [7:0] seg,
output wire max_tick,
output wire found
);
wire [23:0] lfsr24_out;




wire clk1;
wire [3:0] d0,d1,d2,d3;


//assign clk1 = clk_in;

clock              Clock_Gen (.clk_in(clk_in),.clk_out(clk1));

lfsr24_bit          lfsr_mod(.clk(clk1), .reset(reset),.lfsr_out(lfsr24_out), .max_tick_reg(max_tick));

stateMachine        fsm_mod(.clk(clk1), .reset(reset| max_tick),.seq(lfsr24_out[23]), .tick(found));

counter             counter_mod(.clk(clk1), .go(found), .clr(reset |max_tick),.d3(d3), .d2(d2), .d1(d1), .d0(d0));

disp_hex_mux          hex_mod(.clk(clk_in), .reset(reset), .hex3(d3),.hex2(d2), .hex1(d1), .hex0(d0), .dp_in(4'b1111), .an(aan),.sseg(seg));

//assign aan = aan | 4'b0000;
assign lfsr24_bout = lfsr24_out[13:0];
endmodule
