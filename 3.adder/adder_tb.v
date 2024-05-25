module adder_tb;

reg  [31:0] data_in1, data_in2;
wire [31:0] result;

adder add1 (data_in1, data_in2, result);

initial
begin
     $monitor("time = %t   |  data_in1 = %d  | data_in2 = %d   | result = %d ",$time, data_in1, data_in2, result);
  // $monitor("time = %t   |  data_in1 = %b  | data_in2 = %b   | result = %b ",$time, data_in1, data_in2, result);

	  data_in1 = 10;
	  data_in2 = 5;
	  #10;
	  
	  data_in1 = 16;
	  data_in2 = 4;
	  #10;
	  
	  data_in1 = 30;
	  data_in2 = 10;
	  #10;
	  
	  data_in1 = 32;
	  data_in2 = 8;
end
 
initial #150 $finish; 

endmodule