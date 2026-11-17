module tb_encoder_8to3;
 reg  [7:0] D;
 wire [2:0] Y;
 encoder_8to3 dut(
    .D(D),
    .Y(Y)
 );
    task check_case(
        input [7:0] d_in,
        input [2:0] expected_y
     );
        begin
            D = d_in;
            #10;
            if(Y !== expected_y)
            $fatal(1,"D=%b,Y=%b,expected_y=%b",D,Y,expected_y);
            else
            $display("PASS: D=%b Y=%b",D,Y);
        end
    endtask
    initial begin
     $dumpfile("10_encoder_8to3/wave.vcd");
     $dumpvars(0,tb_encoder_8to3);
     check_case(8'b00000000,3'b000);
     check_case(8'b00000001,3'b000);
     check_case(8'b00000010,3'b001);
     check_case(8'b00000100,3'b010);
     check_case(8'b00001000,3'b011);
     check_case(8'b00010000,3'b100);
     check_case(8'b00100000,3'b101);
     check_case(8'b01000000,3'b110);
     check_case(8'b10000000,3'b111);
     $finish;
    end
endmodule
