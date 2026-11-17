module Priority_Encoder_8to3(
    input wire [7:0] D,
    output reg [2:0] Y,
    output reg valid
 );
    always@(*) begin
     Y = 3'b000;
     valid = 1'b0;
     if(D[7]) begin
     Y = 3'b111;
     valid = 1'b1;
     end
     else if(D[6]) begin
     Y = 3'b110;
     valid = 1'b1;
     end
     else if(D[5]) begin
     Y = 3'b101;
     valid = 1'b1;
     end
     else if(D[4]) begin
     Y = 3'b100;
     valid = 1'b1;
     end
     else if(D[3]) begin
     Y = 3'b011;
     valid = 1'b1;
     end
     else if(D[2]) begin
     Y = 3'b010;
     valid = 1'b1;
     end
     else if(D[1]) begin
     Y = 3'b001;
     valid = 1'b1;
     end
     else if(D[0]) begin
     Y = 3'b000;
     valid = 1'b1;
     end
     else begin
     Y = 3'b000;
     valid = 1'b0;
     end
    end
endmodule
