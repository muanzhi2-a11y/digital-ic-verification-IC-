module tb_alu;
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] ALU_Sel;
    wire [3:0] Result;
    wire Carry;
    wire Borrow;
    alu dut(
     .A(A),
     .B(B),
     .ALU_Sel(ALU_Sel),
     .Result(Result),
     .Carry(Carry),
     .Borrow(Borrow)
    );
    task check_case(
     input [3:0] a_in,
     input [3:0] b_in,
     input [2:0] ALU_Sel_in,
     input [3:0] expected_Result,
     input expected_Carry,
     input expected_Borrow
     );
        begin
         A = a_in;
         B = b_in;
         ALU_Sel = ALU_Sel_in;
         #10;
         if((Result !== expected_Result)||(Carry !== expected_Carry)||(Borrow !== expected_Borrow))
         $fatal(1,"FAIL:A=%b B=%b ALU_Sel=%b Result=%b Carry=%b Borrow=%b", A,B,ALU_Sel,Result,Carry,Borrow);
         else
         $display("PASS:A=%b B=%b ALU_Sel=%b Result=%b Carry=%b Borrow=%b", A,B,ALU_Sel,Result,Carry,Borrow);
        end
   endtask
   initial begin
     $dumpfile("08_alu/wave.vcd");
     $dumpvars(0,tb_alu);
     check_case(4'b0011, 4'b0010,3'b000,4'b0101,1'b0,1'b0);//普通加法
     check_case(4'b1111, 4'b0001,3'b000,4'b0000,1'b1,1'b0);//最高位进位
     check_case(4'b1111, 4'b1111,3'b000,4'b1110,1'b1,1'b0);//最大操作数相加
     check_case(4'b1001, 4'b0011,3'b001,4'b0110,1'b0,1'b0);//普通减法
     check_case(4'b0011, 4'b0101,3'b001,4'b1110,1'b0,1'b1);//发生借位
     check_case(4'b0101, 4'b0101,3'b001,4'b0000,1'b0,1'b0);//相同操作数相减
     check_case(4'b0101, 4'b0011,3'b010,4'b0001,1'b0,1'b0);
     check_case(4'b0101, 4'b0011,3'b011,4'b0111,1'b0,1'b0);
     check_case(4'b0101, 4'b0011,3'b100,4'b0110,1'b0,1'b0);//AND、OR、XOR，以及标志位是否正确归零
     check_case(4'b1010, 4'b0110,3'b101,4'b0000,1'b0,1'b0);
     check_case(4'b1010, 4'b0110,3'b110,4'b0000,1'b0,1'b0);
     check_case(4'b1010, 4'b0110,3'b111,4'b0000,1'b0,1'b0);//三个未定义控制编码是否都能正确进入 default 分支。
     $finish;
   end
endmodule
