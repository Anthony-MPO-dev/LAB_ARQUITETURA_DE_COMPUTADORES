.data
	myArray: .space 40
	userInput: .space 4
	
.text
	main:
		addi $t0, $zero, 0 # Index do meu array
		addi $t1, $zero, 40 # Tamanho do meu array
		
		loop: # loop para preencher array
		
		blez $t1, exit
				
        	# Solicita entrada do usuário
        	li $v0, 5         # Código de syscall para leitura de inteiro
       	 	syscall
        	sw $v0, myArray($t0)  # Armazena o valor no array	
		
		sub $t1, $t1, 4
		
		# Displays user's text
		#addi $v0, $zero, 1
		#lw $a0,  myArray($t0)
		#syscall
		
		addi $t0, $t0, 4
		
		j loop
		
		exit:	
		
		#Rezeta valores
		addi $t0, $zero, 0 # Index do meu array
		addi $t1, $zero, 40 # Tamanho do meu array
		addi $t2, $zero, 0 # Inicializa acumulador da soma
		
		sum:
		
		blez $t1, end_sum
		
		lw $a0,  myArray($t0)
		add $t2, $t2, $a0
		sub $t1, $t1, 4 
		addi $t0, $t0, 4
		
		j sum
		
		end_sum:
		
		# Exibir sum
		addi $v0, $zero, 1
		addi $a0, $t2, 0
		syscall
		
		
	#End Program
	addi $v0, $zero, 10
	syscall
