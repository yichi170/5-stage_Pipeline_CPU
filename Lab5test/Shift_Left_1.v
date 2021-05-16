/***************************************************
Student Name: 李懿麒 陳品戎
Student ID: 0816032 0816102
***************************************************/

`timescale 1ns/1ps

module Shift_Left_1(
    input  		[32-1:0] data_i,
    output wire [32-1:0] data_o
);
	
	assign data_o = data_i << 1;

endmodule