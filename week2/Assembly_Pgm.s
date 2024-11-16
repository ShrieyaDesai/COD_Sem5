#write an Assembly program for calculating 
#x = (y + m) - (L - D) + (Z + C) - D, 
#where x, y, m, L, D, Z, C are elements of 32-bits wide in ripes for riscv single cycle processor
.data
y: .word 10          # y = 10
m: .word 20          # m = 20
L: .word 50          # L = 50
D: .word 5           # D = 5
Z: .word 15          # Z = 15
C: .word 25          # C = 25

.text

    # Load variables from memory
    lw x5, y         # Load y into x5
    lw x6, m         # Load m into x6
    lw x7, L         # Load L into x7
    lw x8, D         # Load D into x8
    lw x9, Z         # Load Z into x9
    lw x10, C        # Load C into x10

    # Calculate (y + m)
    add x12, x5, x6  # x12 = y + m

    # Calculate (L - D)
    sub x13, x7, x8  # x13 = L - D

    # Subtract (L - D) from (y + m)
    sub x14, x12, x13  # x14 = (y + m) - (L - D)

    # Calculate (Z + C)
    add x15, x9, x10   # x15 = Z + C

    # Add (Z + C) to the previous result
    add x16, x14, x15  # x16 = (y + m) - (L - D) + (Z + C)

    # Subtract D
    sub x11, x16, x8   # x = (y + m) - (L - D) + (Z + C) - D
