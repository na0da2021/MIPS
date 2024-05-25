//5-bit mux
module mux2_1_tb5;
reg  [4 : 0] in1, in2;
reg sel;
wire [4 : 0] out_mux;

mux2_1 #(4) muxtest ( in1, in2, sel, out_mux);

initial
begin
     $monitor("time = %t  |  in1 = %b  |  in2 = %b  |  sel = %b  |  out_mux =  %b",$time, in1, in2, sel, out_mux);
     in1 = 5'b11111;
	  in2 = 5'b00000;
	  sel = 1'b0;
	  #10
	  in1 = 5'b11111;
	  in2 = 5'b00000;
	  sel = 1'b1;
	  
end
initial #150 $finish;

endmodule