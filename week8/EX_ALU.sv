module execute_stage(
input logic[31:0] rdrs1,
input logic[31:0] rdrs2,
input logic[31:0] imm12,
input logic[6:0] f7,
input logic[2:0]f3,
input logic[3:0]alu_op,
output logic[31:0] alu_res,
output logic zero_flag
);  


always_comb()
begin
case(alu_control)
4'b0000: alu_res=rdrs1+rdrs2;
4'b1000: alu_res=rdrs1-rdrs2;
4'b0111: alu_res=rdrs1&rdrs2;
4'b0110: alu_res=rdrs1|rdrs2;
4'b0100: alu_res=rdrs1^rdrs2;
4'b0010: alu_res=(rdrs1<rdrs2)?1:0;
4'b0011: alu_res=rdrs1<<imm12[4:0];
4'b1011: alu_res=rdrs1>>imm12[4:0];
4'b1100: alu_res=signed(rdrs1)>>imm12[4:0];
default: alu_res=32'b0;
endcase
end

always_comb()
if(alu_res==0)
begin
zero_flag=1;
end
else
begin
zero_flag=0;
end
endmodule
