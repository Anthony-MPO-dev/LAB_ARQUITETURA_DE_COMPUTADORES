# Funcao hello word em asembly

.data # Area de definicao de variaveis para serem carregadas no programa
	msg: .asciiz "Ola Mundo!" # 11 bytes contando (/0)

.text # Codigo do programa

	addi $v0, $0, 4 #Printa string
	la $a0, msg
	syscall
	
	addi $v0, $0, 10 #Termina execucao do programa
	syscall
