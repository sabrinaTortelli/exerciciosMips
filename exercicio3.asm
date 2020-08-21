#####################################################################Disciplina: Arquitetura e Organiza��o de Processadores
#Atividade: Avalia��o 01 � Programa��o em Linguagem de Montagem
#Exerc�cio 03
#Aluna: Sabrina dos Passos Tortelli
#C�digo em Assembly
####################################################################
# SEGMENTO DE DADOS                                                            
####################################################################

   .data                            # Informa o in�cio do segmento de 
                                    # dados, onde declaramos todas as 
                                    # vari�veis envolvidas.

vetor_A: .word 0,0,0,0,0,0,0,0      #declara��o do vetor

msg_1:.asciiz "\nLEITURA DOS ELEMENTOS DO VETOR:"  # mensagem chamada                                                
               
msg_2:.asciiz "\nEntre com A["      # mensagem para entrada dos
                                    # elementos do array 

msg_3:.asciiz "]: "                 # mensagem para entrada dos
                                    # elementos do array 

msg_4:.asciiz "\nAPRESENTACAO DO VETOR LIDO:" # mensagem chamada 

msg_5:.asciiz "\nA["                # mensagem de sa�da dos
                                    # elementos do array 

msg_6:.asciiz "]:"                  # mensagem de sa�da dos
                                    # elementos do array 
                                                    
####################################################################
# SEGMENTO DE C�DIGO                                                           
####################################################################

    .text                  # Informa o in�cio do segmento de c�digo, 
                           # onde fica o programa.

main:                      # O in�cio do programa

       la $s1, vetor_A        #carrega o vetor para $s1
	 addi $s0, $zero, 0     # declara��o da vari�vel $s0 em zero(i)

       li $v0, 4              # carrega o servi�o 4 (print string)
       la $a0, msg_1          # carrega ptr para string msg_1         
       syscall                # chama o servi�o

       addi $t0, $zero, 0     # declara��o da vari�vel $t0=0
Loop:  slti $t0, $s0, 8       # se i<8 ent�o $t0=1 sen�o $t0=0
       beq  $t0, $zero, Exit  # se $t0=0 ent�o goto Exit

       li $v0, 4              # carrega o servi�o 4 (print string)
       la $a0, msg_2          # carrega ptr para string msg_2         
       syscall                # chama o servi�o

	 li $v0, 1              # carrega o servi�o 1 (print inteiro)
       move $a0, $s0          # carrega int em $a0         
       syscall                # chama o servi�o
       
       li $v0, 4              # carrega o servi�o 4 (print string)
       la $a0, msg_3          # carrega ptr para string msg_3         
       syscall                # chama o servi�o
       
       add $t1, $s0, $s0      # $t1 = 2*1
       add $t1, $t1, $t1      # $t1 = 4*1
       add $t1, $t1, $s1      # $t1 = end. Base + 4*i = end. absoluto
       lw $t2, 0($t1)         # $t2 = A[0]
       
       li $v0, 5              # carrega o servi�o 5 (l� inteiro)
       syscall                # chama o servi�o
       add $t2, $v0, $0       # carrega leitura em $t2

       sw $t2, 0($t1)         # A[i] = $t2

       addi $s0, $s0, 1       # i++ (do la�o for)
       j    Loop              # goto Loop
Exit:  nop

	 la $s1, vetor_A        # carrega o vetor para $s1
       li $v0, 4              # carrega o servi�o 4 (print string)
       la $a0, msg_4          # carrega ptr para string msg_4         
       syscall                # chama o servi�o
	
       addi $t0, $zero, 0     # declara��o da vari�vel $t0=0
       addi $s0, $zero, 0     # i = 0
      
Loop2: slti $t0, $s0, 8       # se i<8 ent�o $t0=1 sen�o $t0=0
       beq  $t0, $zero, Exit2 # se $t0=0 ent�o goto Exit

       li $v0, 4              # carrega o servi�o 4 (print string)
       la $a0, msg_5          # carrega ptr para string msg_5         
       syscall                # chama o servi�o
       
       li $v0, 1              # carrega o servi�o 1 (print int)
       move $a0, $s0          # carrega int para $a0         
       syscall                # chama o servi�o
       
       li $v0, 4              # carrega o servi�o 4 (print string)
       la $a0, msg_6          # carrega ptr para string msg_6         
       syscall                # chama o servi�o
       
       add $t1, $s0, $s0      # $t1 = 2*1
       add $t1, $t1, $t1      # $t1 = 4*1
       add $t1, $t1, $s1      # $t1 = end. Base + 4*i = end. absoluto
       lw $t2, 0($t1)         # $t2 = A[0]
       
       li $v0, 1              # carrega o servi�o 1 (print int)
       move $a0, $t2          # carrega int para $a0         
       syscall                # chama o servi�o

       addi $s0, $s0, 1       # i++ (do la�o for)
       
       j    Loop2             # goto Loop
Exit2: nop

####################################################################
