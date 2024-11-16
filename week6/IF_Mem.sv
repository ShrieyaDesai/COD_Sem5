module mem(input clk, input [31:0] addr, output[31:0] dout);

reg [31:0] mem [1023:0]; //This defines a memory block with 1024 memory locations (from mem[0] to mem[1023]), 
								//and each memory location can store a 32-bit value.
initial 
begin
        mem[0] = 32'hA0000001;  // address 0
        mem[1] = 32'hA0000002;  // address 1
        mem[2] = 32'hA0000003;  // address 2
        mem[3] = 32'hA0000004;  // address 3
       
end
	 
always_ff @(posedge clk) //memory is synchronous and reads data on the positive edge of the clock.
begin
	dout <= mem[addr[31:0]]; // On each positive edge of the clock, the output dout is updated with the value 
									 //stored in the memory at the address specified by addr.
end 
endmodule