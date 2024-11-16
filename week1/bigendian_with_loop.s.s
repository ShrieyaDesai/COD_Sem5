.data
a: .word 0x12345678
.text
la x10,a

lw x11,0(x10)

addi x20,x0,3
#lw x12,4(x10)

back:
    andi x12,x11,0xFF #stores the value in x12 as 0x00000078
    add x13,x12,x13 #stores the value 0x00000078 in x13
    slli x13,x13,8 #left shifts x13 and stores as 0x00007800
    srli x11,x11,8 #right shifts 0x12345678 as 0x00123456
    addi x20,x20,-1 #condition of the loop 
    #when x20 is not equal to 0, operation iterates 
    #when x20==0 operation quits and executes next statements 
bnez x20,back
add x13,x11,x13
    
    
    
    
    