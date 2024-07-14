.data
	message: .asciiz "Hi, everybody. \nMy name is Anthony. \n"
	
.text 
	main:
	jal print
	
	#End program
	li $v0, 10
	syscall	
	
	print: # Print the message
	li $v0, 4
	la $a0, message
	syscall
	
	jr $ra # Go back to calling func