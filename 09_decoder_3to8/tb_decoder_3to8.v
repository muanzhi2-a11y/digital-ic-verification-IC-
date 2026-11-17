module tb_decoder_3to8;
    reg [2:0]  A;
    wire [7:0] Y;
 decoder_3to8 dut(
    .A(A),
    .Y(Y)
 );
    task check_case(
     input [2:0] a_in,
     input [7:0] expected_y
     );
        begin
         A = a_in;
         #10;
         if(Y !== expected_y)
         $fatal(1,"FAIL: A=%b Y=%b expected_y=%b",A,Y,expected_y);
         else
         $display("PASS: A=%b Y=%b",A,Y);
        end
    endtask
    initial begin
     $dumpfile("09_decoder_3to8/wave.vcd");
     $dumpvars(0,tb_decoder_3to8);
     check_case(3'b000,8'b00000001);
     check_case(3'b001,8'b00000010);
     check_case(3'b010,8'b00000100);
     check_case(3'b011,8'b00001000);
     check_case(3'b100,8'b00010000);
     check_case(3'b101,8'b00100000);
     check_case(3'b110,8'b01000000);
     check_case(3'b111,8'b10000000);
     $finish;
    end
endmodule
