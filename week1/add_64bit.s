#2 write a pgm to add 64 bit numbers using RV32I and store the result in memory along with carry status
.data 
b: .dword 0x8111123482341234, 0x9111123492341234
.text
la x15,b
lw x16,0(x15)
lw x17,4(x15)
lw x18,8(x15)
lw x19,12(x15)


#add lsb's 
add x20,x16,x18 #x20=addition of LSB
sltu x21,x20,x16 #if res(x20)<x16 set carry bit as 1 


add x22,x17,x19 #x22=addition of MSB
add x22,x21,x22 #x22= msb res + carry value

sw x20,16(x15)
sw x22,20(x15)

sw x21,24(x15)