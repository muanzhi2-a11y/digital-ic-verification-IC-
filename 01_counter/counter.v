module counter(
    input clk,
    input reset,
    output reg [1:0]count
);
    always@(posedge clk) begin
        if(reset)
        count<=0;
        else
    count<=count+2;
    end
endmodule
