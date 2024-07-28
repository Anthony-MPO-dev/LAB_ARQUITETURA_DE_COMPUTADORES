.data
	message: .asciiz "Hello, "
	userInput: .space 48

.text
	main:
		# Getting user's input as text
		li $v0, 8
		la $a0, userInput
		li $a1, 48
		syscall
		
		# Displays hello
		li $v0, 4
		la $a0, message
		syscall	
		
		# Displays user's text
		li $v0, 4
		la $a0,  userInput
		syscall
			
	
	li $v0, 10
	syscall