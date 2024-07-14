.data 
	myArray: .space 12 #Array 3 inteiros de 4 bytes
	newLine: .asciiz "\n"
	
.text
	main:
	addi $s0, $zero, 4
	addi $s1, $zero, 10
	addi $s2, $zero, 12
	
	# Array = [4,10,12]
	#Index = $t0
	addi $t0, $zero, 0
	
	sw $s0, myArray($t0)
	  addi $t0, $t0, 4
	sw $s1, myArray($t0)
	  addi $t0, $t0, 4
	sw $s2, myArray($t0)
	
	addi $a2, $zero, 3 # tamanho array
	jal printArray
	
	#end Program
	li $v0, 10
	syscall
	
	
	printArray: # printArray(array, len(array))
	
		#guarda endereço de retorno
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		
		addi $t0, $zero, 4  # byte atual
		addi $t1, $zero, 1  # contador
		lw $t6, myArray($zero) # Carrega em t6 o byte atual
		jal printValue
		while:  
			beq $t1, $a2, exit
			lw $t6, myArray($t0) # Carrega em t6 o byte
			jal printValue
			addi, $t0, $t0, 4	
			addi $t1, $t1, 1
			j while
		exit:
		
		lw $ra, 0($sp) # Carrega em ra endereço de retorno da função
		addi $sp, $sp, 4
		
		jr $ra
	
	
	printValue:
		li $v0, 1
		move $a0, $t6
		syscall
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		jr $ra
	
	