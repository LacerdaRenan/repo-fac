 .data
	texto:				.space	33
	textoInvertido:		.space	33
	length: 			.word 	0
	lengthCod:			.word 	0
	entradaInvalida:	.asciiz "Entrada invalida.\n"
	codificado1:		.word 	0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	codificado2:		.space 	50
	caracteres:			.asciiz "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.­:+=^!/*?&<>()[]{}@%$#"
	quebraLinha: 		.asciiz "\n"
.text
main:
	
	la $a0, texto
	li $a1, 100
	li $v0, 8
	syscall
	
	jal retiraQuebraDeLinha
	jal verificaTamanho
	jal inverteBytes
	jal codifica1
	jal codifica2
	jal inverteCodificado2
	
	la $a0, codificado2
	li $v0, 4
	syscall
	
	la $a0, quebraLinha
	li $v0, 4
	syscall
	
	j para
	
	inverteCodificado2:
		li $t2, 0
		lw $t3, lengthCod
		addi $t3, $t3, -1
		
		loopInverte:
			bgt $t2, $t3, encerraInverteCod
			lb $t0, codificado2($t2)
			lb $t1, codificado2($t3)
			
			sb $t0, codificado2($t3)
			sb $t1, codificado2($t2)
			
			addi $t2, $t2, 1
			addi $t3, $t3, -1			
		j loopInverte
		
		encerraInverteCod:
			jr $ra
	
	
	codifica2:
		li $s0, 0	# Iterar word
		li $s1, 0	# Iterar byte
		lw $s2, lengthCod
		
		loop4:
			beq $s1, $s2, encerra4
			lw $t0, codificado1($s0)	# Carregar primeira word do codificado1
			lb $t1, caracteres($t0)		# Carregar byte referente a word nos caracteres
			sb $t1, codificado2($s1)	# Armazenar byte
			
			addi $s0, $s0, 4
			addi $s1, $s1, 1
		j loop4
		
		encerra4:
			jr $ra
	
	codifica1:
		lw $t0, length		# Carregar tamanho da string	
		li $t1, 0			# Iterador das words
		li $t6, 0			# Iterador dos bytes
		li $t2, 85			# Nova base
		la $s0, codificado1
		
		loop2:
			beq $t0, $t1, encerra2	# Caso $t1 seja == length encerra
			lw $t3, texto($t1)		# Carregar a word em sequencia
			loop3:
				beq $t3, 0, encerra3
				div $t3, $t2			# Divide word por 85
				mfhi $t4				# Resto da divisão
				mflo $t3				# Valor da divisão
				sw $t4, 0($s0)			# Armazenar word	
				addi $s0, $s0, 4		# Atualizar ponteiro
				addi $t6, $t6, 1		# Tamanho do array
			j loop3
			
			encerra3:
			addi $t1, $t1, 4		# $t3++
		j loop2
		
		encerra2:
			sw $t6, lengthCod
			jr $ra
		
		
	verificaTamanho:
		li $t1, 4	
		lw $t0, length			# Carregar tamanho da entrada
		div $t0, $t1			# Verificar se é multiplo de 4
		mfhi $t0				# Carregar o resto da divisão
		bne $t0, 0, invalida	# Se o resto não for 0 então é invalida
		jr $ra
		
		invalida:
			la $a0, entradaInvalida
			li $v0, 4
			syscall
		
	
	
	retiraQuebraDeLinha:		# Retirar caractere de quebra de linha
		li $t0, 0 				# Iterador
		loop1:		
			lb $t1, texto($t0)	# Carregar um byte de cada vez
			beq $t1, 10, remove	# Caso o seja o byte \n, remover
			addi $t0, $t0, 1	# iterador++
		j loop1
		
		remove:
			sb $zero, texto($t0)	# Armazenar NULL no lugar o \n
			sw $t0, length			# Armazenar em memória o tamanho da string
			jr $ra
			
	para:
		li $v0, 10
		syscall
		
	inverteBytes:
		li $t2, 0
		lw $t3, length
		addi $t3, $t3, -1
		
		loopInverteCod:
			bgt $t2, $t3, encerraInverte
			lb $t0, texto($t2)
			lb $t1, texto($t3)
			
			sb $t0, texto($t3)
			sb $t1, texto($t2)
			
			addi $t2, $t2, 1
			addi $t3, $t3, -1			
		j loopInverteCod
		
		encerraInverte:
			jr $ra