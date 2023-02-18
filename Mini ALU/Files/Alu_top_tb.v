//SETTING TIMESCALE
`timescale 1 ns/10 ps

module mini_alu_tb;
    reg [5:0] p, q;
    reg [2:0] fxn;
    wire [5:0] X;
   
    Alu_Top uut (.A(p), .B(q), .fxn(fxn), .x(X));
    
    //TEST VECTORS
    initial
    begin
    // initialize selected fxn
     // initialize selected fxn
  
    //test vector 1
    fxn = 3'b111;
    p = 6'b011100;
    q = 6'b011010;
    # 100;
    //test vector 2
    fxn = 3'b111;
    p = 6'b010010;
    q = 6'b010011;
    # 100;
    //test vector 3
    fxn = 3'b111;
    p = 6'b101110;
    q = 6'b010100;
    # 100;
    //test vector 4
    fxn = 3'b111;
    p = 6'b011010;
    q = 6'b000001;
    # 100;
    //test vector 5
    fxn = 3'b111;
    p = 6'b001010;
    q = 6'b010110;
    # 100;
    //test vector 6
    fxn = 3'b111;
    p = 6'b000000;
    q = 6'b010110;
    # 100;
     //test vector 7
     fxn = 3'b111;
    p = 6'b000010;
    q = 6'b000110;
    # 100;
     //test vector 8
     fxn = 3'b111;
    p = 6'b001110;
    q = 6'b001000;
    # 100;
     //test vector 9
     fxn = 3'b111;
    p = 6'b010000;
    q = 6'b010010;
    # 100;
     //test vector 10
     fxn = 3'b111;
    p = 6'b000000;
    q = 6'b010110;
    # 100;
    
    end//STOP
endmodule