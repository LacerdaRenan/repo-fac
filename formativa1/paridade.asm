bitparidade:
	move $t1, $zero
	move $s0, $a0
	loop:
		beq $a0, $zero, sair
		andi $t0, $a0, 1
		add $t1, $t1, $t0
		srl $a0, $a0, 1
		j loop
	sair:
		andi $s3, $t1, 1
		beq $s3, $zero, epar
		addi $v0,$zero, 1
		ori $v1, $s0, 128
		j $ra
	epar:
		add $v0, $zero, $zero
		move $v1, $s0
		j $ra
		
	
	
