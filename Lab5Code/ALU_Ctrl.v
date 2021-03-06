/***************************************************
Student Name: 李懿麒 陳品戎 (Lab5)
Student ID: 0816032 0816102
***************************************************/

`timescale 1ns/1ps

module ALU_Ctrl(
	input		[4-1:0]	instr,
	input		[2-1:0]	ALUOp,
	output wire	[4-1:0] ALU_Ctrl_o
);
	
	/* Write your code HERE */
	wire [2:0] func3;
 	assign func3 = instr[2:0]; // instr[14:12]

 	reg [3:0] ALU_Ctrl_o_reg;
 	assign ALU_Ctrl_o = ALU_Ctrl_o_reg;

	always @(*)
	begin
		case (ALUOp)
			2'b00: ALU_Ctrl_o_reg = 4'b0010; // lw, sw -> add
			2'b01: ALU_Ctrl_o_reg = 4'b0110; // beq -> sub
			2'b10: begin/*-----------R-type-----------*/
				case (instr)
					4'b0000: ALU_Ctrl_o_reg = 4'b0010; // add
					4'b1000: ALU_Ctrl_o_reg = 4'b0110; // sub
					4'b0111: ALU_Ctrl_o_reg = 4'b0000; // and
					4'b0110: ALU_Ctrl_o_reg = 4'b0001; // or
					4'b0100: ALU_Ctrl_o_reg = 4'b0011; // xor
					4'b0010: ALU_Ctrl_o_reg = 4'b0111; // slt
					4'b0001: ALU_Ctrl_o_reg = 4'b0100; // sll
					default: ALU_Ctrl_o_reg = 4'b0000;
				endcase
			end
			2'b11: begin/*-----------I-type-----------*/
				case (func3)
					3'b000: ALU_Ctrl_o_reg = 4'b0010; // addi
					3'b111: ALU_Ctrl_o_reg = 4'b0000; // andi
					3'b110: ALU_Ctrl_o_reg = 4'b0001; // ori
					3'b100: ALU_Ctrl_o_reg = 4'b0011; // xori
					3'b010: ALU_Ctrl_o_reg = 4'b0111; // slti
					3'b001: ALU_Ctrl_o_reg = 4'b0100; // slli
					default: ALU_Ctrl_o_reg = 4'b0000;
				endcase
			end
			default: ALU_Ctrl_o_reg = 4'b1111;
		endcase
	end

endmodule