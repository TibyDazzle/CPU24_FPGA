`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 17:44:41
// Design Name: 
// Module Name: Control
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
`define S_N 11

module Control(
input [5:0]OP,
input [5:0]F,
output reg [3:0] ALU_OP,
output reg [11:0] SG 
);
wire SLL,SRA,SRL,ADD,ADDU,SUB,AND,OR,NOR,SLT,SLTU,JR,SYSCALL,J,JAL,BEQ,BNE,ADDI,ANDI,ADDIU,SLTI,ORI,LW,SW;
assign SLL = (~OP[5]) & (~OP[4]) & (~OP[3]) & (~OP[2]) & (~OP[1]) & (~OP[0]) & (~F[5]) & (~F[4]) & (~F[3]) & (~F[2]) & (~F[1]) & (~F[0]) ; 
assign SRA =(~OP[5]) & (~OP[4]) & (~OP[3]) & (~OP[2]) & (~OP[1]) & (~OP[0]) & (~F[5]) & (~F[4]) & (~F[3]) & (~F[2]) &  F[1] & F[0] ;
assign SRL =(~OP[5]) & (~OP[4]) & (~OP[3]) & (~OP[2]) & (~OP[1]) & (~OP[0]) & (~F[5]) & (~F[4]) & (~F[3]) & (~F[2]) &  F[1] & (~F[0]) ;
assign ADD =(~OP[5]) & (~OP[4]) & (~OP[3]) & (~OP[2]) & (~OP[1]) & (~OP[0]) &  F[5] & (~F[4]) & (~F[3]) & (~F[2]) & (~F[1]) & (~F[0]) ;  
assign ADDU =(~OP[5]) & (~OP[4]) & (~OP[3]) & (~OP[2]) & (~OP[1]) & (~OP[0]) &  F[5] & (~F[4]) & (~F[3]) & (~F[2]) & (~F[1]) &  F[0] ;
assign SUB =(~OP[5]) & (~OP[4]) & (~OP[3]) & (~OP[2]) & (~OP[1]) & (~OP[0]) &  F[5] & (~F[4]) & (~F[3]) & (~F[2]) &  F[1] & (~F[0]) ;
assign AND =(~OP[5]) & (~OP[4]) & (~OP[3]) & (~OP[2]) & (~OP[1]) & (~OP[0]) &  F[5] & (~F[4]) & (~F[3]) &  F[2] & (~F[1]) & (~F[0]) ;
assign OR =(~OP[5]) & (~OP[4]) & (~OP[3]) & (~OP[2]) & (~OP[1]) & (~OP[0]) &  F[5] & (~F[4]) & (~F[3]) &  F[2] & (~F[1]) &  F[0] ;
assign NOR =(~OP[5]) & (~OP[4]) & (~OP[3]) & (~OP[2]) & (~OP[1]) & (~OP[0]) &  F[5] & (~F[4]) & (~F[3]) &  F[2] &  F[1] &  F[0] ;
assign SLT =(~OP[5]) & (~OP[4]) & (~OP[3]) & (~OP[2]) & (~OP[1]) & (~OP[0]) &  F[5] & (~F[4]) &  F[3] & (~F[2]) &  F[1] & (~F[0])  ;
assign SLTU =(~OP[5]) & (~OP[4]) & (~OP[3]) & (~OP[2]) & (~OP[1]) & (~OP[0]) &  F[5] & (~F[4]) &  F[3] & (~F[2]) &  F[1] & F[0] ;
assign JR =(~OP[5]) & (~OP[4]) & (~OP[3]) & (~OP[2]) & (~OP[1]) & (~OP[0]) & (~F[5]) & (~F[4]) &  F[3] & (~F[2]) & (~F[1]) & (~F[0])  ;
assign SYSCALL =(~OP[5]) & (~OP[4]) & (~OP[3]) & (~OP[2]) & (~OP[1]) & (~OP[0]) & (~F[5]) & (~F[4]) &  F[3] &  F[2] & (~F[1]) & (~F[0]) ;
assign J =(~OP[5]) & (~OP[4]) & (~OP[3]) & (~OP[2]) &  OP[1] & (~OP[0]) ;
assign JAL =(~OP[5]) & (~OP[4]) & (~OP[3]) & (~OP[2]) &  OP[1] & OP[0] ;
assign BEQ =(~OP[5]) & (~OP[4]) & (~OP[3]) &  OP[2] & (~OP[1]) & (~OP[0]) ; 
assign BNE =(~OP[5]) & (~OP[4]) & (~OP[3]) &  OP[2] & (~OP[1]) &  OP[0] ;
assign ADDI =(~OP[5]) & (~OP[4]) &  OP[3] & (~OP[2]) & (~OP[1]) & (~OP[0]) ; 
assign ANDI =(~OP[5]) & (~OP[4]) &  OP[3] & OP[2] & (~OP[1]) & (~OP[0]) ; 
assign ADDIU =(~OP[5]) & (~OP[4]) &  OP[3] & (~OP[2]) & (~OP[1]) &  OP[0] ;
assign SLTI =(~OP[5]) & (~OP[4]) &  OP[3] & (~OP[2]) &  OP[1] & (~OP[0]) ; 
assign ORI =(~OP[5]) & (~OP[4]) &  OP[3] & OP[2] &  (~OP[1]) &  OP[0] ;
assign LW = OP[5] & (~OP[4]) & (~OP[3]) & (~OP[2]) &  OP[1] & OP[0] ;
assign SW = OP[5] & (~OP[4]) &  OP[3] & (~OP[2]) &  OP[1] &  OP[0] ;

always@(*)
begin
ALU_OP[3] = OR | NOR | SLT | SLTU | SLTI | ORI;
ALU_OP[2] = ADD | ADDU | SUB | AND | SLTU | ADDI |ANDI | ADDIU | LW | SW;
ALU_OP[1] = SRL | SUB | AND | NOR | SLT | ANDI | SLTI;
ALU_OP[0] = SRA | ADD | ADDU | AND | SLT | ADDI | ANDI | ADDIU | SLTI | LW | SW;
//MemtoR
SG[0]= LW;
//MemWrtie
SG[1]= SW;
//ALU_SRC
SG[2]= ADDI | ANDI | ADDIU | SLTI | ORI | LW | SW;
//RegWrite
SG[3]= SLL| SRA| SRL| ADD| ADDU| SUB| AND| OR| NOR| SLT| SLTU| JAL| ADDI| ANDI| ADDIU| SLTI| ORI| LW;
//SYSCALL
SG[4]= SYSCALL;
//SignedEx
SG[5]= ADDI| ADDIU | SLTI | LW | SW;
//RegDst
SG[6] = SLL| SRA| SRL| ADD| ADDU| SUB| AND| OR| NOR| SLT| SLTU| JR;
//BEQ
SG[7]= BEQ;
//BNE
SG[8]= BNE;
//JR
SG[9]= JR;
//JMP
SG[10]= JR | J | JAL;
//JAL
SG[11]= JAL;
end

endmodule
