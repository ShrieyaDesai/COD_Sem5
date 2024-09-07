# write assembly code to arrange given array in ascending order using bubble sort algorithm

# if length of array = 5 ; no.of iterations = 5
# no.of comparisons in first iteration = n-1 = 5-1
# no.of comparisons in second iteration = n-2 = 5-2

.data 
a: .word 5,3,8,2,1
n: .word 5
.text
la x10,a
lw x11,n

addi x12,x0,0 #i==0
addi x