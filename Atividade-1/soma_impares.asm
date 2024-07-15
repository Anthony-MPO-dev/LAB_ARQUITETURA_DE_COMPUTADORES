.data
	newline: .asciiz "\n"
	message: .asciiz "Resultado Final: "
.text
	# $s1 = 101 ponto de parada
	addi $s1, $zero, 101
	
	#s2 Variavel contadora
	addi $s2, $zero, 1
	
	#s3 variavel acumuladora
	addi $s3, $zero, 0
	
	while: # $2 <= 100
		beq $s2, $s1, exit
		
		add $s3, $s3, $s2
		
		li $v0, 1
		add $a0, $zero, $s2
		syscall
		addi $s2, $s2, 2
		jal newLine
		j while 
	
	exit:
	
	jal Resultado
	
	#end Program
	li $v0, 10
	syscall
	
	newLine:
	li $v0, 4
	la $a0, newline
	syscall
	jr $ra
	
	
	Resultado:
	#imprime mesagem
	li $v0, 4
	la $a0, message
	syscall
	
	#Imprime Numero acumulador
	li $v0, 1
	add $a0, $zero, $s3
	syscall
	
	