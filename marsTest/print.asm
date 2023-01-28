.data

	msg: .asciiz "Hello world!" #Salvando string na variavel msg do tipo asciiz

.text
main:
	li $v0, 4 #Instrução 4: imprimir string. Carregar valor para registrador $v0
	la $a0, msg #carregando endereço da memoria para registrador $a0
	syscall #executar função
