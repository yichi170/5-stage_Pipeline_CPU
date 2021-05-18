/***************************************************
Student Name: 李懿麒 陳品戎 (Lab5)
Student ID: 0816032 0816102
***************************************************/

module ForwardingUnit (
	input [5-1:0] EXE_instr19_15, 
	input [5-1:0] EXE_instr24_20, 
	input [5-1:0] MEM_instr11_7, 
	input [3-1:0] MEM_WBControl, 
	input [5-1:0] WB_instr11_7, 
	input [3-1:0] WB_Control, 
	output wire [2-1:0] src1_sel_o, 
	output wire [2-1:0] src2_sel_o
);
	
	wire MEM_Regwrite, Regwrite;
	reg [1:0] sel1_o_reg, sel2_o_reg;

	assign Regwrite = WB_Control[2];
	assign MEM_Regwrite = MEM_WBControl[2];

	assign src1_sel_o = sel1_o_reg;
	assign src2_sel_o = sel2_o_reg;

	always @(*) begin
		if ((MEM_Regwrite) && (MEM_instr11_7 != 0) && (MEM_instr11_7 == EXE_instr19_15)) begin
			sel1_o_reg = 2'b10;
		end else if ((Regwrite) && (WB_instr11_7 != 0) && (WB_instr11_7 == EXE_instr19_15)) begin
			sel1_o_reg = 2'b01;
		end else begin
			sel1_o_reg = 2'b00;
		end
	end
	always @(*) begin
		if ((MEM_Regwrite) && (MEM_instr11_7 != 0) && (MEM_instr11_7 == EXE_instr24_20)) begin
			sel2_o_reg = 2'b10;
		end
		else if ((Regwrite) && (WB_instr11_7 != 0) && (WB_instr11_7 == EXE_instr24_20)) begin
			sel2_o_reg = 2'b01;
		end
		else begin
			sel2_o_reg = 2'b00;
		end
	end
	

endmodule
 
