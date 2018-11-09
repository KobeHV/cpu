`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/09 17:33:26
// Design Name: 
// Module Name: decode_test
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


module decode_test();
parameter reg_update_delay = 200; 
reg clk;

initial
begin
    clk = 0; 
end

always
begin
    #10 clk<=~clk;
end

reg [31:0]ir_i;
reg reg_update;
reg [31:0]reg_i;

initial
begin
	ir_i = 32'b0000_0800;
	reg_update=0;
	#reg_update_delay;
	reg_update=1;
	reg_i=32'h00000004;
end

wire [5:0]op;
wire [31:0]A;
wire [31:0]B;
wire [31:0]Imm;

decode Decode(clk,ir_i,op,A,B,Imm,reg_update,reg_i);

endmodule
