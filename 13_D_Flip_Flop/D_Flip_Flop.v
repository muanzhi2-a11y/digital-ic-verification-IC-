module  D_Flip_Flop(
    input wire d,
    input wire clk,
    output reg q
 );
 always@(posedge clk)
 begin
 q <= d;
 end
endmodule
