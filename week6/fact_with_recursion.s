.text
addi x10,x0,5 #n=5
jal x1,fact
addi x21,x10,0
same: j same

fact:
    addi sp,sp,-8
    sw x1,4(sp)
    sw x10,0(sp)
    
    #n=n-1
    addi x5,x10,-1
    bge x5,x0,else
    
    addi x10,x0,1
    
    addi sp,sp,8
    jalr x0,x1,0
    
    else:
        
        addi x10,x10,-1
        jal x1,fact
        
    addi x6,x10,0
    
    lw x10,0(sp)
    lw x1,4(sp)
    
    addi sp,sp,-8
    
    mul x10,x10,x6
    jalr x31,x1,0
    