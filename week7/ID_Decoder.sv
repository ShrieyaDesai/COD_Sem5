module dectoreg(
    input [4:0] instr_in,
    output reg [4:0] add_rs1, add_rs2, add_rd,
    output reg [6:0] funct7, opcode,
    output reg [2:0] funct3,
    output reg [11:0] imm_value // For I-type and S-type immediates
);

    assign opcode = instr_in[6:0];
    assign funct3 = instr_in[14:12];
    assign funct7 = instr_in[31:25];
    assign add_rd = instr_in[11:7];
    assign add_rs1 = instr_in[19:15];
    assign add_rs2 = instr_in[24:20];
    
    always @(*) begin
        case (opcode)
            7'b0110011: begin // R-type
                // R-type instructions do not have an immediate value
                imm_value = 12'b0;
            end
            
            7'b1100011: begin // B-type (branch)
                // B-type has a signed 12-bit immediate formed from multiple instruction fields
                imm_value = {instr_in[31], instr_in[7], instr_in[30:25], instr_in[11:8]};
            end
            
            7'b0000011, 7'b0010011: begin // I-type (load and immediate ALU operations)
                imm_value = instr_in[31:20];
            end
            
            7'b0100011: begin // S-type (store)
                // S-type has a signed 12-bit immediate from two fields
                imm_value = {instr_in[31:25], instr_in[11:7]};
            end
            
            default: begin
                // Default case for unsupported or unrecognized instructions
                imm_value = 12'b0;
            end
        endcase
    end

endmodule
