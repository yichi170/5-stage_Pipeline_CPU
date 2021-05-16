/***************************************************
Student Name: 李懿麒 陳品戎
Student ID: 0816032 0816102
***************************************************/

module IF_register (
	input clk_i, 
	input rst_i, 
	input [31:0] address_i, 
	input [31:0] instr_i, 
	input [31:0] pc_add4_i, 
	output reg [31:0] address_o, 
	output reg [31:0] instr_o, 
	output reg [31:0] pc_add4_o
);

	always @(posedge clk_i) begin
		if(~rst_i) begin
			address_o <= 0;
			instr_o <= 0;
			pc_add4_o <= 0;
		end else begin
			address_o <= address_i;
			instr_o <= instr_i;
			pc_add4_o <= pc_add4_i;
		end
	end


endmodule
