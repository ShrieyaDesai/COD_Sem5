module adder(input [31:0] pc_present, output logic [31:0] sum);
assign sum = pc_present + 32'b00000000000000000000000000000100; //offset = 4 i.e., pcpresent+04
endmodule