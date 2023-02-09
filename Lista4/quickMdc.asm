.data
	quebraLinha: .asciiz "\n"
	msginvalida: .asciiz "Entrada invalida.\n"
.text
main:
	# Propriedades:
	# mmc(a,b)*mdc(a,b)=a*b
	# Calculo do mdc por algoritmo de euclides
	
	li $v0, 5				# Ler inteiro 1
	syscall
	ble $v0, 1, invalida	# Verificar se entrada é menor ou igual a 1
	move $a1, $v0			# Mover para o registrador $a1
	
	li $v0, 5				# Ler inteiro 2
	syscall
	ble $v0, 1, invalida	# Verificar se entrada é menor ou igual a 1
	move $a2, $v0			# Mover para o registrador $a2
	
	jal mdc					# Calcular mdc
	move $s0, $v1			# Resultado do mdc em $s0
	
	move $a0, $s0			# Printar mdc
	jal printInt
	
	jal mmc					# Calcular mmc
	move $s1, $v1			# Resultado do mmc em $s1
	
	move $a0, $s1			# Printar mmc		
	jal printInt
	
	li $v0, 10				# Encerrar programa
	syscall
	
	mmc:					# $a1 com parametro 1, $a2 com parametro 2, retorno em $v1
		mul $t0, $a1, $a2	# Produto dos dois numeros
		div $t0, $s0		# Divisão pelo mdc
		mflo $v1
		jr $ra
	
	mdc:						# $a1 com parametro 1, $a2 com parametro 2, retorno em $v1
		bgt $a1, $a2, ordena	# $t1 sempre será o registrador com o maior numero e dividendo
		move $t1, $a2			# Mover o maior para $t1
		move $t2, $a1			# Mover o menor para $t2
		j while
		ordena:
		move $t1, $a1		# Mover o maior para $t1
		move $t2, $a2		# Mover o menor para $t2
		
		while:
			div $t1, $t2			# Dividir $t1 por $t2
			mfhi $t3				# Pegar o resto da divisão
			beq $t3, 0, encerraMdc	# Encontrado o MDC
			
			move $t1, $t2	# Atualiza o dividendo para o menor valor
			move $t2, $t3	# Atualiza o divisor pelo resto
			
		j while
			
	encerraMdc:
		move $v1, $t2
		jr $ra
	
	invalida: 
		la $a0, msginvalida	# Print invalida
		li $v0, 4
		syscall
			
		li $v0, 10 			# Encerra o programa
		syscall
	
	printInt:				# $a0 com valor para print
		li $v0, 1
		syscall
		
		la $a0, quebraLinha 
		li $v0, 4
		syscall
		
		jr $ra
		
	
	
	
	
	
	
	
	
	
	
	
	
