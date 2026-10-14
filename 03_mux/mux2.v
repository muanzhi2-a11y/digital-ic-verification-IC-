module mux2(
    input a,
    input b,
    input sel,
    output wire y
 );
 assign y = sel ? b : a;
endmodule
 