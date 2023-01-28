.data
	addw: 	.asciiz "ADD: "
	subw: 	.asciiz "\nSUB: "
	andw: 	.asciiz "\nAND: "
	orw:  	.asciiz "\nOR: "
	xorw: 	.asciiz "\nXOR: "
	maskw:	.asciiz "\nMASK: "
	sllw:	.asciiz "\nSLL("
	srlw:	.asciiz	"\nSRL("
	fechap:	.asciiz "): "
	linha:	.asciiz "\n"
		
.text
	main:
	
	li $v0, 5		# Ler Primeiro Numero
	syscall
	move $t2, $v0		# Armazenar Primeiro Numero
	
	li $v0, 5		# Ler Segundo Numero
	syscall
	move $t3, $v0		# Armazenar Segundo Numero
	
	li $v0, 5		# Ler Terceiro Numero
	syscall
	move $t4, $v0		# Armazenar Terceiro Numero
	
	add  $s1, $t2, $t3	# Somar A e B
	sub  $s2, $t2, $t3	# Subtrair A e B
	and  $s3, $t2, $t3	# Op And A e B
	or   $s4, $t2, $t3	# Op Or A e B
	xor  $s5, $t2, $t3	# Op Xor A e B 
	andi $s6, $t4, 31	# Mask entre C e 31
	sllv $s7, $t2, $s6	# SSL de A por m
	srlv $s0, $t3, $s6	# SRL de B por m
	
	li $v0, 4		# Imprimir String
	la $a0, addw		# Carregar endereco palavra ADD
	syscall
	
	li $v0, 1		# Imprimir Inteiro
	move $a0, $s1		# Valor Soma
	syscall
	
	li $v0, 4		# Imprimir String
	la $a0, subw		# Carregar endereco palavra SUB
	syscall
	
	li $v0, 1		# Imprimir Inteiro
	move $a0, $s2		# Valor Soma
	syscall

	li $v0, 4		# Imprimir String
	la $a0, andw		# Carregar endereco palavra AND
	syscall

	li $v0, 1		# Imprimir Inteiro
	move $a0, $s3		# Valor And
	syscall
	
	li $v0, 4		# Imprimir String
	la $a0, orw		# Carregar endereco palavra OR
	syscall
	
	li $v0, 1		# Imprimir Inteiro
	move $a0, $s4		# Valor Or
	syscall
	
	li $v0, 4		# Imprimir String
	la $a0, xorw		# Carregar endereco palavra XOR
	syscall
	
	li $v0, 1		# Imprimir Inteiro
	move $a0, $s5		# Valor Xor
	syscall

	li $v0, 4		# Imprimir String
	la $a0, maskw		# Carregar endereco palavra MASK
	syscall
	
	li $v0, 1		# Imprimir Inteiro
	move $a0, $s6		# Valor Mask
	syscall
	
	li $v0, 4		# Imprimir String
	la $a0, sllw		# Carregar endereco palavra SLL
	syscall
	
	li $v0, 1		# Imprimir Inteiro
	move $a0, $s6		# Valor Mask
	syscall
	
	li $v0, 4		# Imprimir String
	la $a0, fechap		# Carregar endereco palavra "):"
	syscall
	
	li $v0, 1		# Imprimir Inteiro
	move $a0, $s7		# Valor SSL
	syscall
	
	li $v0, 4		# Imprimir String
	la $a0, srlw		# Carregar endereco palavra SLL
	syscall
	
	li $v0, 1		# Imprimir Inteiro
	move $a0, $s6		# Valor Mask
	syscall
	
	li $v0, 4		# Imprimir String
	la $a0, fechap		# Carregar endereco palavra "):"
	syscall
	
	li $v0, 1		# Imprimir Inteiro
	move $a0, $s0		# Valor SRL
	syscall
	
	li $v0, 4		# Imprimir String
	la $a0, linha		# Quebra de linha
	syscall

	li $v0, 10		# Finalizar o Programa
	syscall
	
	
	