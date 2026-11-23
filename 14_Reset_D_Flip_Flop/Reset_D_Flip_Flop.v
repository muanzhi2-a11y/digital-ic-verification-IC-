module Reset_D_Flip_Flop(
    input wire clk,
    input wire  d,
    input wire  rst,
    output reg  q
 );
  always@(posedge clk ) begin//同步复位。
     if(rst)
     q <= 0;
     else
     q <= d;
    end
endmodule
