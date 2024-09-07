#to swap content of 2 memory locations. assume location 1 holds A[0] and location 2 holds A[1]
# if A[0] < A[1] swap the elements in the memory else no action
# assume elements areof byte size


.data 
a: .byte 0x10,0x09
.text
la x10,a

lb x11,0(x10) #A[0] = 10
lb x12,1(x10) #A[1] = 9

bltu x11,x12,next # if A[0] < A[1] jump to next 
   addi x20,x0,0
next:
    sb x12,0(x10) #store content of x12 in the memory of 0(x10)
    sb x11,1(x10) #store content of x11 in the memory of 1(x10)
        
    #load back to the registers
    lb x11,0(x10) #load content of x12 from memory into x11 reg 
    lb x12,1(x10) #load content of x11 from memory into x12 reg 
    
