#####################################################################Disciplina: Arquitetura e Organiza��o de Processadores
#Atividade: Avalia��o 01 � Programa��o em Linguagem de Montagem
#Exerc�cio 01
#Aluna: Sabrina dos Passos Tortelli
#C�digo em Assembly
####################################################################
# SEGMENTO DE DADOS                                                            
####################################################################

   .data                            # Informa o in�cio do segmento de 
                                    # dados, onde declaramos todas as 
                                    # vari�veis envolvidas.

####################################################################
# SEGMENTO DE C�DIGO                                                           
####################################################################

    .text                      # Informa o in�cio do segmento de
                               # c�digo, onde fica o programa.

main:                          # O in�cio do programa
   
       addi $s0, $zero, 0     # i=0
Loop:  slti $t0, $s0, 10      # se i<10 ent�o $t0=1 sen�o $t0=0
       beq  $t0, $zero, Exit  # se $t0=0 ent�o goto Exit
       
       addi $v0, $0, 1        # carrega o servi�o 1 (print inteiro)
       add $a0, $0, $s0       # carrega o servi�o em $a0
       syscall                # chama o servi�o

       addi $s0, $s0, 1       # i++ (do la�o for)
       j    Loop              # goto Loop
Exit:  nop
