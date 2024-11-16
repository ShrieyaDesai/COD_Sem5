# Convert the following C code to assembly code

# int main() {
#	unsigned short int a[11] = {0x1234, 0x5678, ...}, h;
#	h = 0;
#	for(i = 0; i < 10; i++)
#	{
#		h = h + a[i];
#	}
#	a[10] = h;
# }
.data 
a: .half 0x1234, 0x5678, 0x9ABC, 0xDEF0, 0x1357, 0x2468, 0x369B, 0x48AC, 0x57AD, 0x68BE
   .half 0x0000               # Placeholder for the sum (a[10])

.text
    la x10, a                 # Load base address of array 'a' into x10
    li x13, 0                 # i = 0
    li x12, 0                 # h = 0
    li x11, 10                # Loop limit (10 elements)

loop:
    slli x14, x13, 1          # Calculate offset for a[i], multiply i by 2 (size of half-word)
    add x15, x10, x14         # x15 = base address + offset (address of a[i])
    lh x16, 0(x15)            # Load half-word a[i] into x16
    
    add x12, x12, x16         # h = h + a[i]

    addi x13, x13, 1          # i = i + 1
    blt x13, x11, loop        # If i < 10, continue the loop

    # Store the sum in a[10]
    addi x15, x10, 20         # Calculate address for a[10] (10th index = 20 bytes offset)
    sh x12, 0(x15)            # Store the sum h in a[10]
