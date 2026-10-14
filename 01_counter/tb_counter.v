module tb_counter;
    reg clk;
    reg reset;
    wire [1:0] count;
counter dut(
    .clk(clk),
    .reset(reset),
    .count(count)
);
    initial begin
    clk = 0;
    end

    always begin 
    #5 clk = ~clk;
    end

    initial begin
    reset = 1;
    #6 if(count==2'b00)
    $display("reset pass");
    else
    $display("reset fail"); 
    #4 reset = 0;

    #6 if(count==2'b01)
    $display("pass");
    else
    $display("fail");

    #10 if(count==2'b10)
    $display("pass");
    else
    $display("fail");

    #10 if(count==2'b11)
    $display("pass");
    else
    $display("fail");

    #10 if(count==2'b00)
    $display("pass");
    else
    $display("fail");
    $finish;
    end
    initial begin
    $dumpfile("counter.vcd");
    $dumpvars("0,tb_counter");
    end
endmodule