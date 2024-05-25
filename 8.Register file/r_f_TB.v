module r_f_TB;
reg [4:0]  r_a1, r_a2, w_a3;
reg [31:0] w_d;
reg        w_e3, clk;
wire[31:0] r_d1, r_d2;

Register_file m(r_a1, r_a2, w_a3, w_d, w_e3, clk, r_d1, r_d2);
always #10 clk = ~ clk;
initial begin 
$monitor("time = %t  |  read_address_1 = %d  |  read_address_2 = %d  | write_address = %d  |  written_data = %h  | enable = %b  | read_data_1 = %h  | read_data_2 = %h",$time,r_a1, r_a2, w_a3, w_d, w_e3, r_d1, r_d2);
 clk  = 0;
 r_a1 = 7;
 r_a2 = 3;
 w_e3 = 0; 
 w_a3 = 1;
 #20
 
 w_e3 = 1; 
 w_a3 = 1;
 w_d  = 32'b00100001000000000000000011001010;
 #20
 
 w_e3 = 0; 
 w_d  = 0;
 r_a1 = 1;
 r_a2 = 0;
 
 end
 
 initial #2000 $finish;
endmodule