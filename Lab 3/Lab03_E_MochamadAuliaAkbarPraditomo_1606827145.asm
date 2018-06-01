.globl main

#$s1 MIN
#$s2 MAX
#$s3 MEAN

main:
	la $t0, array
	la $t1, array
	j min
	
min:
	lw $s4, 0($t0)
	lw $t2, 4($t1)
	beq $t2, 0, subMax
	addi $t0, $t0, 4
	addi $t1, $t1, 4
	addi $t9, $t9, 4
	addi $t8, $t8, 1
	beq $t8, 1, firstMin
	blt $t2, $s4, compareMin
	j min

compareMin:
	blt $t2, $s1, changeMin
	j min
				
firstMin:
	addi $s1,$s4,0
	j compareMin
			
changeMin:			
	addi $s1,$t2,0
	j min

subMax:
	sub $t3, $t0, $t9
	sub $t4, $t1, $t9
	j max
			
max:
	lw $s5, 0($t3)
	lw $t5, 4($t4)
	beq $t5, 0, subMean
	addi $t3, $t3, 4
	addi $t4, $t4, 4
	addi $t7, $t7, 1
	beq $t7, 1, firstMax
	bgt $t5, $s5, compareMax
	j max

firstMax:
	addi $s2, $s5, 0
	j compareMax
	
compareMax:
	bgt $t5, $s2, changeMax
	j max
				
changeMax:
	addi $s2,$t5,0
	j max
	
subMean:
	sub $t3, $t3, $t9
	j mean	
	
mean:
	lw $s6, 0($t3)
	beq $s6, 0, final
	addi $t3, $t3, 4
	addi $s7, $s7, 1
	add $t6, $t6, $s6
	j mean
	
final:
 	div $s3,$t6,$s7   # mencari mean dengan membagi dengan last counter
 
	li $v0,4
 	la $a0,msg_min
 	syscall
 
 	li $v0,1
 	move $a0,$s1
 	syscall

 	li $v0,4
 	la $a0,msg_enter
 	syscall
 
 	li $v0,4
 	la $a0,msg_max
 	syscall
  
 	li $v0,1
 	move $a0,$s2
 	syscall
 
 	li $v0,4
 	la $a0,msg_enter
 	syscall
 
 	li $v0,4
 	la $a0,msg_mean
 	syscall
 
 	li $v0,1
 	move $a0,$s3
 	syscall

 	li $v0,10  #exit
 	syscall
 	
exit:		

.data
msg_min: .asciiz  "MIN value   : "
msg_max: .asciiz  "MAX value   : "
msg_mean: .asciiz "MEAN value  : "
msg_enter: .asciiz "\n"
array: .word 1, 100, 88, 10, 89, 19, 15, 17

.word
