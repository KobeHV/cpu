`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 21:10:22
// Design Name: 
// Module Name: write
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


module write(ife,op,write_i,reg_update,reg_new,pc_update,pc_new);
input ife;
input [5:0]op;
input [31:0]write_i;
output  reg_update;
output  [31:0]reg_new;
output  pc_update;
output  [31:0]pc_new;
 
assign reg_update =  (op[5:4]==2'b00 || op==6'b010001) ? 1:0;
assign reg_new = (op[5:4]==2'b00 || op==6'b010001) ? write_i:0;
assign pc_update = ((op==6'b100000 && ife) || op==6'b10_0001) ? 1:0;
assign pc_new = ((op==6'b100000 && ife) || op==6'b10_0001) ? write_i:0;

endmodule
