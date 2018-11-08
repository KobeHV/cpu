`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 16:49:06
// Design Name: 
// Module Name: alu
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


module alu(start,ir_i,pc_i,ife,op,alu_o,addr_o,reg_update,reg_i);
input [3:0]start;
input [31:0]ir_i;
input [31:0]pc_i;
input reg_i;
input [31:0]reg_update;
output reg ife;
output [5:0]op;
output reg [31:0]alu_o;
output reg [31:0]addr_o;

// 32
reg [31:0]Regs [31:0];
initial
begin
    Regs[0] = 0;
    Regs[1] = 1;
    Regs[2] = 2;
end

wire [4:0]Ri;
wire [4:0]Rj;
wire [4:0]Rk;
wire [5:0]op;
wire [31:0]A;
wire [31:0]B;
wire [31:0]Imm;
assign Ri = ir_i[25:21];
assign Rj = ir_i[20:16];
assign Rk = ir_i[15:11];

assign op = ir_i[31:26];

assign A =  op == 6'b100001 ? 0:
			op == 6'b100000 ? Regs[Ri] ^ Regs[Rj]:
			Regs[Rj];
assign B =  (op[5:4] == 2'b00) ? Regs[Rk] : Regs[Ri];
assign Imm = op == 6'b100001 ? ir_i[25:0] : ir_i[15:0];

always @(negedge start[3])
begin 	
	if(reg_update)
		begin
		  Regs[Ri] <= reg_i;
		end
end

always@(posedge start[1])
begin
	case(op)
		6'b000000:alu_o <= A + B;
		6'b000001:alu_o <= A - B;
		6'b000010:alu_o <= A & B;
		6'b000011:alu_o <= A | B;
		6'b000100:alu_o <= A ^ B;
		6'b000101:alu_o <= A < B ? 1:0;//STL
		6'b010000:addr_o <= A + Imm;//SW
		6'b010001:addr_o <= A + Imm;//LW
		6'b100000:addr_o <= pc_i+ Imm<<2;//BEQ
		6'b100001:addr_o <= pc_i+Imm<<2;//JMP
	endcase
	if(op==6'b010000)//SW
	begin
	   ife <= A==0 ? 1:0;
	   alu_o <= B;
	end
end

endmodule
