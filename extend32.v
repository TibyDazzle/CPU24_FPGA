`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 19:15:21
// Design Name: 
// Module Name: extend32
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


module extend32(
	input wire signExt,
	input wire[15:0] num_16,
	output reg[31:0] num_32
    );
	wire[31:0] signNum;
	wire[31:0] unsignNum;
	assign signNum={{16{num_16[15]}},num_16};
	assign unsignNum={{16{1'b0}},num_16};
	always @(signExt or num_16) begin
		if (signExt==1) begin
			num_32<=signNum;
		end
		else begin
			num_32<=unsignNum;
		end
	end
endmodule
