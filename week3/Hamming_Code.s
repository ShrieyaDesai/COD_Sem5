#hamming code

.data
input: .word 0b1101       # Input 4-bit number (e.g., 0b1101 = 13)
output: .word 0           # Output encoded 7-bit Hamming code

.text
.globl main

main:
    # Load the input number
    lw x5, input          # Load the 4-bit input into x5
                          # Bits in x5: b3 b2 b1 b0 (stored in lower 4 bits)

    # Extract individual bits (b3, b2, b1, b0)
    andi x6, x5, 0x1      # x6 = b0 (extract the least significant bit)
    srli x7, x5, 1
    andi x7, x7, 0x1      # x7 = b1
    srli x8, x5, 2
    andi x8, x8, 0x1      # x8 = b2
    srli x9, x5, 3
    andi x9, x9, 0x1      # x9 = b3

    # Calculate parity bits
    xor x10, x9, x8       # x10 = b3 ^ b2
    xor x10, x10, x6      # x10 = b3 ^ b2 ^ b0 (p1)
    xor x11, x9, x7       # x11 = b3 ^ b1
    xor x11, x11, x6      # x11 = b3 ^ b1 ^ b0 (p2)
    xor x12, x8, x7       # x12 = b2 ^ b1
    xor x12, x12, x6      # x12 = b2 ^ b1 ^ b0 (p4)

    # Assemble the 7-bit encoded word
    slli x13, x10, 6      # p1 << 6
    slli x14, x11, 5      # p2 << 5
    slli x15, x9, 4       # b3 << 4
    slli x16, x12, 3      # p4 << 3
    slli x17, x8, 2       # b2 << 2
    slli x18, x7, 1       # b1 << 1
    or x19, x13, x14      # Combine p1 and p2
    or x19, x19, x15      # Add b3
    or x19, x19, x16      # Add p4
    or x19, x19, x17      # Add b2
    or x19, x19, x18      # Add b1
    or x19, x19, x6       # Add b0

    # Store the result in memory
    sw x19, output        # Store the encoded word in memory

    # End of program
    nop                   # No operation (placeholder for termination)
