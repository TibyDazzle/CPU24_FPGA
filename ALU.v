`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 15:20:47
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(input reg [31:0]X, input reg [31:0]Y, input reg [3:0]AluOP, input reg [4:0]shamt
, output reg [31:0]Result, output reg [31:0]Result2, output wire Equal );

assign Equal = (X == Y);
always@(*)
begin
case(AluOP)
    4'b0000: begin Result = Y << shamt; Result2 = 0; end
    4'b0001: begin Result = Y >>> shamt; Result2 = 0; end
    4'b0010: begin Result = Y >> shamt; Result2 = 0; end
    4'b0011: begin {Result2, Result} = X * Y; end
    4'b0100: begin Result = (X / Y); Result2 = (X - (Y * Result)); end
    4'b0101: begin Result = (X + Y); Result2 = 0; end
    4'b0110: begin Result = (X - Y); Result2 = 0; end
    4'b0111: begin Result = (X & Y); Result2 = 0; end
    4'b1000: begin Result = (X | Y); Result2 = 0; end
    4'b1001: begin Result = (X ^ Y); Result2 = 0; end
    4'b1010: begin Result = ~(X | Y); Result2 = 0; end
    4'b1011: begin Result = ($signed(X) <$signed(Y)); Result2 = 0; end
    4'b1100: begin Result = ($unsigned(X) < $unsigned(Y)); Result2 = 0; end
    default: begin Result = 0; Result2 = 0; end
endcase
end
endmodule