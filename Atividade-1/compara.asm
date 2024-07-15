.data
	a: .word 10
	b: .word 5
	igual: .asciiz "iguais!"
	diferente: .asciiz "diferentes!"

.text
	lw $a1, a
	lw $a2, b
	jal compara
	
#End Program
li $v0, 10
syscall


compara:
	beq $a1, $a2, iguais
	li $v0, 4
	la $a0, diferente
	syscall
	
	jr $ra
	
	iguais:
	li $v0, 4
	la $a0, igual
	syscall	
	jr $ra
	

