# Program : Write an assembly program to find whether a given string is a palindrome or not, using stack operations

.data
palin: .word 0x12344321
.text
la x10,palin
lw x11,0(x10)
addi x12,x0,7
back:
    andi x13,x11,0xF
    add x14,x14,x13
    slli x14,x14,4
    srli x11,x11,4
    addi x12,x12,-1
bnez x12,back
andi x15,x11,0xFF
add x15,x14,x15
lw x16,palin
beq x16,x15,itisapalindrome
addi x20,x0,0x00         #not a palindrome
itisapalindrome:
    addi x20,x0,0xff     #palindrome