module tb_half_adder;
    reg A;
    reg B;
    wire S;
    wire C;
    half_adder dut(
        .A(A),
        .B(B),
        .S(S),
        .C(C)
    );
    task check_case;
        input a_in;
        input b_in;
        input expected_s;
        input expected_c;
        begin
            A = a_in;
            B = b_in;

            #10;

            if ((S !== expected_s) || (C !== expected_c)) begin
                $fatal(1, "FAIL: A=%b B=%b C=%b S=%b", A, B, C, S);
            end
            else begin
                $display("PASS: A=%b B=%b C=%b S=%b", A, B, C, S);
            end
        end
    endtask
    initial  begin
        $dumpfile("04_adder/wave.vcd");
        $dumpvars(0,tb_half_adder);
        check_case(1'b0, 1'b0, 1'b0, 1'b0);
        check_case(1'b0, 1'b1, 1'b1, 1'b0);
        check_case(1'b1, 1'b0, 1'b1, 1'b0);
        check_case(1'b1, 1'b1, 1'b0, 1'b1);
    end
endmodule
