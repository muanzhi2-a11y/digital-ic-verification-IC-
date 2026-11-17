module tb_Priority_Encoder_8to3;
    reg  [7:0] D;
    wire [2:0] Y;
    wire   valid;
 Priority_Encoder_8to3 dut(
    .D(D),
    .Y(Y),
    .valid(valid)
 );
    task check_case(
        input [7:0] d_in,
        input [2:0] expected_y,
        input expected_valid
     );
     begin
     D = d_in;
     #10;
     if((Y !== expected_y)||(valid !== expected_valid))
     $fatal(1,"FAIL: D=%b Y=%b valid=%b", D,Y,valid);
     else
     $display("PASS：D=%b Y=%b valid=%b", D,Y,valid);
     end
    endtask
    initial begin
     $dumpfile("11_Priority_Encoder_8to3/wave.vcd");
     $dumpvars(0,tb_Priority_Encoder_8to3.v);
     check_case(8'b00000000,3'b000,1'b0);
     check_case(8'b00000001,3'b000,1'b1);
     check_case(8'b00000010,3'b001,1'b1);
     check_case(8'b00000100,3'b010,1'b1);
     check_case(8'b00001000,3'b011,1'b1);
     check_case(8'b00010000,3'b100,1'b1);
     check_case(8'b00100000,3'b101,1'b1);
     check_case(8'b01000000,3'b110,1'b1);
     check_case(8'b10000000,3'b111,1'b1);
     check_case(8'b10101000,3'b111,1'b1);
     check_case(8'b00101000,3'b101,1'b1);
     check_case(8'b00001110,3'b011,1'b1);
     $finish;
    end
endmodule
