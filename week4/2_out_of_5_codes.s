# write an assembly code to check whether given bit number is a 2 out of 5 code
# if and only if 
# (A) MSB 3 bits must be all zeroes
# (B) LSB 5 bits -> two 1's 

# ex: 0x05: 000|00101  //msb 3 bits are zero and lsb out of 5 bits, any 2 bits are ONE! 

.data 
a: .byte 0x5
.text
la x10,a
lb x11,0(x10)
srli x12,x11,5
bne x12,x0,exit

#lb x13,2(x10)

#srli x13,x11,4
addi x22,x0,5 #counter to say that i need to check for 5 bits now  :::: count == 5
loop:
andi x14,x11,0x01 #check if lsb == 1 therefore the lsb and 1 is anded and stored in x14
beq x14,x0,next #checks if lsb is 0 , if it is then it goes to next 
addi x15,x15,1
next:
    srli x11,x11,1
    addi x22,x22,-1 #decrementing the count ; check if count now is not equal to 0,
    bne x22,x0,loop     #if count is not equal to 0 then go back to loop 
    
    
    addi x16,x0,2 # need to check if count =2 we dont have anything direct to compare as '2' in branches
    #hence we are storing the number 2 in x16
    
    beq x22,x16,exit # checks if count of 5 bit number on lsb = 2 , if it is go to exit
    

exit:
    addi x18,x0,0
    
    
    
    
