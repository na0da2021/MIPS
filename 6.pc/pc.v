
module pc(input [31:0] pc_in, // the output of the instraction memory in case of jump & branch 
          input clk, n_rst,
			 input jump, pcsrc,  //control signals to detect branch and jump case
			 output reg [31:0] pc_out);			 
wire [31:0] pcplus4  = pc_out + 4;
wire [31:0] sn_ex_temp;
sign_extend ex (pc_in[15:0], sn_ex_temp);	 		 
always@(posedge clk or negedge n_rst)   
begin
     if(!n_rst) begin
        pc_out <= 32'b0;
     end else begin
        case({jump, pcsrc})
		     
			  2'b00:   pc_out <= pcplus4  ;
			     
			  2'b01:   pc_out <= pcplus4  + (sn_ex_temp << 2);
			 
			  2'b10:   pc_out <= {pcplus4[31:28],pc_in[25:0],2'b00};
			  
			  default: pc_out <= pcplus4  ;			  
		  endcase 
     end
end
endmodule