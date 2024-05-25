module ctrl_unit_TB;

reg  [5:0] op_code, funct;
wire jump, memwrite, regwrite, redest, alusrc, memtoreg, branch;
wire [2:0] alu_ctrl;

ctrl_unit b (op_code, funct, jump, memwrite, regwrite, redest, alusrc, memtoreg, branch, alu_ctrl);

initial begin 
$monitor("time=%t| op_code = %b | funct = %b | jump = %b| memwrite = %b| regwrite = %b | redest= %b| alusrc= %b| memtoreg= %b| branch = %b| alu_ctrl = %b",$time, op_code, funct, jump, memwrite, regwrite, redest, alusrc, memtoreg, branch, alu_ctrl);

 op_code = 6'b100011;
 funct   = 6'b011100;
 #20
 
 op_code = 6'b000000;
 funct   = 6'b011100;
 
end

initial #2000 $finish;

endmodule