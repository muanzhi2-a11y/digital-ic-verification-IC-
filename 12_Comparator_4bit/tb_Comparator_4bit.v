module tb_Comparator_4bit;
    reg [3:0] A;
    reg [3:0] B;
    wire GT;
    wire EQ;
    wire LT;
   Comparator_4bit dut(
     .A(A),
     .B(B),
     .GT(GT),
     .EQ(EQ),
     .LT(LT)
    );
   task check_case(
        input [3:0] a_in,
        input [3:0] b_in,
        input expected_gt,
        input expected_eq,
        input expected_lt
        );
        begin
         A = a_in;
         B = b_in;
         #10;
         if((GT !== expected_gt)||(EQ !== expected_eq)||(LT !== expected_lt))
         $fatal(1,"FAIL: A=%b B=%b GT=%b EQ=%b LT=%b", A,B,GT,EQ,LT);
         else
         $display("PASS：A=%b B=%b GT=%b EQ=%b LT=%b", A,B,GT,EQ,LT);
        end
    endtask
    initial begin
     $dumpfile("12_Comparator_4bit/wave.vcd");
     $dumpvars(0,tb_Comparator_4bit);
     check_case(4'b1010, 4'b1000, 1'b1, 1'b0, 1'b0);
     check_case(4'b0011, 4'b1000, 1'b0, 1'b0, 1'b1);
     check_case(4'b1010, 4'b1010, 1'b0, 1'b1, 1'b0);
     check_case(4'b1111, 4'b0000, 1'b1, 1'b0, 1'b0);
     check_case(4'b0000, 4'b1111, 1'b0, 1'b0, 1'b1);
     check_case(4'b0111, 4'b1000, 1'b0, 1'b0, 1'b1);
     $finish;
    end
endmodule
