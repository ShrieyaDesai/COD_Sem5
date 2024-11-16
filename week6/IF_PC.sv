//This code defines a register file module that stores a 32-bit value and outputs the stored value (q).
//It can be reset to zero when a reset signal (rst) is high. The register updates its value (q) with the 
//input data (din) on the rising edge of the clock (clk).

module pc(din,clk, rst, q);
input clk;
input rst; 
input [31:0] din;
output logic [31:0] q;
always_ff @(posedge clk) 
begin
 	if(rst) 
	
	begin
		q <= 32'b0;
	end
	
	else 
	
	begin
		q<=din; //here q in processor stage is pc_present+4
	end
end
endmodule