.data
list: .word 1,2,3,4,5,6,7,8     # array definition

.text

.globl main

main:
	la $s0, list
	li $s1, 0

loop:
	lw $t1, 0($s0)       # get the value of list[0] into $t1
	andi $t2, $t1, 1
	beq $t2, 0, total

nextIndex:
	addi $s0, $s0, 4
	beq $t1, $zero, exit
	j loop

total:
	add $s1, $s1, $t1
	j nextIndex
	
exit:
	li $v0, 10
	syscall