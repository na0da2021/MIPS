module data_mem(input [31:0] addr, w_d,
                input clk, w_e,
					 output reg[31:0] r_d,
					 output    [15:0] test_value);

reg [31:0] data_array [255:0];

integer i;
initial begin
r_d = 32'b0;
for(i =  0; i < 256; i = i + 1) begin
   data_array[i] = 32'b0; 
	end
end

always @ (posedge clk)  
begin
     if(w_e) begin
	  data_array[addr[9:2]] <= w_d;
	  end else begin
	  data_array[addr[9:2]] <= data_array[addr[9:2]];
	  end
end	

always @(*)
begin
    if(~w_e) begin
	  r_d <= data_array[addr[9:2]];
	  end else begin
	  r_d <= r_d;
	  end
end	

assign test_value = r_d[15:0];
			 
endmodule