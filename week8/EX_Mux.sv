module alu_mux (
    input logic [31:0] rs1,           // First source register (rs1)
    input logic [31:0] sign_ext_rs2,  // Sign-extended second source register (rs2)
    input logic alu_src,              // Control signal from control unit
    output logic [31:0] mux_out       // MUX output
);

    // MUX logic
    always_comb begin
        if (alu_src)
            mux_out = sign_ext_rs2;   // Select sign-extended rs2
        else
            mux_out = rs1;            // Select rs1
    end

endmodule
