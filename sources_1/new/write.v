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
always @(posedge start[3])
begin     
	if(op[5:4]==2'b00 || op==6'b010001)
		begin
			reg_update <= 1;
			reg_new <= write_i;
			
			pc_update <= 0;
		end
	else if((op==6'b100000 && ife) || op==6'b10_0001)
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
