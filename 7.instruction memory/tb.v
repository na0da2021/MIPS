module tb;
reg  [31:0] address;
wire [31:0] instruction;

inst_mem test1(address, instruction);

initial
      begin
      $monitor("time = %t  |  address = %d   |  instruction = %h",$time, address, instruction);
      address = 0;
      #10
      address = 4;
		#10
		address = 8;
      #10
		address = 12;
      #10
		address = 16;
      #10
		address = 20;
      #10
		address = 24;
      #10
		address = 28;
      #10
		address = 32;
      end

initial #150 $finish; 
endmodule 