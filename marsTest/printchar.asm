.data
	caractere: .byte '\n'
.text
	li $v0, 11
	lb $a0, caractere
	syscall
	
	li $v0, 10
	syscall
