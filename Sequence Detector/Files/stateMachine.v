`timescale 1ns / 1ps
`timescale 1ns / 1ps
 module stateMachine
(
input wire clk, reset,
input wire seq,
output reg tick
);
// symbolic state declaration
localparam A = 4'b0000,
B = 4'b0001,
C = 4'b0010,
D = 4'b0011,
E = 4'b0100,
F = 4'b0101,
G = 4'b0110,
H = 4'b0111,
I = 4'b1000,
J = 4'b1001,
K = 4'b1010;

reg [3:0] state_reg, state_next;

always @(posedge clk, posedge reset)
   begin
    if (reset)
    state_reg <= A;
    else
    state_reg <= state_next;
end
// next-state logic and output logic
always @*
   begin
   state_next = state_reg;
// default state: the same
   tick = 1'b0; // default output: 0
  case (state_reg)
   A:
    if (seq)
    state_next = B;
    else
    state_next = A;
   B:
    if (seq)
    state_next = C;
    else
    state_next = A;
   C:
    if (~seq)
    state_next = D;
    else
    state_next = C;
   D:
    if (~seq)
    state_next = E;
    else
    state_next = B;
    E:
    if (seq)
    state_next = F;
    else
    state_next = C;
    F:
    if (~seq)
    state_next = G;
    else
    state_next = A;
    G:
    if (seq)
    state_next = H;
    else
    state_next = C;
     H:
    if (~seq)
    state_next = I;
    else
    state_next = B;
    I:
    if (~seq)
    state_next = J;
    else
    state_next = B;
    J:
    if (~seq)
    state_next = K;
    else
    state_next = B;
    K:
    if (~seq)
    begin
    state_next = A;
    tick=1'b1;
    end
    else
    state_next = B;
  
 default:
    begin
    state_next = A;
    tick=1'b1;
end
endcase
end
endmodule
