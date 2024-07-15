.data
	n: .word 10 
	newline: .asciiz "\n"
	message: .asciiz "Resultado Final: "
.text
	# $s1 ponto de parada
	lw $s1, n
	
	#s2 Variavel contadora
	addi $s2, $zero, 0
	
	
	#s3 variavel a
	addi $s3, $zero, 0
	#s3 variavel b
	addi $s4, $zero, 1
	
	
	#variavel auxiliar
	addi $s5, $zero, 0
	
	#print primeiro valor
	li $v0, 1
	addi $a0, $s4, 0 
	syscall
	jal newLine
	
	#Subtrai 1 do valor de n para manter os 10 primeiros valores de fibonnaci
	sub $s1, $s1, 1
	
	while: # $2 <= n		
		beq $s2, $s1, exit
		
		addi $s2, $s2, 1
		add $s5, $s3, $s4 # auxiliar = a + b
		
		#print auxiliar
		li $v0, 1
		add $a0, $zero, $s5 
		syscall
		
		add $s3, $zero, $s4 # a = b
		add $s4, $zero, $s5 # b = auxiliar
		

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
	add $a0, $zero, $s5
	syscall
	
	