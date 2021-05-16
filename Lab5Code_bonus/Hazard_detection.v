/***************************************************
Student Name: 李懿麒 陳品戎
Student ID: 0816032 0816102
***************************************************/

module Hazard_detection(
	input [4:0] IFID_regRs, 
	input [4:0] IFID_regRt, 
	input [4:0] IDEXE_regRd, 
	input IDEXE_memRead, 
	output PC_write, 
	output IFID_write, 
	output control_output_select
);
	
	reg PCW_reg, IFIDW_reg, COS_reg;
	assign PC_write = PCW_reg;
	assign IFID_write = IFIDW_reg;
	assign control_output_select = COS_reg;

	always @(*) begin
		if (IDEXE_memRead && (IDEXE_regRd == IFID_regRs || IDEXE_regRd == IFID_regRt)) begin
			PCW_reg = 0;
			IFIDW_reg = 0;
			COS_reg = 1;
		end else begin
			PCW_reg = 1;
			IFIDW_reg = 1;
			COS_reg = 0;
		end
	end

endmodule

