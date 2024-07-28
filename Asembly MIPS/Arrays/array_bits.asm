.data 
    myArray: .space 12     # Reservando espaço para 3 inteiros (4 bytes cada)
    newLine: .asciiz "\n"  # String de nova linha

.text
    main:
        # Inicializando valores no array
        addi $s0, $zero, 4
        addi $s1, $zero, 10
        addi $s2, $zero, 15  # Adicionando um terceiro valor para exemplo
        
        # Index = $t0
        addi $t0, $zero, 0
        sw $s0, myArray($t0)
        addi $t0, $t0, 4
        sw $s1, myArray($t0)
        addi $t0, $t0, 4
        sw $s2, myArray($t0)
        
        # Chama função para imprimir array
        jal print_array 
        
    end_program:
        li $v0, 10
        syscall
        
    print_array:
        addi $t0, $zero, 0 # reseta index para 0
    while:
        beq $t0, 12, exit   # Se $t0 == 12(tamanho do array), termine
        lw $t6, myArray($t0)# Carrega elemento do array em $t6
        addi $t0, $t0, 4    # Atualiza posição no array
        
        li $v0, 1
        move $a0, $t6       # Move valor para $a0 para imprimir
        syscall
        
        li $v0, 4
        la $a0, newLine     # Carrega o endereço de newLine em $a0
        syscall
        
        j while
    
    exit:
        jr $ra