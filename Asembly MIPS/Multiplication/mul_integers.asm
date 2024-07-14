.data

.text
	#Set values to multiply
	addi $s0, $zero, 10
	addi $s1, $zero, 4
	
	#mutiply values
	mul $t0, $s0, $s1
		
	#Print the result of the multiplication
	li $v0, 1
	add $a0, $zero, $t0
	syscall