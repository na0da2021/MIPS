module inst_mem(input  [31:0] address,
                output reg[31:0] instruction);
					 
reg [31:0] inst_array [255:0];


initial begin 
instruction = 32'b0;
$readmemh("programtwo.hex",inst_array);
end

always @(*)
begin
    instruction = inst_array[address[9:2]];
end
endmodule
