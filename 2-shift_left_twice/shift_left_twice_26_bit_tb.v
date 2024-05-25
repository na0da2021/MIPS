module shift_left_twice_26_bit_tb;

reg  [25:0] shift_in;
wire [31:0] shift_out;
								
shift_left_twice #(.width(25)) shifter1 
(shift_in, shift_out);

initial 
begin
     $monitor("time = %t  |  shift_in = %b  | shift_out = %b", $time, shift_in, shift_out);
     shift_in = 26'b10101010101010101010101010;
     #10;
	  shift_in = 26'b11111111111111111111111111;
     #10;
	  shift_in = 26'b00000000000000000000000000;
     #10;
	  shift_in = 26'b00000000000001111111111111;
end

initial #150 $finish; 

endmodule