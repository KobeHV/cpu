`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 16:17:05
// Design Name: 
// Module Name: fetch_test
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


module fetch_test();
parameter rst_repiod = 100; 
parameter pc_update_delay = 200; 
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

reg pc_update;
reg [31:0]pc_i;

initial
begin
	pc_update=0;
	#pc_update_delay;
	 pc_update=1;
	pc_i=32'hbfffffff;
end

wire [31:0]ir_o;
wire [31:0]npc;
fetch fetch_test(start,ir_o,npc,pc_update,pc_i);

endmodule
