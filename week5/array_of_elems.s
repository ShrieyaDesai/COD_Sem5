.data
array:  .word 27, 45, 12, 100, 18       # Array of numbers
length: .word 5                         # Length of the array
result: .word 0, 0, 0, 0, 0             # Result array to store 1 or 0 for each element

.text
    la x5, array          # Load the address of the array into x5
    lw x6, length         # Load the length of the array into x6
    la x30, result        # Load the address of the result array into x30
    li x7, 0              # Initialize index i = 0

check_loop:
    # Check if we have iterated over all elements (i < length)
    bge x7, x6, end_loop
    
    # Load current element of the array (array[i])
    lw x8, 0(x5)          # Load the element at array[i] into x8
    
    # Perform division by 9 and check remainder (x8 % 9)
    li x9, 9              # Load the divisor 9 into x9
    div x10, x8, x9       # Divide x8 by 9 (quotient in x10)
    mul x11, x10, x9      # Multiply the quotient by 9 to get the product
    sub x12, x8, x11      # Subtract the product from x8 (remainder in x12)
    
    # If remainder is 0, set result to 1 (divisible by 9)
    beq x12, x0, divisible_by_9

not_divisible_by_9:
    # Set result to 0 (not divisible by 9)
    li x13, 0
    sw x13, 0(x30)        # Store 0 in the result array at the current index
    
    # Move to the next element (i++)
    addi x7, x7, 1        # Increment index
    addi x5, x5, 4        # Move to the next array element (4 bytes)
    addi x30, x30, 4      # Move to the next result array element
    j check_loop          # Repeat the loop

divisible_by_9:
    # Set result to 1 (divisible by 9)
    li x13, 1
    sw x13, 0(x30)        # Store 1 in the result array at the current index

    # Move to the next element (i++)
    addi x7, x7, 1        # Increment index
    addi x5, x5, 4        # Move to the next array element (4 bytes)
    addi x30, x30, 4      # Move to the next result array element
    j check_loop          # Repeat the loop

end_loop:
    # End of program, halt execution
    nop                   # No operation (placeholder for termination)
