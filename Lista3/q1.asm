.data
	palavra: 	.space 1000
	newLine:	.asciiz "\n"
.text

	main:
	
	# Ler tamanho da palavra
	li $v0, 5
	syscall
	addi $a1, $v0, 2
	
	# Ler palavra
	la $a0, palavra
	jal lerString
	
	# Verifica se a palavra é palindromo
	# Retorna em $v1 o valor
	addi $a1, $a1, -2
	jal palindromo
	
	# Printar numero 0/1
	move $a0, $v1
	jal printNumber
	
	# Quebra de linha
	la $a0, newLine
	jal printString
	
	## Finalizar programa
	li $v0, 10
	syscall
	
	# metodo 1, itera sobre todo o array
	# $a1 com o tamanho da palavra
	palindromo:
		# $t0 para contador de loop
		addi $t0, $zero, 0
		
		# $t1 ponteiro de inicio
		addi $t1, $zero, 0

		# $t2 ponteiro para fim
		addi $t2, $a1, -1
		
		# $t3 para receber byte de $t1
		# $t4 para receber byte de $t2
		
		while:
			beq $t0, $a1, igual
			
			lb $t3, palavra($t1)
			lb $t4, palavra($t2)
			
			bne $t3, $t4, diferente
			
			# Soma e subtrai dos iteradores
			addi $t3, $t3, 1
			addi $t4, $t4, -1
			
			# Soma o contador do loop
			addi $t0, $t0, 1
			j while
			
			diferente:
				addi $v1, $zero, 0
				jr $ra
			
			igual:
				addi $v1, $zero, 1
				jr $ra
	
	# $a0 com endereço de buffer e $a1 com tamanho da string
	lerString:
		li $v0, 8
		syscall
		jr $ra
	
	# $a0 com o numero
	printNumber:
		li $v0, 1
		syscall	
		jr $ra
		
	# $a0 com endereço da string	
	printString:
		li $v0, 4
		syscall
		jr $ra
	