`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:48:01 11/28/2018 
// Design Name: 
// Module Name:    Control_Unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Control_Unit(
	input [5:0] op, func,
	output RegDst, RegWrite, ALUSrc,
	output MemWrite, MemRead, MemtoReg,
	output Branch,
	output [2:0] ALU_op
    );
	 
	reg RegDst, RegWrite, ALUSrc, MemWrite, MemRead, MemtoReg, Branch;
	reg [2:0] ALU_op;
	 
	always @(op or func)
		case (op)
			6'b000000: 
				case (func)
					6'b100000: begin RegDst<=1; RegWrite<=1; ALUSrc<=0; MemWrite<=0; MemRead<=0; MemtoReg<=0; Branch<=0; ALU_op=3'b000; end
					6'b100010: begin RegDst<=1; RegWrite<=1; ALUSrc<=0; MemWrite<=0; MemRead<=0; MemtoReg<=0; Branch<=0; ALU_op=3'b100; end
					6'b100100: begin RegDst<=1; RegWrite<=1; ALUSrc<=0; MemWrite<=0; MemRead<=0; MemtoReg<=0; Branch<=0; ALU_op=3'b001; end
					6'b100101: begin RegDst<=1; RegWrite<=1; ALUSrc<=0; MemWrite<=0; MemRead<=0; MemtoReg<=0; Branch<=0; ALU_op=3'b101; end
					6'b100110: begin RegDst<=1; RegWrite<=1; ALUSrc<=0; MemWrite<=0; MemRead<=0; MemtoReg<=0; Branch<=0; ALU_op=3'b010; end
					default: begin RegDst<=1'bz; RegWrite<=1'bz; ALUSrc<=1'bz; MemWrite<=1'bz; MemRead<=1'bz; MemtoReg<=1'bz; Branch<=1'bz; ALU_op=3'bzzz; end
				endcase
			6'b100011: begin RegDst<=0; RegWrite<=1; ALUSrc<=1; MemWrite<=0; MemRead<=1; MemtoReg<=1; Branch<=0; ALU_op=3'b000; end
			6'b101011: begin RegDst<=1'bx; RegWrite<=0; ALUSrc<=1; MemWrite<=1; MemRead<=0; MemtoReg<=1'bx; Branch<=0; ALU_op=3'b000; end
			6'b000100: begin RegDst<=1'bx; RegWrite<=0; ALUSrc<=0; MemWrite<=0; MemRead<=0; MemtoReg<=1'bx; Branch<=1; ALU_op=3'b100; end
			6'b001111: begin RegDst<=0; RegWrite<=1; ALUSrc<=1; MemWrite<=0; MemRead<=0; MemtoReg<=0; Branch<=0; ALU_op=3'b110; end
			default: begin RegDst<=1'bz; RegWrite<=1'bz; ALUSrc<=1'bz; MemWrite<=1'bz; MemRead<=1'bz; MemtoReg<=1'bz; Branch<=1'bz; ALU_op=3'bzzz; end
		endcase

endmodule
