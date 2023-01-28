.text
	# SOMAR DOIS NUMEROS:
	
		#li $t0, 75
		#li $t1, 25
		#add $s0, $t1, $t0
		
	# EQUIVALETE SOMAR DOIS NUMEROS:
	
		#addi $t0, $zero, 75
		#addi $t1, $zero, 25
		#add  $s0, $t0, $t1
	
	# MULTIPLICAR UM NUMERO POR 2^N É EQUIVALENTE A MOVER OS BITS N CASAS PARA A ESQUERDA
		
		# multiplicar 4 por 2² = 16
		
			#li $t0, 4
			#sll $s0, $t0, 2
			
		# multiplicar 16 por 2⁸ = 4096
			
			#addi $t0, $zero, 16
			#sll $s0, $t0, 8
			
	# DIVIDIR DOIS NUMEROS GERA DOIS RESULTADOS: VALOR E RESTO QUE FICARÃO NOS REGISTRADORES lo e hi RESPECTIVAMENTE
		
		# dividir 100 por 8
			
			#li $t0, 100
			#li $t1, 8
			#div $t0,$t1
			#mflo $t0
			#mfhi $t1
			
	# DIVIDIR UM NUMERO POR 2^n É EQUIVALENTE A MOVER OS BITS n CASAS PARA A DIREITA (PERDE O RESTO)
		
		# dividir 32 por 2² = 8
		
			#li $t0, 32
			#srl $s0, $t0, 2
	
	
	
	
	
	
	
	
	
	
			
			