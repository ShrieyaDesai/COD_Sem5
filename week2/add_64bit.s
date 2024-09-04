#2 write a pgm to add 64 bit numbers using RV32I and store the result in memory along with carry status
.data 
b: .dword 0x8234123482341234, 0x9234123492341234
.text
la x15,b
lw x16,0(x15)
lw x17,4(x15)
lw x18,8(x15)
lw x19,12(x15)


add x15,x17,x19
sltu x20,x15,x17
sw x15,16(x15)
#added msb numbers and stored it , got a carry that got stored in x21

add x21,x16,x18
#added lsb numbers and stored it in x21

add x22,x21,x20
#added lsb numbers and stored it in x21


sw x15,20(x15)