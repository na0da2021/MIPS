module pc_tb;
reg  [31:0] pc_in; // instruction
reg  clk, n_rst;
reg  jump, pcsrc; 
wire [31:0] pc_out;

pc pc_test(pc_in, clk, n_rst, jump, pcsrc, pc_out);

// Clock generation
always #5 clk = ~ clk;

    initial begin
	 // Test case 1: n_rst is low, output is expected to be cleared (pc_out = 0)
    clk = 0;
  	 n_rst = 1'b0;                  // Assert reset
    #10;

    if (pc_out !== 32'b0)
      $display("Test case 1 failed: pc_out= %b ", pc_out);
    else
      $display("Test case 1 passed");


  // Test case 2:n_rst is high & R-type instruction
	 jump   = 0;                                          // No jump
	 pcsrc  = 0;                                          // No branch
    pc_in  = 32'b00000010001100101000000000100000;       // add $s0, $s1, $s2
    n_rst  = 1;                                          // Release reset
    #10;   

    if (pc_out !== 4)
      $display("Test case 2 failed: pc_out = %b ", pc_out);
    else
      $display("Test case 2 passed");
		
	 // Test case 3:n_rst is high and there is jump instraction
	 jump   = 1;                                      // jump
	 pcsrc  = 0;                                      // No branch
    pc_in  = 32'b00001000000000000000000100000001;   // j 1028
    n_rst  = 1;                                      // Release reset

    #10;   

    if (pc_out !== 1028)
      $display("Test case 3 failed: pc_out = %b | pc_out<decimal> = %d", pc_out, pc_out);
    else
      $display("Test case 3 passed");
	
    // Test case 4:n_rst is high and there is branch instraction

	 jump   = 0;                                        // No jump
	 pcsrc  = 1;                                        // branch
    pc_in  = 32'b00010001000000000000000000000100;     // beq at a label at 1048                                  
    n_rst  = 1;                                        // Release reset

    #10;   

    if (pc_out !== 1048)
      $display("Test case 4 failed: pc_out = %b | pc_out<decimal> = %d", pc_out, pc_out);
    else
      $display("Test case 4 passed");	
	
    // Test case 5: n_rst is low, output is expected to be cleared (pc_out = 0)
  	 n_rst = 1'b0;                  // Assert reset
    #10;

    if (pc_out !== 32'b0)
      $display("Test case 5 failed: pc_out= %b ", pc_out);
    else
      $display("Test case 5 passed");	
		
		
  end
initial #1000 $finish;
endmodule