/***************************************************
Student Name: 李懿麒 陳品戎
Student ID: 0816032 0816102
***************************************************/
`timescale 1ns/1ps

module alu(
	input                   rst_n,         // negative reset            (input)
	input	     [32-1:0]	src1,          // 32 bits source 1          (input)
	input	     [32-1:0]	src2,          // 32 bits source 2          (input)
	input 	     [ 4-1:0] 	ALU_control,   // 4 bits ALU control input  (input)
	output reg   [32-1:0]	result,        // 32 bits result            (output)
	output reg              zero,          // 1 bit when the output is 0, zero must be set (output)
	output reg              cout,          // 1 bit carry out           (output)
	output reg              overflow       // 1 bit overflow            (output)
);

/* Write your code HERE */
	always @(negedge rst_n) begin
		if (~rst_n) begin
			result <= 0;
			zero <= 0;
			cout <= 0;
			overflow <= 0;
		end
	end

	reg signed [32-1:0] a, b, c;

	always @(*) begin
		a = src1;
		b = src2;
		cout = 0;
		case (ALU_control)
			4'b0000: begin // And
				result = a & b;
			end
			4'b0001: begin // Or
				result = a | b;
			end
			4'b0010: begin // Add
				{cout, result} = 33'b0 + a + b;
			end
			4'b0110: begin // Sub
				{cout, result} =33'b0 + a + (~b) + 1;
			end
			4'b0111: begin // Set Less Than
				result[0] = (a < b);
				result[31:1] = 0;
			end
			default: begin
				result = result;
			end
		endcase
		zero = ~(|result);
	end

endmodule
