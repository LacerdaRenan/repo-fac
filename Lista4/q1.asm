.data
	sim: .asciiz "sim\n"
	nao: .asciiz "nao\n"
	msginvalida: .asciiz "Entrada invalida.\n"
.text

main:
	
	# Ler inteiro
	li $v0, 5
	syscall
	
	ble $v0, 0, invalida
	
	# a0 com o valor do inteiro
	move $a0, $v0
	j verificaPrimo
	
	verificaPrimo:	
		
		# Verificar se é o número 1
		beq $a0, 1, naoprimo
			
		# Verificar se é multiplo de 2
		beq $a0, 2, primo # Se for igual a 2 é primo
		li $t1, 2
		div $a0, $t1
		mfhi $t1
		beq $t1, 0, naoprimo
		
		# Verificar se é multiplo de 3
		beq $a0, 3, primo # Se for igual a 3 é primo
		li $t1, 3
		div $a0, $t1
		mfhi $t1
		beq $t1, 0, naoprimo
		
		# Verificar se é multiplo de 5
		beq $a0, 5, primo # Se for igual a 5 é primo
		li $t1, 5
		div $a0, $t1
		mfhi $t1
		beq $t1, 0, naoprimo
		
		# Verificar se é multiplo de 7
		beq $a0, 7, primo # Se for igual a 7 é primo
		li $t1, 7
		div $a0, $t1
		mfhi $t1
		beq $t1, 0, naoprimo
		
		# Verificar se é multiplo de 11
		beq $a0, 11, primo # Se for igual a 11 é primo
		li $t1, 11
		div $a0, $t1
		mfhi $t1
		beq $t1, 0, naoprimo
		
		# Verificar se é multiplo de 13
		beq $a0, 13, primo # Se for igual a 13 é primo
		li $t1, 13
		div $a0, $t1
		mfhi $t1
		beq $t1, 0, naoprimo
		
		# Verificar se é multiplo de 17
		beq $a0, 17, primo # Se for igual a 17 é primo
		li $t1, 17
		div $a0, $t1
		mfhi $t1
		beq $t1, 0, naoprimo
		
		# Verificar se é multiplo de 19
		beq $a0, 19, primo # Se for igual a 19 é primo
		li $t1, 19
		div $a0, $t1
		mfhi $t1
		beq $t1, 0, naoprimo
		
		# Verificar se é multiplo de 23
		beq $a0, 23, primo # Se for igual a 23 é primo
		li $t1, 23
		div $a0, $t1
		mfhi $t1
		beq $t1, 0, naoprimo
		
		# Verificar se é multiplo de 29
		beq $a0, 29, primo # Se for igual a 29 é primo
		li $t1, 29
		div $a0, $t1
		mfhi $t1
		beq $t1, 0, naoprimo
		
		# Se não for multiplo de nenhum desses primos, então é um primo
		# No conjunto int 
		j primo
			
		primo:
			# Print sim
			la $a0, sim
			li $v0, 4
			syscall
			
			# Encerra o programa
			li $v0, 10
			syscall
			
		naoprimo:
			# Print nao
			la $a0, nao
			li $v0, 4
			syscall
			
			# Encerra o programa
			li $v0, 10
			syscall
		
		invalida: 
			# Print invalida
			la $a0, msginvalida
			li $v0, 4
			syscall
			
			# Encerra o programa
			li $v0, 10
			syscall
		
			
