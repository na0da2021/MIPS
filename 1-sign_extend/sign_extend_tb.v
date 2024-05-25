module sign_extend_tb;

reg  [15:0] sign_ex_in;
wire [31:0] sign_ex_out;

sign_extend extension1 (sign_ex_in, sign_ex_out);

initial begin
        $monitor("Time = %t | sign_ex_in = %b | sign_ex_out = %b",$time, sign_ex_in, sign_ex_out);
    
        sign_ex_in = 16'b1010101010101010;
        #10;
        sign_ex_in = 16'b0101010101010101;
        #10;
		  sign_ex_in = 16'b0000000000000000;
        #10;
		  sign_ex_in = 16'b1111111111111111;
        #10;
		  sign_ex_in = 16'b0000000011111111;
        #10;
		  sign_ex_in = 16'b1111111100000000;
end
initial #100 $finish ;	
endmodule