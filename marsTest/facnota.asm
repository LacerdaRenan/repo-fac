.data
	nA: .asciiz "A\n"
	nB: .asciiz "B\n"
	nC: .asciiz "C\n"
	nD: .asciiz "D\n"
	nE: .asciiz "E\n"
.text
main:
	li $t1,35
	li $t2,60
	li $t3,85
	li $t4,100
	
	li $v0, 5
	syscall
	
	beq $v0, $zero, notaE
	ble $v0, $t1, notaD
	ble $v0, $t2, notaC
	ble $v0, $t3, notaB
	ble $v0, $t4, notaA
	
	notaA:
		li $v0, 4
		la $a0, nA
		syscall

		li $v0, 10
		syscall
		
	notaB:
		li $v0, 4
		la $a0, nB
		syscall
		
		li $v0, 10
		syscall
		
	notaC:
		li $v0, 4
		la $a0, nC
		syscall
		
		li $v0, 10
		syscall

	notaD:
		li $v0, 4
		la $a0, nD
		syscall
		
		li $v0, 10
		syscall

	notaE:
		li $v0, 4
		la $a0, nE
		syscall
		
		li $v0, 10
		syscall
