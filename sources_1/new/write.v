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


module write(start,ife,op,write_i,reg_update,reg_new,pc_update,pc_new);
input [3:0]start;
input ife;
input [5:0]op;
input [31:0]write_i;
output reg reg_update;
output reg [31:0]reg_new;
output reg pc_update;
output reg [31:0]pc_new;

reg [1:0]op_high;
always @(start[3])
begin 
    op_high = op[5:4];     
	if(op_high==2'b00 || op_high==2'b01)
		begin
			reg_update <= 1;
			reg_new <= write_i;
			
			pc_update <= 0;
		end
	else if((op_high==2'b10 && ife) || op_high==2'b11)
		begin
			pc_update <= 1;
			pc_new <= write_i;
			
			reg_update <= 0;
		end
    else
		begin
		    reg_update <= 0;
			pc_update <= 0;
		end

end













endmodule
