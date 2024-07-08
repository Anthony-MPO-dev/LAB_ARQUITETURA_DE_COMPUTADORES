
.data

.text
	li $s0, 20
	li $s1, 10
	li $s2, 5
	li $s3, 7

 # Realizando a soma
	add $s0, $s0, $s1   # $s0 = $s0 + $s1
	add $s2, $s2, $s3   # $s2 = $s2 + $s3
	sub $t0, $s0, $s2
	
        addi $v0, $0, 1 # print int
	add $a0, $0, $t0
	syscall
	
	addi $v0, $0, 10 # Fim execucao
	syscall

