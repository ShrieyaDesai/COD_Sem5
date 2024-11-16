    .data
number:  .word 5           # Number to calculate the factorial for (e.g., 5)
result:  .word 0           # Store the result here

    .text

    la x5, number          # Load address of 'number' into x5
    lw x6, 0(x5)           # Load the number into x6 (x6 = number)
    
    # Call the factorial function
    jal factorial          # Jump and link to factorial function
    
    # Store the result in memory
    la x7, result          # Load address of result into x7
    sw x6, 0(x7)           # Store the result in memory

    # End of program
    nop

factorial:
    # Base case: if n == 0, return 1
    li x7, 0               # Load 0 into x7
    beq x6, x7, base_case  # If x6 == 0, jump to base_case
    
    # Recursive case: factorial(n) = n * factorial(n-1)
    addi x6, x6, -1        # Decrement n by 1 (x6 = x6 - 1)
    
    # Save return address and argument
    addi sp, sp, -8         # Make space on stack for return address and argument
    sw ra, 0(sp)            # Store return address at sp
    sw x6, 4(sp)            # Store n-1 at sp
    
    # Call factorial(n-1)
    jal factorial           # Recursive call to factorial
    
    # Load return address and argument from stack
    lw ra, 0(sp)            # Load return address from stack
    lw x6, 4(sp)            # Load argument n-1 from stack
    addi sp, sp, 8          # Free space on stack
    
    # Multiply result of factorial(n-1) by n
    mul x6, x6, x7          # x6 = n * factorial(n-1)
    jr ra                   # Return to the caller
    
base_case:
    li x6, 1                # Set result to 1 (factorial(0) = 1)
    jr ra                   # Return to the caller
