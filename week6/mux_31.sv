module mux_3to1 (
    input  logic [2:0] sel,  // 3-bit select signal
    input  logic a,          // Input 0
    input  logic b,          // Input 1
    input  logic c,          // Input 2
    output logic y           // Output
);
    always_comb begin
        case (sel)
            3'b001: y = a;  // Select input a
            3'b010: y = b;  // Select input b
            3'b100: y = c;  // Select input c
            default: y = 1'b0; // Default case
        endcase
    end
endmodule
