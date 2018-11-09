`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/09 11:42:18
// Design Name: 
// Module Name: memory_test
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


module memory_test();

parameter rst_repiod = 100;
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

reg [5:0]op;
reg [31:0]alu_i;
reg [31:0]addr_i;

initial
begin
	op = 6'b10_0001;
	alu_i = 32'h0000_000a;
	addr_i = 32'h0000_4925;
end	

wire [31:0]write_o;

memory memory_test(start,op,alu_i,addr_i,write_o);

endmodule
