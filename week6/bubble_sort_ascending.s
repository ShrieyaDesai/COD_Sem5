# write assembly code to arrange given array in ascending order using bubble sort algorithm
    .data
a:  .word 5, 3, 8, 2, 1     # Array of elements
n:  .word 5                 # Number of elements in the array

    .text

    la   x10, a  
    lw   x11, n             # Load the size of the array (n) into x11

    addi x12, x0, 0         # i = 0 (Outer loop index)
    addi x16, x11, -1       # n-1 (loop bound for i) in x16


    addi x13, x0, 0          # j = 0 (reset inner loop index)

    
    
    #x11 = n
    #x12 = i
    #x13 = j
    #x14 = a[j]
    #x15 = a[j+1]
    #x16 = n-1
    #x17 = n-1-i
    
    
loopi:
    bge  x12, x16, end      # If i >= n-1, exit outer loop
    sub  x17, x16, x12       # Compute (n-1-i) for inner loop bound

loopj:
    bge  x13, x17, next_i    # If j >= (n-1-i), go to the next iteration of outer loop

    # Load a[j] into x14
    slli x30, x13, 2         # j * 4 (word size)
    add  x31, x10, x30       # Address of a[j]
    lw   x14, 0(x31)         # Load a[j] into x14

    # Load a[j+1] into x15
    addi x29, x13, 1         # j + 1
    slli x19, x29, 2         # (j+1) * 4 (word size)
    add  x28, x10, x19       # Address of a[j+1]
    lw   x15, 0(x28)         # Load a[j+1] into x15

    # Compare a[j] and a[j+1]
    blt  x14, x15, skip_swap # If a[j] < a[j+1], skip swap

    # Swap a[j] and a[j+1]
    sw   x15, 0(x31)         # Store a[j+1] in a[j]
    sw   x14, 0(x28)         # Store a[j] in a[j+1]

skip_swap:
    addi x13, x13, 1         # j = j + 1
    blt  x13, x17, loopj     # Repeat inner loop

next_i:
    addi x12, x12, 1         # i = i + 1
    blt  x12, x16, loopi     # Repeat outer loop

end:
    li   x17, 10             # Load exit
