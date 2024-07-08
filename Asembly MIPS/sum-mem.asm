
.data
	g: .word 20
	h: .word 10
	i: .word 5
	j: .word 7
	
.text
	lw $s0, g
	lw $s1, h
	lw $s2, i
	lw $s3, j

        # Realizando a soma
	add $s0, $s0, $s1   # $s0 = $s0 + $s1
	add $s2, $s2, $s3   # $s2 = $s2 + $s3
	
	sub $t0, $s0, $s2   # t0 = s0 - s2
	
	addi $v0, $0, 1    # Printa Valor Final
	add $a0, $0, $t0
	syscall
	
	addi $v0, $0, 10    # Fim execucao
	syscall
