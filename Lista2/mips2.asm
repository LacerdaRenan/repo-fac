.data
	linha: .asciiz "\n"
.text
main:
	li $v0, 5
	syscall
	
	# armazena numero
	addi $s0, $v0, -1
	
	# contador loop
	move $t0, $zero
	
	# ler o primeiro numero
	li $v0, 5
	syscall
	move $t1, $v0
	
	loop:
		beq $t0, $s0, sair
		
		li $v0, 5
		syscall # ler numeros
		
		bgt $v0, $t1, definirmaior
		
		addi $t0, $t0, 1
		
		j loop
	sair:
	
		li $v0, 1
		move $a0, $t1
		syscall
		
		li $v0, 4
		la $a0, linha
		syscall		
		
		li $v0, 10
		syscall
	
	definirmaior:
		move $t1, $v0
		addi $t0, $t0, 1
		j loop
