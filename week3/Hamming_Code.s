.data
input: .word 0b1011       # Input 4-bit data: d_3 = 1, d_5 = 0, d_6 = 1, d_7 = 1 (binary: 1011)
output: .word 0           # Output encoded 7-bit Hamming code

.text

    # Load the input number
    lw x5, input          # Load the 4-bit input into x5
    lw x31, output        # Load the address of `output` into x31

    # Extract individual data bits
    andi x6, x5, 0x1      # x6 = d7 (LSB of input)
    srli x7, x5, 1
    andi x7, x7, 0x1      # x7 = d6
    srli x8, x5, 2
    andi x8, x8, 0x1      # x8 = d5
    srli x9, x5, 3
    andi x9, x9, 0x1      # x9 = d3 (MSB of input)

    # Calculate parity bits
    xor x10, x9, x8       # x10 = d3 ^ d5
    xor x10, x10, x6      # x10 = d3 ^ d5 ^ d7 (p1)
    xor x11, x9, x7       # x11 = d3 ^ d6
    xor x11, x11, x6      # x11 = d3 ^ d6 ^ d7 (p2)
    xor x12, x8, x7       # x12 = d5 ^ d6
    xor x12, x12, x6      # x12 = d5 ^ d6 ^ d7 (p4)

    # Assemble the 7-bit encoded word
    slli x13, x10, 6      # p1 << 6
    slli x14, x11, 5      # p2 << 5
    slli x15, x9, 4       # d3 << 4
    slli x16, x12, 3      # p4 << 3
    slli x17, x8, 2       # d5 << 2
    slli x18, x7, 1       # d6 << 1
    or x19, x13, x14      # Combine p1 and p2
    or x19, x19, x15      # Add d3
    or x19, x19, x16      # Add p4
    or x19, x19, x17      # Add d5
    or x19, x19, x18      # Add d6
    or x19, x19, x6       # Add d7

    # Store the result in memory
    sw x19, 0(x31)
    # End of program
    nop                   # No operation (placeholder for termination)
