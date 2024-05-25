//32-bit mux
module mux2_1_tb32;
reg  [31 : 0] in1, in2;
reg sel;
wire [31 : 0] out_mux;

mux2_1 #(31) muxtest ( in1, in2, sel, out_mux);

initial
begin
     $monitor("time = %t  |  in1 = %b  |  in2 = %b  |  sel = %b  |  out_mux =  %b",$time, in1, in2, sel, out_mux);
     in1 = {32{1'b1}};
	  in2 = 32'b0;
	  sel = 1'b0;
	  #10
	  in1 = {32{1'b1}};
	  in2 = 32'b0;
	  sel = 1'b1;
	  
end
initial #150 $finish;

endmodule