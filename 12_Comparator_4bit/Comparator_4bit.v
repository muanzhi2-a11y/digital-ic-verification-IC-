module Comparator_4bit(
    input wire [3:0] A,
    input wire [3:0] B,
    output wire GT,
    output wire EQ,
    output wire LT
 );
 assign GT = (A > B);
 assign EQ = (A == B);
 assign LT = (A < B);
endmodule
