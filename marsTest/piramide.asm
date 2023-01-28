.data
	printaponto: .byte '*'
	quebralinha: .asciiz "\n"
	printespaco: .byte ' '
.text
main:
	# ler tamanho da piramide
	li $v0, 5
	syscall
	# s0 para guardar o tamanho da piramide
	add $s0, $v0, $zero
	# t0 para contar o tamanho da piramide
	add $t0, $zero, $zero
	# t1 para contar espaco
	add $t1, $s0, -1
	# t2 para aux de espaco
	add $t2, $zero, $zero
	#t3 para contar ponto
	addi $t3, $t3, 1
	#t4 para aux de ponto
	add $t4, $zero, $zero
	
	altura:
		beq  $t0, $s0, saidaaltura
					
		li $v0, 11
		lb $a0, printespaco 
		
		espaco:
			beq $t2, $t1, saidaespaco # if(t2>=t1) goto saidaespaco
			syscall # print(espaco)
			addi $t2, $t2, 1 # t2++
			j espaco
		saidaespaco:
		
		add $t2, $zero, $zero # t2 = 0
		addi $t1, $t1, -1 # t1--
		
		li $v0, 11
		lb $a0, printaponto
		
		ponto:
			beq $t4, $t3, saidaponto
			syscall # print(ponto)
			addi $t4, $t4, 1 #t4++
			j ponto
		saidaponto:
		
		add $t4, $zero, $zero
		addi $t3, $t3, 2 # t3 += 2
	
		li $v0, 4 # print(\n)
		la $a0, quebralinha
		syscall
		addi $t0, $t0, 1 # t0++
		j altura
		
	saidaaltura:
		li $v0, 10
		syscall
		
