module PC_AddRS2Shifted (
    input logic [31:0] pc,              // Current program counter
    input logic [31:0] rs2,             // rs2 register value
    output logic [31:0] next_pc         // Next program counter
);

    // Intermediate signal for shifted, sign-extended rs2
    wire [31:0] shifted_sign_extended_rs2;

    // Sign extend and shift left by 1 (equivalent to multiplying by 2)
    assign shifted_sign_extended_rs2 = {{20{rs2[11]}}, rs2[11:0]} << 1;

    // Add pc and shifted, sign-extended rs2
    assign next_pc = pc + shifted_sign_extended_rs2;

endmodule
