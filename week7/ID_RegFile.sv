module RegisterFile(
    input logic clk,
    input logic rst,
    input logic [4:0] rs1,  // Source register 1 address
    input logic [4:0] rs2,  // Source register 2 address
    input logic [4:0] rd,   // rd== wsDestination register address
    input logic [31:0] writeData,  // Data to write to rd
    input logic RegWrite,    // Write enable signal
    output logic [31:0] reg1, // Data from rs1
    output logic [31:0] reg2  // Data from rs2
);
    
    logic [31:0] RegFile [31:0];  // 32 registers of 32-bit each
    
    // Read logic
	 always_ff @(posedge clk) begin
    assign reg1 = (rs1 != 0) ? RegFile[rs1] : 32'b0;  // if rs1 is not zero, set reg1 value stored
																		// in the register at index rs1
    assign reg2 = (rs2 != 0) ? RegFile[rs2] : 32'b0;
	 end

    // Write logic (synchronous)
    always_ff @(negedge clk or posedge rst) begin
        if (rst) begin
            // Reset all registers to 0
            for (int i = 0; i < 32; i = i + 1) begin
                RegFile[i] <= 32'b0;
            end
        end else if (regWrite && (rd != 0)) begin
            // Write to destination register (except x0, which is hardwired to 0)
            RegFile[rd] <= writeData;
        end
    end
endmodule
