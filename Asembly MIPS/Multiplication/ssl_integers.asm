.data
	
.text
	addi $s0, $zero, 4
	
	sll $t0, $s0, 2 # Potencia de 4^2 = 4*4 -> 16
	sll $t0, $t0, 1 # Multiplication 16 * 2
	
	li $v0, 1
	add $a0, $zero, $t0
	syscall