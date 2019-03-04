`timescale 1ns / 1ps
`include "define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 16:17:14
// Design Name: 
// Module Name: regfile
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


module regfile(
	input wire clk,


	input wire we,
	input wire[`RegAddrBus] waddr,
	input wire[`RegBus] wdata,

	//input wire re1,
	input wire[`RegAddrBus] raddr1,
	output reg[`RegBus] rdata1,

	//input wire re2,
	input wire[`RegAddrBus] raddr2,
	output reg[`RegBus] rdata2
    );


    reg[`RegBus] regs[0:`RegNum-1];


    always @ (posedge clk) begin
    	if((we == `WriteEnable)&&(waddr != `Regnumlog2'h0)) begin
    		regs[waddr]<=wdata;
    	end
    end


    always @ (*) begin
    	if(raddr1 == `Regnumlog2'h0) begin
    		rdata1<=`ZeroWord;
    	end else if((raddr1 == waddr)&&(we == `WriteEnable))begin
    		rdata1<= wdata;
    	end else begin
    		rdata1<=regs[raddr1];
    	end
    end



    always @ (*) begin
    	if(raddr2 == `Regnumlog2'h0) begin
    		rdata2<=`ZeroWord;
    	end else if((raddr2 == waddr)&&(we == `WriteEnable))begin
    		rdata2<= wdata;
    	end else begin
    		rdata2<=regs[raddr2];
    	end
    end


endmodule
