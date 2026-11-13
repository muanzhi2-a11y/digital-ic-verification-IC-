module tb_full_adder;
    reg  A;
    reg  B;
    reg  Cin;
    wire S;
    wire Cout;
    full_adder dut(
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );
    task check_case;
        input a_in;
        input b_in;
        input Cin_in;
        input expected_S;
        input expected_Cout;
        begin
            A = a_in;
            B = b_in;
            Cin = Cin_in;
            #10;
            if((S !== expected_S)||(Cout !== expected_Cout))begin
                $fatal(1,"FAIL: A=%d B=%d Cin=%d S=%d Cout=%d",A,B,Cin,S,Cout);
            end
            else begin
                $display("PASS: A=%d B=%d Cin=%d S=%d Cout=%d",A,B,Cin,S,Cout);
            end
        end
    endtask
    initial begin
        $dumpfile("05_full_adder/wave.vcd");
        $dumpvars(0, tb_full_adder);
        check_case(1'b0,1'b0,1'b0,1'b0,1'b0);
        check_case(1'b0,1'b0,1'b1,1'b1,1'b0);
        check_case(1'b0,1'b1,1'b0,1'b1,1'b0);
        check_case(1'b0,1'b1,1'b1,1'b0,1'b1);
        check_case(1'b1,1'b0,1'b0,1'b1,1'b0);
        check_case(1'b1,1'b0,1'b1,1'b0,1'b1);
        check_case(1'b1,1'b1,1'b0,1'b0,1'b1);
        check_case(1'b1,1'b1,1'b1,1'b1,1'b1);
        $finish;
    end
endmodule
