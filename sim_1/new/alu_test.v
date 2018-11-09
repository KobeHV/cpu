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
	
parameter rst_repiod = 100;
parameter reg_update_delay = 200; 
reg rst;
reg clk;

initial
begin
    clk = 0;
    rst = 0;
    #rst_repiod;
    rst = 1;   
end

always
begin
    #10 clk<=~clk;
end
wire [3:0]t;
clk clk_test(rst,clk,t);

wire [3:0]start;
assign start = t;
	
reg [31:0]ir_i;
reg [31:0]pc_i;
reg reg_update;
reg [31:0]reg_i;	
	
initial
begin
	ir_i = 32'h8400_0004;
	pc_i = 32'h0000_0002;
	reg_update=0;
	#reg_update_delay;
	reg_update=1;
	reg_i=32'h00000003;
end	
	
wire ife;
wire [5:0]op;
wire [31:0]alu_o;
wire [31:0]addr_o;
	
alu alu_test(start,ir_i,pc_i,ife,op,alu_o,addr_o,reg_update,reg_i);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
endmodule
