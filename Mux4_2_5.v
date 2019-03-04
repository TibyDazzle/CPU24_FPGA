`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 20:22:58
// Design Name: 
// Module Name: Mux4_2_5
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


module Mux4_2_5(
    input wire[1:0] sel,
    input wire[4:0] n0,
    input wire[4:0] n1,
    input wire[4:0] n2,
    input wire[4:0] n3,
    output reg[4:0] num
    );
    always@(sel)begin
    case (sel)
    2'b00:num<=n0;
    2'b01:num<=n1;
    2'b10:num<=n2;
    2'b11:num<=n3;
    default:num<=0;
    endcase
    end
endmodule
