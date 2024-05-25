module ctrl_unit (input    [5:0] op_code, funct,
                  output   jump, memwrite, regwrite, redest, alusrc, memtoreg, branch,
					   output   [2:0] alu_ctrl);

wire [1:0] alu_op;						
main_decoder d1(op_code, jump, memwrite, regwrite, redest, alusrc, memtoreg, branch,alu_op);
alu_decoder  d2(alu_op, funct, alu_ctrl);
endmodule


module main_decoder (input  [5:0] op_code,
                    output  reg jump, memwrite, regwrite, redest, alusrc, memtoreg, branch,
						  output reg [1:0] alu_op);						  
always @(*) begin
       case(op_code)
            
				6'b100011: begin
				           jump     = 0;
							  alu_op   = 0;
							  memwrite = 0;
						     regwrite = 1'b1;
							  redest   = 0;
							  alusrc   = 1'b1;
							  memtoreg = 1'b1;
							  branch   = 0;
				end
				
				6'b101011: begin
				           jump     = 0;
							  alu_op   = 0;
							  memwrite = 1'b1;
							  regwrite = 0;
							  redest   = 0;
							  alusrc   = 1'b1;
							  memtoreg = 1'b1;
							  branch   = 0;
				end
				
				6'b000000: begin
				           jump     = 0;
							  alu_op   = 2'b10;
							  memwrite = 0;
							  regwrite = 1'b1;
							  redest   = 1'b1;
							  alusrc   = 0;
							  memtoreg = 0;
							  branch   = 0;
				end
				
				6'b001000: begin
				           jump     = 0;
							  alu_op   = 0;
							  memwrite = 0;
							  regwrite = 1'b1;
							  redest   = 0;
							  alusrc   = 1'b1;
							  memtoreg = 0;
							  branch   = 0;
				end
				
				6'b000100: begin
				           jump     = 0;
							  alu_op   = 2'b01;
							  memwrite = 0;
							  regwrite = 0;
							  redest   = 0;
							  alusrc   = 0;
							  memtoreg = 0;
							  branch   = 1'b1;
				end
				
				6'b000010: begin
				           jump     = 1'b1;
							  alu_op   = 0;
							  memwrite = 0;
							  regwrite = 0;
							  redest   = 0;
							  alusrc   = 0;
							  memtoreg = 0;
							  branch   = 0;
				end
				
				default: begin
				         jump     = 0;
							alu_op   = 0;
							memwrite = 0;
							regwrite = 0;
							redest   = 0;
							alusrc   = 0;
							memtoreg = 0;
							branch   = 0;
				end
       endcase
end
endmodule

module alu_decoder(input  [1:0] alu_op,
                   input  [5:0] funct,
						 output reg [2:0]alu_ctrl);
						 
always @(*)
begin
     case(alu_op)
	  
	       2'b00: alu_ctrl = 3'b010;
			       
			 2'b01: alu_ctrl = 3'b100;
			 
			 2'b10: begin
			        case(funct)
					       
							 6'b100000: alu_ctrl = 3'b010;
							 
							 6'b100010: alu_ctrl = 3'b100;
							 
							 6'b101010: alu_ctrl = 3'b110;
							 
							 6'b011100: alu_ctrl = 3'b101;
							 
							 default  : alu_ctrl = 3'b010;
					  endcase
			  end
			  
			 default: alu_ctrl = 3'b010;
	  endcase
end
endmodule