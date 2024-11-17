# Program : Write an assembly program to search a given number in an array
.data
array: .word 5, 12, 7, 20, 14, 7, 18  

.text
main:
    la x10, array           
    addi x11, x0, 7         
    addi x12, x0, 7         
    addi x13, x0, 0        
    addi x14, x0, -1        
    addi x15, x0, 0         
search_loop:
    beq x15, x11, not_found 
    lw x16, 0(x10)          
    beq x16, x12, found     
    addi x10, x10, 4       
    addi x15, x15, 1        
    jal x0, search_loop     
found:
    add x14, x15, x0        
    jal x0, exit         
not_found:
    addi x14, x0, -1       
exit:
    add x0, x0, x0          