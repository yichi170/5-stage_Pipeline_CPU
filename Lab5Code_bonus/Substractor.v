/***************************************************
Student Name: 李懿麒 陳品戎
Student ID: 0816032 0816102
***************************************************/
`timescale 1ns/1ps

module Substractor(
	input                   rst_n,         // negative reset            (input)
	input	     [32-1:0]	src1,          // 32 bits source 1          (input)
	input	     [32-1:0]	src2,          // 32 bits source 2          (input)
	output reg              zero           // 1 bit when the output is 0, zero must be set (output)
);

	/* Write your code HERE */
	always @(negedge rst_n) begin
		if (~rst_n) begin
			zero <= 0;
		end
	end

	reg   [32-1:0]	result;
	reg signed [32-1:0] a, b;

	always @(*) begin
		a = src1;
		b = src2;
		result = a - b;
		zero = ~(|result);
	end

endmodule
