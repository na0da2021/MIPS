module MIPS(input  clk, reset,
				output [15:0] test_value);
				
wire        jump, memwrite, regwrite, redest, alusrc, memtoreg, branch, pcsrc, z_flag;
wire [4:0]  writereg;	
wire [2:0]  alu_ctrl;
wire [31:0] alu_result, pr_c, inst, readdata, signimm, scr_B, r_d1, r_d2, result;	
		
ctrl_unit      m1  (inst[31:26], inst[5:0], jump, memwrite, regwrite, redest, alusrc, memtoreg, branch, alu_ctrl);				
mux2_1 #(4)    m2  (inst[20:16], inst[15:11], redest, writereg);
Register_file  m3  (inst[25:21], inst[20:16], writereg, result, regwrite,  clk, r_d1, r_d2);
sign_extend    m4  (inst[15:0], signimm);
mux2_1 #(31)   m5  (r_d2, signimm, alusrc, scr_B);
Alu            m6  (r_d1, scr_B, alu_ctrl, alu_result, z_flag );
data_mem       m7  (alu_result, r_d2, clk, memwrite, readdata, test_value);
mux2_1 #(31)   m8  (alu_result, readdata, memtoreg, result);
assign pcsrc = z_flag & branch;
pc             m9 (inst, clk, reset, jump, pcsrc, pr_c);
inst_mem       m10 (pr_c, inst);

endmodule