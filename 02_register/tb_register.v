`timescale 1ns/1ps
module tb_register;
    reg clk;
    reg reset;
    reg [3:0] data_in;
    wire [3:0] data_out;

    register dut(
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .data_out(data_out)
    );

 task check_data;
     input [3:0] expected;
     begin
         if(data_out !== expected)
         $fatal(1,"FAIL: expected=%b,actual=%b",expected,data_out);
         else
         $display("PASS: expected=%b",expected);
     end
 endtask
 initial clk = 0;  

 always #5 clk = ~clk;

 initial begin
     reset = 1;
     data_in = 4'b1010;
     #6 check_data(4'b0000);
     #6 reset = 0;
     #10 data_in = 4'b0101;
     check_data(4'b1010);
     #10 data_in = 4'b1111;
     check_data(4'b0101);
     #4;
     check_data(4'b1111);
     #6;
     $display("Finish reached at t=%0t", $time);
     $finish;
   end
endmodule