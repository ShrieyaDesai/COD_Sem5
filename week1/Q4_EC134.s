#Write an Assembly Program and analyse the format of storing signed and unsigned words, half words and byte data types

#Half word
.data
a: .half 0x8000 , 0x0001
la x10, a

#signed addition
lh x11,0(x10)
lh x12,2(x10)
add x13,x11,x12
sh x13,4(x10)

#unsigned addition
lhu x14,0(x10)
lhu x15,2(x10)
add x16,x15,x14
sh x16,6(x10)

#byte
.data
b: .byte 0x80 , 0x10
.text
la x10, b

#signed addition 
lb x17,0(x10)
lb x18,1(x10)
add x19,x17,x1
sb x19,2(x10)

#unsigned addition 
lbu x20,0(x10)
lbu x21,1(x10)
add x22,x20,x21
sb x22,4(x10)