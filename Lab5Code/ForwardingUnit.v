/***************************************************
Student Name: 李懿麒 陳品戎
Student ID: 0816032 0816102
***************************************************/

module ForwardingUnit (
	EXE_instr19_15, // RS
	EXE_instr24_20, // RT
	MEM_instr11_7, // RD
	MEM_WBControl, 
	WB_instr11_7, // RD
	WB_Control, 
	src1_sel_o, 
	src2_sel_o
);

	input [5-1:0] EXE_instr19_15, EXE_instr24_20, MEM_instr11_7, WB_instr11_7;
	input [2-1:0] MEM_WBControl, WB_Control;
	output wire [2-1:0] src1_sel_o, src2_sel_o; // forwarding A, B

	wire MEM_Regwrite, Regwrite;
	reg [1:0] sel1_o_reg, sel2_o_reg;

	assign Regwrite = WB_Control[1];
	assign MEM_Regwrite = MEM_WBControl[1];

	assign src1_sel_o = sel1_o_reg;
	assign src2_sel_o = sel2_o_reg;

	always @(*) begin
		if ((MEM_Regwrite) && (~MEM_instr11_7)) begin
			if (MEM_instr11_7 == EXE_instr19_15)
				sel1_o_reg = 2'b10;
			else if (WB_instr11_7 == EXE_instr19_15)
				sel1_o_reg = 2'b01;
			else
				sel1_o_reg = 2'b00;

			if (MEM_instr11_7 == EXE_instr24_20)
				sel2_o_reg = 2'b10;
			else if (WB_instr11_7 == EXE_instr24_20)
				sel2_o_reg = 2'b01;
			else
				sel2_o_reg = 2'b00;
		end
		else begin
			sel1_o_reg = 2'b00;
			sel2_o_reg = 2'b00;
		end
		
	end

endmodule
 
