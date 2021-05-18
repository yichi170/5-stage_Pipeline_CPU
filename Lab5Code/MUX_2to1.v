/***************************************************
Student Name: 李懿麒 陳品戎 (Lab5)
Student ID: 0816032 0816102
***************************************************/

`timescale 1ns/1ps

module MUX_2to1(
	input   	[32-1:0] data0_i, 
	input   	[32-1:0] data1_i, 
	input       	     select_i, 
	output wire [32-1:0] data_o
);

	assign data_o = (select_i == 0) ? data0_i : data1_i;

endmodule
