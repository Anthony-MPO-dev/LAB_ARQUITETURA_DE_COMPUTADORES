.data
	newLine: .asciiz "\n"
.text
	main:
	# i = 0
	addi $t0, $zero, 0
	
	while:
		bgt $t0, 10, exit
		jal printValue
		addi $t0, $t0, 1
		j while
		
	exit:
	
	#end program
	li $v0, 10
	syscall
	
	
	printValue:
		li $v0, 1
		move $a0, $t0
		syscall
	
		li $v0, 4
		la $a0, newLine
		syscall
	
		jr $ra
