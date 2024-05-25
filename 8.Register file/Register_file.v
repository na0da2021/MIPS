module Register_file(input  [4:0]  r_a1, r_a2,          // READ ADDRESSES
                     input  [4:0]  w_a3,                // WRITE ADDRESS 
                     input  [31:0] w_d,                 // WRITE DATA
							input  w_e3,  clk,                 // WRITE ENABLE & CLK
							output [31:0] r_d1, r_d2);     // READ DATA
			
reg [31:0] registers [31:0];

integer i;
initial begin
for(i = 0; i < 32; i = i + 1) begin
    registers[i] = 32'b0;
	 end
end


// asynchronus data reading
assign r_d1 = registers[r_a1];
assign r_d2 = registers[r_a2];

// synchronus data writing
always @(posedge clk)
begin
     if(w_e3) begin
	  
	     if(w_a3 != 0) registers[w_a3] <= w_d ;  // as register zero is always zero
	  
	  end else begin
	      registers[w_a3] <= registers[w_a3];
	  end
end

endmodule