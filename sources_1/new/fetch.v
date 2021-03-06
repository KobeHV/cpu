`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 12:49:48
// Design Name: 
// Module Name: fetch
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


module fetch(rst,clk,ir_o,npc,pc_update,pc_i);
input rst;
input clk;
input pc_update;
input [31:0]pc_i;
output reg [31:0]ir_o;
output reg [31:0]npc;

//把存储器模块整合到fetch模块里
reg [31:0]IntMem[255:0];
reg [31:0]PC;  

initial
begin
    PC = 0 ;
	//$readmemh("int.dat",IntMem);
	$readmemh("C:/1-Studies/Principles of Computer Composition/experiment/project/cpu/int.txt",IntMem);
end

//update PC
always@(negedge clk)
begin 	
	if(pc_update)
		begin
		  PC = pc_i;
		end
	else 
		begin
		  PC = PC + 1;
		end
end

always @(posedge clk)
begin 	
	if(rst) 
        PC = 0;

	ir_o = IntMem[PC];
	npc = PC + 1;
end

endmodule
