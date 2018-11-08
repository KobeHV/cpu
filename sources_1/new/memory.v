`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 20:17:55
// Design Name: 
// Module Name: memory
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


module memory(start,op,alu_i,addr_i,write_o);
input [3:0]start;
input [5:0]op;
input [31:0]alu_i;
input [31:0]addr_i;
output reg [31:0]write_o;

reg [31:0]DatMem [255:0];

initial
begin
    $readmemh("data.dat", DatMem);
end
	
always@(posedge start[2])
begin
	case(op)
		6'b000000,
		6'b000001,
        6'b000010,
        6'b000011,
        6'b000100,
	    6'b000101:write_o <= alu_i;
		6'b010000:DatMem[addr_i] <= alu_i;//SW
		6'b010001:write_o <= DatMem[addr_i];//LW
		6'b100000,
		6'b100001:write_o <= addr_i;
	endcase
end

endmodule
