module shift_left_twice #(parameter width = 31)
(input       [width:0] shift_in,
 output  reg [31:0] shift_out);

always @(shift_in)
begin
shift_out = shift_in << 2; 
end

endmodule