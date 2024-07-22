.data

.text
	#função principal
	main:
		# define valor dos parametros a e b
		addi $a1, $zero, 20 # parametro a
		addi $a2, $zero, 10 # parametro b
		
		jal soma
		
				
		addi $v0, $zero, 1 # print int
		add $a0, $zero, $v1
		syscall
		
	end:
		addi $v0, $zero, 10
		syscall


	soma:
 		# Realizando a soma
		add $v1, $a1, $a2   # $v1 = a + b
	
 		jr $ra
	

