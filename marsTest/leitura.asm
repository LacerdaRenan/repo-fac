.data
	#saudacao: .asciiz "Entre com sua idade:\n"
	#saida: .asciiz "Sua idade é: "
.text

main:
	
	
	#li $v0, 4
	#la $a0, saudacao
	#syscall
	
	#li $v0, 5,
	#syscall
	
	#move $s0, $v0
	
	#li $v0, 4
	#la $a0, saida
	#syscall
	
	#li $v0, 1
	#move $a0, $s0
	#syscall
	
	