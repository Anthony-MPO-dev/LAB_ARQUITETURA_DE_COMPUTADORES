.data
	number: .word 5 # Valor para o fatorial
	result: .word 1 # Resultado
	newLine: .asciiz "\nResultado: " # Pula uma linha
		
.text

	main:
		lw $a1, number # Carrega valor do fatorial para enviar a função fat_recursivo
		
		# Printa o valor number
		li $v0, 1
		addi $a0, $a1, 0
		syscall
		
		#Chama a função
		jal fatorial
		
		#Pula linha
		li $v0, 4
		la $a0, newLine
		syscall
		
		#print result
		li $v0, 1
		lw $a0, result
		syscall
	
	end: # Fim do Programa	
		li $v0, 10
		syscall	
		
	fatorial: # função fatorial recursivo		
		lw $t1, result
		
		# Se $a1 (número) for zero(caso base), então !0 == 1 -> pula para end_fatorial
		beq $a1, $zero, end_fatorial
		
		mul $t1, $t1, $a1
		addi $a1, $a1, -1
		sw $t1, result
		
		j fatorial

	end_fatorial:
		jr $ra
		
		  
		
	