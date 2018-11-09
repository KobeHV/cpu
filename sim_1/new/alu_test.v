`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/09 10:41:27
// Design Name: 
// Module Name: alu_test
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


module alu_test();
	
reg clk;

initial
begin
    clk = 0; 
end

always
begin
    #10 clk<=~clk;
end
	
reg [5:0]op;
reg [31:0]npc;
reg [31:0]A;
reg [31:0]B;
reg [31:0]Imm;	
	
initial
begin
	op = 6'b00_0000;
	npc = 32'h0000_0002;
	A = 32'h0000_0001;
	B = 32'h0000_0002;
	Imm = 32'h0000_0003;
end	
	
wire ife;
wire [31:0]alu_o;
wire [31:0]addr_o;
	
alu alu_test(op,npc,A,B,Imm,ife,alu_o,addr_o);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
endmodule
