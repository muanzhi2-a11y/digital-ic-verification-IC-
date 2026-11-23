module Async_Reset_D_Flip_Flop(
    input wire clk,
    input wire  d,
    input wire  rst,
    output reg  q
 );
  always@(posedge clk or posedge rst ) begin//异步复位，高电平有效。
     if(rst)
     q <= 0;
     else
     q <= d;
    end
endmodule
