.data
	male_input_msg : .asciiz "Male date of birth : "
	female_input_msg : .asciiz "Female date of birth : "
	result_input_msg : .asciiz "Result : "
	comp_input_msg : .asciiz "Compatible : "
	yes_input_msg : .asciiz "Yes"
	no_input_msg : .asciiz "No"
	new_line : .asciiz "\n"

		
.text
.globl main

main:
	li $v0, 4
	la $a0, male_input_msg
	syscall
	
	li $v0, 5
	syscall
	addi $t0, $v0, 0
	
	li $v0, 4
	la $a0, female_input_msg
	syscall
	
	li $v0, 5
	syscall
	addi $t1, $v0, 0

	add $t2, $t1, $t0
	mul $t3, $t2, 3

	div $t4, $t2, 4

	sub $t5, $t3, $t4

	li $v0, 4
	la $a0, result_input_msg
	syscall

	li $v0, 1
	addi $a0, $t5, 0
	syscall

	li $s0, 1
	li $s1, 2

	div $t5, $s1
	mfhi $t6

	li $v0, 4
	la $a0, new_line
	syscall

	li $v0, 4
	la $a0, comp_input_msg
	syscall

	beq $t6, $s0, yes
	bne $t6, $s0, no

	li $v0, 10
	syscall


yes:
	li $v0, 4
	la $a0, yes_input_msg
	syscall

	jr $ra


no:
	li $v0, 4
	la $a0, no_input_msg
	syscall

	jr $ra

exit:
li $v0, 10
syscall	
	
