#####################################################################Disciplina: Arquitetura e Organização de Processadores
#Atividade: Avaliação 01 – Programação em Linguagem de Montagem
#Exercício 03
#Aluna: Sabrina dos Passos Tortelli
#Código em Assembly
####################################################################
# SEGMENTO DE DADOS                                                            
####################################################################

   .data                            # Informa o início do segmento de 
                                    # dados, onde declaramos todas as 
                                    # variáveis envolvidas.

vetor_A: .word 0,0,0,0,0,0,0,0      #declaração do vetor

msg_1:.asciiz "\nLEITURA DOS ELEMENTOS DO VETOR:"  # mensagem chamada                                                
               
msg_2:.asciiz "\nEntre com A["      # mensagem para entrada dos
                                    # elementos do array 

msg_3:.asciiz "]: "                 # mensagem para entrada dos
                                    # elementos do array 

msg_4:.asciiz "\nAPRESENTACAO DO VETOR LIDO:" # mensagem chamada 

msg_5:.asciiz "\nA["                # mensagem de saída dos
                                    # elementos do array 

msg_6:.asciiz "]:"                  # mensagem de saída dos
                                    # elementos do array 
                                                    
####################################################################
# SEGMENTO DE CÓDIGO                                                           
####################################################################

    .text                  # Informa o início do segmento de código, 
                           # onde fica o programa.

main:                      # O início do programa

       la $s1, vetor_A        #carrega o vetor para $s1
	 addi $s0, $zero, 0     # declaração da variável $s0 em zero(i)

       li $v0, 4              # carrega o serviço 4 (print string)
       la $a0, msg_1          # carrega ptr para string msg_1         
       syscall                # chama o serviço

       addi $t0, $zero, 0     # declaração da variável $t0=0
Loop:  slti $t0, $s0, 8       # se i<8 então $t0=1 senão $t0=0
       beq  $t0, $zero, Exit  # se $t0=0 então goto Exit

       li $v0, 4              # carrega o serviço 4 (print string)
       la $a0, msg_2          # carrega ptr para string msg_2         
       syscall                # chama o serviço

	 li $v0, 1              # carrega o serviço 1 (print inteiro)
       move $a0, $s0          # carrega int em $a0         
       syscall                # chama o serviço
       
       li $v0, 4              # carrega o serviço 4 (print string)
       la $a0, msg_3          # carrega ptr para string msg_3         
       syscall                # chama o serviço
       
       add $t1, $s0, $s0      # $t1 = 2*1
       add $t1, $t1, $t1      # $t1 = 4*1
       add $t1, $t1, $s1      # $t1 = end. Base + 4*i = end. absoluto
       lw $t2, 0($t1)         # $t2 = A[0]
       
       li $v0, 5              # carrega o serviço 5 (lê inteiro)
       syscall                # chama o serviço
       add $t2, $v0, $0       # carrega leitura em $t2

       sw $t2, 0($t1)         # A[i] = $t2

       addi $s0, $s0, 1       # i++ (do laço for)
       j    Loop              # goto Loop
Exit:  nop

	 la $s1, vetor_A        # carrega o vetor para $s1
       li $v0, 4              # carrega o serviço 4 (print string)
       la $a0, msg_4          # carrega ptr para string msg_4         
       syscall                # chama o serviço
	
       addi $t0, $zero, 0     # declaração da variável $t0=0
       addi $s0, $zero, 0     # i = 0
      
Loop2: slti $t0, $s0, 8       # se i<8 então $t0=1 senão $t0=0
       beq  $t0, $zero, Exit2 # se $t0=0 então goto Exit

       li $v0, 4              # carrega o serviço 4 (print string)
       la $a0, msg_5          # carrega ptr para string msg_5         
       syscall                # chama o serviço
       
       li $v0, 1              # carrega o serviço 1 (print int)
       move $a0, $s0          # carrega int para $a0         
       syscall                # chama o serviço
       
       li $v0, 4              # carrega o serviço 4 (print string)
       la $a0, msg_6          # carrega ptr para string msg_6         
       syscall                # chama o serviço
       
       add $t1, $s0, $s0      # $t1 = 2*1
       add $t1, $t1, $t1      # $t1 = 4*1
       add $t1, $t1, $s1      # $t1 = end. Base + 4*i = end. absoluto
       lw $t2, 0($t1)         # $t2 = A[0]
       
       li $v0, 1              # carrega o serviço 1 (print int)
       move $a0, $t2          # carrega int para $a0         
       syscall                # chama o serviço

       addi $s0, $s0, 1       # i++ (do laço for)
       
       j    Loop2             # goto Loop
Exit2: nop

####################################################################
