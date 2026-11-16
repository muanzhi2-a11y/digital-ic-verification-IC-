module tb_multi_bit_adder;
    reg [3:0] A;
    reg [3:0] B;
    reg  Cin;
    wire Cout;
    wire [3:0] S;
 multi_bit_adder dut(
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
    );
   task check_case(
     input  [3:0] a_in,
     input  [3:0] b_in,
     input  Cin_in,
     input  expected_Cout,
     input  [3:0] expected_S
     );
        begin
         A = a_in;
         B = b_in;
         Cin = Cin_in;
         #10;
         if((Cout !== expected_Cout)||(S !== expected_S))
             $fatal(1,"FAIL: A=%d B=%d Cin=%d S=%d Cout=%d",A,B,Cin,S,Cout);
         else
             $display("PASS: A=%d B=%d Cin=%d S=%d Cout=%d",A,B,Cin,S,Cout);
        end
    endtask
 initial begin
     $dumpfile("06_multi_bit_adder/wave.vcd");
     $dumpvars(0, tb_multi_bit_adder);
     check_case(4'b1111,4'b0001,1'b0,1'b1,4'b0000); // 测试1：最低位产生进位，并连续传播至最高位，最终 Cout=1
     check_case(4'b0011,4'b0000,1'b1,1'b0,4'b0100); // 测试2：外部Cin引入进位，连续传播两级后终止
     check_case(4'b1111,4'b0000,1'b1,1'b1,4'b0000); // 测试3：外部Cin引入进位，经过四级全加器连续传播，最终 Cout=1
     check_case(4'b0101,4'b0010,1'b0,1'b0,4'b0111); // 测试4：普通无进位加法，检查各位求和结果
     check_case(4'b0111,4'b0001,1'b0,1'b0,4'b1000); // 测试5：最低位产生进位，连续传播至最高位，但最终 Cout=0
     check_case(4'b0010,4'b0010,1'b0,1'b0,4'b0100); // 测试6：中间位产生进位，向高位传播后终止
     check_case(4'b0000,4'b0000,1'b1,1'b0,4'b0001); // 测试7：单独验证外部Cin对最低位求和的影响
     $finish;
    end
endmodule
