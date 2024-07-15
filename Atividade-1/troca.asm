.data
	a: .word 5
	b: .word 10 

.text
	lw $s1, a
	lw $s2, b
	sw $s2, a
	sw $s1, b
	
#End Program
li $v0, 10
syscall

