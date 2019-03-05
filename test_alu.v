`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 08:26:00
// Design Name: 
// Module Name: test_alu
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
module test_alu();
reg [31:0]tx;
reg [31:0]ty;
reg [3:0]taluop;
reg [4:0]tshamt;

wire [31:0]tresult;
wire [31:0]tresult2;
wire tequal;

initial begin
    tx = 32'h05010301;
    ty = 32'h52405760;
    taluop = 4'b0000;
    tshamt = 5'b00000;
end

always@(*)
begin
    #10 taluop = (taluop + 4'b0001);
    #10 tshamt = (tshamt + 5'b00001);
end

ALU alu_t(tx, ty, taluop, tshamt, tresult, tresult2, tequal);

endmodule
