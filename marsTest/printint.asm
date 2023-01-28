.data
	idade: .word 77
.text

	li $v0, 1
	lw $a0, idade
	syscall
	
	li $v0, 10
	syscall