module tb_mux2;
    reg a;
    reg b;
    reg sel;
    wire y;
    mux2 dut(
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );
    task check_data;
        input expected;
        begin
            if(y !== expected)
            $fatal(1,"FAIL: expected=%b,actual=%b",expected,y);
            else
            $display("PASS");
        end
    endtask
    initial begin
        a = 0;
        b = 0;
        sel = 0;
        #1 check_data(1'b0);
        #9;
        a = 0;
        b = 0;
        sel = 1;
        #1 check_data(1'b0);
        #9;
        a = 0;
        b = 1;
        sel = 0;
        #1 check_data(1'b0);
        #9;
        a = 0;
        b = 1;
        sel = 1;
        #1 check_data(1'b1);
        #9;
        a = 1;
        b = 0;
        sel = 0;
        #1 check_data(1'b1);
        #9;
        a = 1;
        b = 0;
        sel = 1;
        #1 check_data(1'b0);
        #9; 
        a = 1;
        b = 1;
        sel = 0;
        #1 check_data(1'b1);
        #9; 
        a = 1;
        b = 1;
        sel = 1;
        #1 check_data(1'b1);
        #9;
        $finish;         
    end
endmodule