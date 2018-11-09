`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 16:49:06
// Design Name: 
// Module Name: alu
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


module alu(op,npc,A,B,Imm,ife,alu_o,addr_o);
input [5:0]op;
input [31:0]npc;
input [31:0]A;
input [31:0]B;
input [31:0]Imm;
output ife;
output [31:0]alu_o;
output [31:0]addr_o;

assign alu_o  =  op == 6'b000000 ? A + B:
				 op == 6'b000001 ? A - B:
				 op == 6'b000010 ? A & B:
				 op == 6'b000011 ? A | B:
				 op == 6'b000100 ? A ^ B:
				 op == 6'b000101 ? A < B:      //STL
				 op == 6'b010000 ? B:          //SW
				 0;
				 
assign addr_o =  op == 6'b010000 ? A + Imm:    //SW      
				 op == 6'b010001 ? A + Imm:    //LW
				 op == 6'b100000 ? (Imm<<2) + npc: //BEQ !!!!!!!!!!when << add ()!!!!!!!!!!
				 op == 6'b100001 ? (Imm<<2) + npc: //JMP
                 0;
				 
assign ife =  (op==6'b100000 && A==0) ? 1:0;//BEQ

endmodule
