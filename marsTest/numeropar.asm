.data
	epar: .asciiz "numero par "
	eimpar: .asciiz "numero impar "
.text
main:
	li $v0, 5
	syscall
	
	li $t1, 2
	div $v0, $t1
	mfhi $t1
	
	beq $t1, $zero, imprimepar
	li $v0, 4
	la $a0, eimpar
	syscall
	
	li $v0, 10
	syscall
	
	imprimepar:
		li $v0, 4
		la $a0, epar
		syscall
