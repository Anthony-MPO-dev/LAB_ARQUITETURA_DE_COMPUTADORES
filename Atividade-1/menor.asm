.data
	a: .word 10
	b: .word 4

.text
	lw $a1, a
	lw $a2, b
	jal compara
	
#End Program
li $v0, 10
syscall


compara:
	slt $t1, $a1, $a2 
	 
	beq $t1, 1, menor
	li $v0, 1
	add $a0, $zero, $a2
	syscall	
	jr $ra
	
	menor:
	li $v0, 1
	add $a0, $zero, $a1
	syscall	
	jr $ra
	
