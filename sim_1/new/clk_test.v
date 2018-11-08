`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 09:55:44
// Design Name: 
// Module Name: clk_test
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


module clk_test();
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
endmodule
