module sync_reset_ff (
    input  logic clk,       // Clock signal
    input  logic sync_reset, // Synchronous reset signal
    input  logic d,         // Data input
    output logic q          // Data output
);
    always_ff @(posedge clk) begin
        if (sync_reset) 
            q <= 1'b0;      // Reset the output to 0
        else 
            q <= d;         // Update output with data input
    end
endmodule
