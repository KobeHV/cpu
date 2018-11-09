`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/09 14:12:16
// Design Name: 
// Module Name: write_test
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


module write_test();

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
	
reg ife;
reg [5:0]op;
reg [31:0]write_i;	

initial
begin
	ife = 0;
	op = 6'b10_0001;
	write_i = 32'h2343_9870;
end	

wire reg_update;
wire [31:0]reg_new;
wire pc_update;
wire [31:0]pc_new;

write write_test(start,ife,op,write_i,reg_update,reg_new,pc_update,pc_new);

endmodule
