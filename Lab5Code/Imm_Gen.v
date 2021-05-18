/***************************************************
Student Name: 李懿麒 陳品戎 (Lab5)
Student ID: 0816032 0816102
***************************************************/

`timescale 1ns/1ps

module Imm_Gen(
	input  [31:0] instr_i,
	output [31:0] Imm_Gen_o
);

	/* Write your code HERE */
	// Internal Signals
    wire    [7-1:0] opcode;
    wire    [2:0]   func3;
    wire    [3-1:0] Instr_field;
    reg [31:0] Imm_Gen_o_reg;

    assign opcode = instr_i[6:0];
    assign func3  = instr_i[14:12];

    assign Imm_Gen_o = Imm_Gen_o_reg;

    always @(*) begin
        case (opcode)
            7'b0010011, 7'b0000011, 7'b1100111: begin : Itype // I, LW, JALR
                Imm_Gen_o_reg = { {21{instr_i[31]}}, instr_i[30:20] };
            end
            7'b0100011: begin : Stype
                Imm_Gen_o_reg = { {21{instr_i[31]}}, instr_i[30:25], instr_i[11:7] };
            end
            7'b1100011: begin : Btype
                Imm_Gen_o_reg = { {20{instr_i[31]}}, instr_i[7], instr_i[30:25], instr_i[11:8], 1'b0 };
            end
            7'b1101111: begin : Jtype
                Imm_Gen_o_reg = { {12{instr_i[31]}}, instr_i[19:12], instr_i[20], instr_i[30:21], 1'b0 };
            end
            default: Imm_Gen_o_reg = 0;
        endcase // opcode
    end
	
endmodule