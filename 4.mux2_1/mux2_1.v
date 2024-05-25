module mux2_1 #(parameter width = 4)
(input [width : 0] in1, in2,
 input sel,
 output reg [width : 0] out_mux
                                );

always @(in1, in2, sel)
begin
case(sel)
     1'b0: out_mux = in1;
	  
	  1'b1: out_mux = in2;

endcase
end

endmodule