module tb_full_subtractor;
    reg A;
    reg B;
    reg Bin;
    wire D;
    wire Bout;
    full_subtractor dut(
    .A(A),
    .B(B),
    .Bin(Bin),
    .D(D),
    .Bout(Bout)
    );
    task check_case(
     input a_in,
     input b_in,
     input Bin_in,
     input expected_D,
     input expected_Bout
     );
     begin
     A = a_in;
     B = b_in;
     Bin = Bin_in;
     #10;
     if((D !== expected_D)||(Bout !== expected_Bout))
            $fatal(1,"FAIL: A=%d B=%d Bin=%d D=%d Bout=%d",A,B,Bin,D,Bout);
     else
            $display("PASS: A=%d B=%d Bin=%d D=%d Bout=%d",A,B,Bin,D,Bout);
     end
    endtask
    initial begin
     $dumpfile("07_subtractor/wave.vcd");
     $dumpvars(0,tb_full_subtractor);
     // 测试1：A、B、Bin 全为0
     check_case(1'b0,1'b0,1'b0,1'b0,1'b0);
     // 测试2：仅输入借位 Bin=1
     check_case(1'b0,1'b0,1'b1,1'b1,1'b1);
     // 测试3：A=0，B=1，Bin=0，产生借位
     check_case(1'b0,1'b1,1'b0,1'b1,1'b1);
     // 测试4：A=0，B=1，Bin=1，连续借位
     check_case(1'b0,1'b1,1'b1,1'b0,1'b1);
     // 测试5：A=1，B=0，Bin=0，普通减法
     check_case(1'b1,1'b0,1'b0,1'b1,1'b0);
     // 测试6：A=1，B=0，Bin=1，输入借位被抵消
     check_case(1'b1,1'b0,1'b1,1'b0,1'b0);
     // 测试7：A=1，B=1，Bin=0，结果为0
     check_case(1'b1,1'b1,1'b0,1'b0,1'b0);
     // 测试8：A、B、Bin 全为1
     check_case(1'b1,1'b1,1'b1,1'b1,1'b1);
     $finish;
    end
endmodule
