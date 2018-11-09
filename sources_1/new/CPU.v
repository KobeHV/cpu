`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/09 14:48:04
// Design Name: 
// Module Name: CPU
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


module CPU(rst,clk);

input rst;
input clk;

//clk module
wire [3:0]t;
clk Clock(rst,clk,t);

//fetch module
wire pc_update;
wire [31:0]pc_new;

wire [31:0]ir_o;
wire [31:0]npc;
fetch Fetch(t,ir_o,npc,pc_update,pc_new);

//alu module
wire reg_update;
wire[31:0]reg_new;

wire ife;
wire [5:0]op;
wire [31:0]alu_o;
wire [31:0]addr_o;
alu Alu(t,ir_o,npc,ife,op,alu_o,addr_o,reg_update,reg_new);

//memory module
wire [31:0]write_o;
memory Memory(t,op,alu_o,addr_o,write_o);

//write module
write Write(t,ife,op,write_o,reg_update,reg_new,pc_update,pc_new);

endmodule
