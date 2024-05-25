module sign_extend( input  [15:0] sign_ex_in,
                    output reg [31:0] sign_ex_out);
						  

always@(sign_ex_in)
begin

sign_ex_out = { {16{sign_ex_in[15]}}, sign_ex_in};

end

endmodule