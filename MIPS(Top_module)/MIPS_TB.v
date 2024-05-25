module MIPS_TB;
reg  clk, reset;
wire [15:0]test_value;

MIPS mm (clk, reset, test_value);
always #10 clk = ~ clk; 

initial begin

$monitor("time = %t  |  reset = %b |  test_value = %h ",$time, reset, test_value);

clk = 0;
reset = 1'b0;
#20;

reset = 1'b1;

end
endmodule