module Alu_tb;

reg  [31:0] scr_A, scr_B;
reg  [2:0] alu_ctr;
wire [31:0] result;
wire        z_flag; 

Alu Alu_test(scr_A, scr_B, alu_ctr, result, z_flag);
initial
begin
     $monitor("time = %t  | scr_A = %b  | scr_B = %b  | alu_ctr = %b  | result = %b  | z_flag = %b",$time, scr_A, scr_B, alu_ctr, result, z_flag);
    // test all cases for alu_ctr when (scr_a > scr-B)
	  scr_A = 15;
	  scr_B = 10;
	  alu_ctr = 3'b000;
	  #10;
	  
	  scr_A = 15;
	  scr_B = 10;
	  alu_ctr = 3'b001;
	  #10;
	  
	  scr_A = 15;
	  scr_B = 10;
	  alu_ctr = 3'b010;
	  #10;
	  
	  scr_A = 15;
	  scr_B = 10;
	  alu_ctr = 3'b011;
	  #10;
	  
	  scr_A = 15;
	  scr_B = 10;
	  alu_ctr = 3'b100;
	  #10;

	  scr_A = 15;
	  scr_B = 10;
	  alu_ctr = 3'b101;
	  #10;
	  
	  scr_A = 15;
	  scr_B = 10;
	  alu_ctr = 3'b110;
	  #10;

	  scr_A = 15;
	  scr_B = 10;
	  alu_ctr = 3'b111;
	  #10;
//---------------------------------------------------------------------//	  
	  // test all cases for alu_ctr when (scr_a < scr-B)
	  scr_A = 15;
	  scr_B = 20;
	  alu_ctr = 3'b000;
	  #10;
	  
	  scr_A = 15;
	  scr_B = 20;
	  alu_ctr = 3'b001;
	  #10;
	  
	  scr_A = 15;
	  scr_B = 20;
	  alu_ctr = 3'b010;
	  #10;
	  
	  scr_A = 15;
	  scr_B = 20;
	  alu_ctr = 3'b011;
	  #10;
	  
	  scr_A = 15;
	  scr_B = 20;
	  alu_ctr = 3'b100;
	  #10;

	  scr_A = 15;
	  scr_B = 20;
	  alu_ctr = 3'b101;
	  #10;
	  
	  scr_A = 15;
	  scr_B = 20;
	  alu_ctr = 3'b110;
	  #10;

	  scr_A = 15;
	  scr_B = 20;
	  alu_ctr = 3'b111;
	  #10;
//-----------------------------------------------------------------//
    // test all cases for alu_ctr when (scr_a = scr-B)
	  scr_A = 10;
	  scr_B = 10;
	  alu_ctr = 3'b000;
	  #10;
	  
	  scr_A = 10;
	  scr_B = 10;
	  alu_ctr = 3'b001;
	  #10;
	  
	  scr_A = 10;
	  scr_B = 10;
	  alu_ctr = 3'b010;
	  #10;
	  
	  scr_A = 10;
	  scr_B = 10;
	  alu_ctr = 3'b011;
	  #10;
	  
	  scr_A = 10;
	  scr_B = 10;
	  alu_ctr = 3'b100;
	  #10;

	  scr_A = 10;
	  scr_B = 10;
	  alu_ctr = 3'b101;
	  #10;
	  
	  scr_A = 10;
	  scr_B = 10;
	  alu_ctr = 3'b110;
	  #10;

	  scr_A = 10;
	  scr_B = 10;
	  alu_ctr = 3'b111;
	  #10;	  
	  
end

initial #250 $finish;
endmodule