.data
a: .word 0x12345678
.text
la x10,a
lw x11,0(x10)

#to store 78 in MSB
andi x12,x11,0xFF
slli x12,x12,24

srli x13,x11,8
andi x13,x13,0xFF
slli x13,x13,16

add x12,x12,x13
srli x14,x11,16
andi x14,x14,0xFF
slli x14,x14,8

add x12,x12,x14
srli x15,x11,24
andi x15,x15,0xFF

add x12,x12,x15
sw x12,4(x10)
