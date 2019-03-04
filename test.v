`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 19:08:30
// Design Name: 
// Module Name: test
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
module test();
reg [5:0] OP_CODE;
reg [5:0] FUNC;

wire [3:0] ALU_OP;
wire[`S_N:0] S;

Control CT(OP_CODE,FUNC,ALU_OP,S);
 initial
 begin
 OP_CODE = 6'b0;
 FUNC = 6'b0;
 #12 FUNC = 3;
 #12 FUNC = 2;
 #12 FUNC = 32;
 #12 FUNC = 33;
 #12 FUNC = 34;
 #12 FUNC = 36;
 #12 FUNC = 37;
 #12 FUNC = 39;
 #12 FUNC = 42;
 #12 FUNC = 43;
 #12 FUNC = 8;
 #12 FUNC = 12;
 #12 OP_CODE = 2;
 #12 OP_CODE = 3;
 #12 OP_CODE = 4;
 #12 OP_CODE = 5;
 #12 OP_CODE = 8;
 #12 OP_CODE = 12;
 #12 OP_CODE = 9;
 #12 OP_CODE = 10;
 #12 OP_CODE = 13;
 #12 OP_CODE = 35;
 #12 OP_CODE = 43;
 #100  $stop;
 end
  
 
endmodule
