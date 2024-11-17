# Program : Write an assembly program to search a given number in an array
.data
array: .word 5, 12, 7, 20, 14, 7, 18  

.text

    la x10, array           
    addi x11, x0, 7     #size of array    
    addi x12, x0, 7     #number to be searched = 7     
       
    addi x14, x0, -1   #stores result, default being -1      
    addi x15, x0, 0    #index i for traversal     
search_loop:
    beq x15, x11, not_found # if current index == size, not found 
    lw x16, 0(x10)          
    beq x16, x12, found # for 1st iteration : 5 == 7 not matched and for 2nd iteration : 
    # 12 == 7 not matched and for 3rd iteration : 7 == 7 matched      
    addi x10, x10, 4 #advances pointer x10 to next array elem        
    addi x15, x15, 1        
    jal x0, search_loop     
found:
    add x14, x15, x0        
    jal x0, exit         
not_found:
    addi x14, x0, -1       
exit:
    add x0, x0, x0          