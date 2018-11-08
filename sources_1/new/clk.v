`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/07 21:32:16
// Design Name: 
// Module Name: clk
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


module clk(rst,clk,t);
input rst,clk;
output reg [3:0]t;

reg [3:0]temp;
always@(posedge clk)
begin
	if(!rst)
		begin
		t <= 0;
		temp <= 4'b0001;
		end
	else
		begin
		t <= temp;
			case(temp)
				4'b0000:temp<=4'b0001;
				4'b0001:temp<=4'b0010;
				4'b0010:temp<=4'b0100;
				4'b0100:temp<=4'b1000;
				4'b1000:temp<=4'b0001;
			endcase
		end
end		
endmodule
