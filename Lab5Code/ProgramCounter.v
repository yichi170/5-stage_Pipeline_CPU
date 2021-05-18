/***************************************************
Student Name: 李懿麒 陳品戎 (Lab5)
Student ID: 0816032 0816102
***************************************************/

`timescale 1ns/1ps

module ProgramCounter(
    input				clk_i,
	input 				rst_i,
	input 				PCWrite,
	input	   [32-1:0] pc_i,
	output reg [32-1:0] pc_o
	);
 
//Main function
always @(posedge clk_i) begin
		if (~rst_i)
			pc_o <= 0;
		else if (PCWrite)
			pc_o <= pc_i;
	end

endmodule



                    
                    