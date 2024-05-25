module Alu(input [31:0] scr_A, scr_B,
           input [2:0] alu_ctr,
			  output reg [31:0] result,
			  output reg z_flag );

always @(*)
begin
result='b0;
z_flag ='b1;
case(alu_ctr)
     //bitwise and
	  3'b000: begin
	  result = scr_A & scr_B;
	  if(result == 0) begin
	     z_flag = 1;
	  end else begin
	     z_flag = 0;
	  end
	  end
	  
	  //bitwise or
	  3'b001: begin
	  result = scr_A | scr_B;
	  if(result == 0) begin
	     z_flag = 1;
	  end else begin
	     z_flag = 0;
	  end
	  end
	  
	  //addition
	  3'b010: begin
	  result = scr_A + scr_B;
	  if(result == 0) begin
	     z_flag = 1;
	  end else begin
	     z_flag = 0;
	  end
	  end
	  
	  //subtraction
	  3'b100: begin
	  result = scr_A - scr_B;
	  if(result == 0) begin
	     z_flag = 1;
	  end else begin
	     z_flag = 0;
	  end
	  end
	  
	  //multiplication
	  3'b101: begin
	  result = scr_A * scr_B;
	  if(result == 0) begin
	     z_flag = 1;
	  end else begin
	     z_flag = 0;
	  end
	  end
	  
	  //set less than (if srca < srcb then aluresult = 1 )
	  3'b110: begin
	  if(scr_A < scr_B) begin
	     result = 1;
	  end else begin
	     result = 0;
	  end
	  if(result == 0) begin
	     z_flag = 1;
	  end else begin
	     z_flag = 0;
	  end
	  end
	  
	  default : begin
	  result = 0;
	  z_flag = 1'b1;
	  end
 
	  
endcase	  
end
endmodule