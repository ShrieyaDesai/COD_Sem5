module async_reset_ff (
    input  logic clk,       // Clock signal
    input  logic async_reset, // Asynchronous reset signal
    input  logic d,         // Data input
    output logic q          // Data output
);
    always_ff @(posedge clk or posedge async_reset) begin
        if (async_reset) 
            q <= 1'b0;      // Reset the output to 0
        else 
            q <= d;         // Update output with data input
    end
endmodule
