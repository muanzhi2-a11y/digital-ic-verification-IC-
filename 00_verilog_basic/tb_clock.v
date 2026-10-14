module tb_clock;
reg clk;
initial begin
    clk = 0;
end

always begin
 #5 clk = ~clk;
end

initial begin
    #40;
    $display("NOW time = %0t", $time);
    $finish;
end

initial begin
    $dumpfile("clock.vcd");
    $dumpvars(0, tb_clock);
end

endmodule
