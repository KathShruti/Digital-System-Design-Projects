// THIS MODULE IMPLEMENTS THE ALU BY CALLING OTHER MODULES FOR EACH FUNCTION
module Alu_Top
    (
    input wire [5:0] A, B,	// 6-bit - inputs a,b
    input wire [2:0] fxn,	// 3-bit - input fxn
    output reg [5:0] x		// 6-bit - output x
    );
    
    wire [5:0] invA, invB, AxorB, AplusB, AminusB;	//TEMPORARY 6-BIT WIRES FOR THE OUTPUT OF EACH MODULE
    wire AlessthanB;	//TEMPORARY 1-BIT VARIABLE FOR THE 1-BIT OUTPUT OF THE >= CIRCUIT
    
    // instantiation to modules
    negativeAB inv_A (.a(A), .s(invA));    // X = -A
    negativeAB inv_B (.a(B), .s(invB));    // X = -B   
  
    bitwise_xnor A_xor_B(.a(A), .b(B), .xor_(AxorB)); // X = A ^ B
    ripple_carry_adder A_plus_B (.x(A), .y(B), .sel(0), .sum(AplusB)); // X = A + B
    ripple_carry_adder A_minus_B (.x(A), .y(B), .sel(1), .sum(AminusB));   // X = A - B
    
    // control for fxn call
    always @(*)
    begin
        if (fxn == 3'b000)  {x} = {A};						// X = A  This is according to the question given.
        if (fxn == 3'b001)  {x} = {B};						// X = B
        if (fxn == 3'b010)  {x} = {invA};					// X = -A
        if (fxn == 3'b011)  {x} = {invB};					// X = -B
      
        if (fxn == 3'b101)  {x} = {AxorB};					// X = A ^ B
        if (fxn == 3'b110)  {x} = {AplusB};					// X = A + B
        if (fxn == 3'b111)  {x} = {AminusB};	        	// X = A - B
    end
endmodule
