
    
    .data
a:.half 0x1234, 0x5678, 0x0012, 0x0123, 0x0020, 0x0086, 0x4007, 0x0430, 0x0011, 0x0120, 0x0032
b:.half 0x1234, 0x5678, 0x0014, 0x0121, 0x0120, 0x0210, 0x0006, 0x0120, 0x0011, 0x0020, 0x0123
c:.half 0x1234, 0x5678, 0x0255, 0x0024, 0x0050, 0x1220, 0x0440, 0x0060, 0x0002, 0x0000, 0x0002
.text
addi x10,x0,0
la x11,a
la x12,b
la x13,c
addi x14,x0,10

func:
    bge x10,x14,end #condition to end the looping
    lh x15,0(x11)
    lh x16,0(x12)
    mul x17,x15,x16 #a*b
    beqz x10,firstc # loop bcz it needs to compute c[0]
    lh x18,-2(x13)   
    add x17,x17,x18 #a*b+c[i-1]

firstc:
    sh x17,0(x13)
    addi x11,x11,1
    addi x12,x12,1
    addi x13,x13,1
    addi x10,x10,1
    j func
end:
    addi x20,x0,0xff #code complete
