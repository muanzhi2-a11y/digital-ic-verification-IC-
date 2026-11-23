module  tb_D_Flip_Flop;
    reg  clk;
    reg   d;
    wire  q;
    D_Flip_Flop dut(
     .clk(clk),
     .d(d),
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
     $dumpfile("13_D_Flip_Flop/wave.vcd");
     $dumpvars(0,tb_D_Flip_Flop);
     d = 0;
     #6 check_case(1'b0);
     #1 d = 1;//7s
     #2 check_case(1'b0);//9p
     #2 check_case(1'b0);//11p
     #3 check_case(1'b0);//14p
     #2 check_case(1'b1);//16p
     #1 d = 0;//17p
     #2 check_case(1'b1);//19p
     #2 check_case(1'b1);//21p
     #3 check_case(1'b1);//24p
     #2 check_case(1'b0);//26p
     #1 d = 1;//27p
     #1 check_case(1'b0);//28p
     #3 check_case(1'b0);//31p
     #5 check_case(1'b1);//36p
     $finish;
    end
endmodule
