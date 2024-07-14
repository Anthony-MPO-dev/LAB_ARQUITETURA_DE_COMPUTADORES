.data
	newLine: .asciiz "\n"
	
.text 
	main:
	addi $s0, $zero, 10
	
	jal increaseMyRegister
	
	jal printValue
	
	#End program
	li $v0, 10
	syscall
	
	increaseMyRegister:
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $ra, 4($sp)
	
	addi $s0, $s0, 30
	
	jal printValue
	
	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	
	jr $ra
	
	printValue:
	
	# Print new value in function
	li $v0, 1
	move $a0, $s0
	syscall
	
	# Print new Line
	li $v0, 4
	la $a0, newLine
	syscall
	
	jr $ra