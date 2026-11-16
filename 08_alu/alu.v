module alu(
    input wire [3:0] A,
    input wire [3:0] B,
    input wire [2:0] ALU_Sel,
    output reg [3:0] Result,
    output reg Carry,
    output reg Borrow
 );

 always@(*)begin
     Result = 4'b0000;
     Carry  = 1'b0;
     Borrow = 1'b0;
        case(ALU_Sel)
         3'b000:begin
         {Carry, Result} = {1'b0, A} + {1'b0,B};
         end
         3'b001:begin
         {Borrow, Result} = {1'b0, A} - {1'b0, B};
         end
         3'b010:begin
         Result = A & B;
         end
         3'b011:begin
         Result = A | B;
         end
         3'b100:begin
         Result = A ^ B;
         end
         default:begin
         Result = 4'b0000;
         Carry  = 1'b0;
         Borrow = 1'b0;
         end
        endcase
   end
endmodule
