module d_m_TB;
reg [31:0] w_d, addr;
reg        w_e, clk;
wire[31:0] r_d;
wire [15:0] test_value;

data_mem d (addr, w_d, clk, w_e, r_d, test_value);
always #10 clk = ~ clk;

initial begin 
$monitor("time=%t  |  address = %d  | enable = %b  |  written_data = %h| read_data = %h | test_value = %h",$time,addr, w_e, w_d, r_d, test_value);
 clk  = 0;
 addr = 5;
 w_e  = 0;
 w_d  = 32'b00000000000000000001001000110100;
 #20
 
 w_e = 1;
 #20
 
 w_e = 0;
 
 end
 
initial #2000 $finish;
endmodule