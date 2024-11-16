    .data
number:  .word 5           # Number to calculate the factorial for (e.g., 5)
result:  .word 1           # Store the result here

    .text
    .globl main
main:
    # Load the number from memory
    la x5, number          # Load address of 'number' into x5
    lw x6, 0(x5)           # Load the number into x6 (x6 = number)
    
    # Initialize the result to 1
    li x7, 1               # Set result = 1
    
    # Loop to calculate factorial
loop:
    # Check if x6 == 1, if yes exit the loop
    beq x6, x7, exit
    
    # Multiply result by x6 (x7 = result * x6)
    mul x7, x7, x6         # x7 = result * x6
    
    # Decrement x6 (x6 = x6 - 1)
    addi x6, x6, -1        # x6 = x6 - 1
    
    # Jump back to the loop
    j loop
    
exit:
    # Store the result in memory
    la x8, result          # Load address of result into x8
    sw x7, 0(x8)           # Store the result in memory

    # End of program
    nop
