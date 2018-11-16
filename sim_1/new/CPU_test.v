`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/09 15:08:26
// Design Name: 
// Module Name: CPU_test
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


module CPU_test();

parameter rst_repiod = 100; 
reg rst;
reg clk;

initial
begin
    clk = 0;
    rst = 1;
    #rst_repiod;
    rst = 0;   
end

always
begin
    #10 clk<=~clk;
end

CPU CPU_test(rst,clk);

endmodule
