module tb_and_gate;
reg A;
reg B;
wire Y;
and_gate dut (
    .A(A),
    .B(B),
    .Y(Y)
);
initial begin
$dumpfile("wave.vcd");
$dumpvars(0,tb_and_gate);

A = 0;
B = 0;
#10;
if (Y == 0)
    $display("PASS: A=%b, B=%b, Y=%b", A, B, Y);
else
    $display("FAIL: A=%b, B=%b, Y=%b", A, B, Y);

A = 0;
B = 1;
#10;
if (Y == 0)
    $display("PASS: A=%b, B=%b, Y=%b", A, B, Y);
else
    $display("FAIL: A=%b, B=%b, Y=%b", A, B, Y);

A = 1;
B = 0;
#10;
if (Y == 0)
    $display("PASS: A=%b, B=%b, Y=%b", A, B, Y);
else
    $display("FAIL: A=%b, B=%b, Y=%b", A, B, Y);
A = 1;
B = 1;
#10;
if (Y == 1)
    $display("PASS: A=%b, B=%b, Y=%b", A, B, Y);
else
    $display("FAIL: A=%b, B=%b, Y=%b", A, B, Y);
end
endmodule