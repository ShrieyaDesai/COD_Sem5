module mux(
input logic[31:0]in1;
input logic[31:0]in2;
input logic sel;
output logic[31:0]out);

assign out=sel?in1:in0;

endmodule