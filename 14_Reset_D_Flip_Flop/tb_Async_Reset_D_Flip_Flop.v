module tb_Async_Reset_D_Flip_Flop;
    reg clk;
    reg d;
    reg rst;
    wire q;
    Async_Reset_D_Flip_Flop dut(
     .clk(clk),
     .d(d),
     .rst(rst),
     .q(q)
    );
    task check_case(
     input expected_q
     );
     begin
     if(q !== expected_q)
     $fatal(1,"FAIL: d=%b q=%b",d,q);
     else
     $display("PASS: d=%b q=%b",d,q);
     end
    endtask
    initial begin
     clk = 0;
        forever begin
         #5 clk = ~ clk;
        end
    end
    initial begin
     $dumpfile("14_Reset_D_Flip_Flop/Async_wave.vcd");
     $dumpvars(0,tb_Async_Reset_D_Flip_Flop);
     d = 0;
     rst = 0;
     #6 check_case(1'b0);//6p
     #1 d = 1;//7p
     #7 check_case(1'b0);//14p
     #2 check_case(1'b1);//16p
     #1 rst = 1;//17p
     #1 check_case(1'b0);//18p
     #3 check_case(1'b0);//21p
     #1 rst = 0;//22p
     #2 check_case(1'b0);//24p
     #2 check_case(1'b1);//26p
     $finish;
    end
endmodule
