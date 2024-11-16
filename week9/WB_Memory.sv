module data_memory (
    input logic clk,                   
    input logic mem_read,               // Memory read enable
    input logic mem_write,              // Memory write enable
    input logic [31:0] address,         // Memory address
    input logic [31:0] write_data,      // Data to be written to memory
    output logic [31:0] read_data       // Data read from memory
);

  
    logic [31:0] memory [1023:0];       // 1KB memory block

    // Read operation
    always_comb begin
        if (mem_read) 
            read_data = memory[address[11:2]]; // Reading word-aligned data
        else
            read_data = 32'b0;                 // Output zero when not reading
    end

    // Write operation
    always_ff @(posedge clk) begin
        if (mem_write) 
            memory[address[11:2]] <= write_data; // Writing word-aligned data
    end

endmodule
