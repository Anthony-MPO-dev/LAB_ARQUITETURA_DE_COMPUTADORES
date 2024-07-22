.data
	result: .word 0
	origin: . word 0

.text
	#função principal
	main:
		# define valor dos parametros n
		addi $a1, $zero, 7 # parametro n
		sw $a1, origin
		
		jal soma_recursiva
		
				
		addi $v0, $zero, 1 # print int em v1
		add $a0, $zero, $v1
		syscall
		
	end: #encerra programa
		addi $v0, $zero, 10
		syscall


	soma_recursiva:
	
		blez $a1, caso_base # se a1 <= 0 va para recursao
		
		addi $sp, $sp, -8
		sw $ra, 0($sp) # salva retorno atual
		sw $a1, 4($sp) # salva a1 atual
		
		
		addi $a1, $a1, -1 # decrementa a1		
		
		jal soma_recursiva
		
		caso_base:	
		
		lw $t1, 4($sp) # carrega variavel contadora
		lw $ra, 0($sp) # carrega variavel de retorno
		lw $t2, result # Variavel que recebe o resultado
		lw $t3, origin # Carrega variavel de comparacao (variavel n inicial)
		
		addi $sp, $sp, 8
		
 		# Realizando a soma
 		add $t2, $t2, $t1
		
		sw $t2, result # salva novo valor de resultado
		
		beq $t1, $t3, end_recursivo
		
		jal soma_recursiva # chamada recursiva

		end_recursivo:
			lw $v1, result # Carrega resultado final em $t1
 			jr $ra
	

