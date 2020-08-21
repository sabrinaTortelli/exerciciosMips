#####################################################################Disciplina: Arquitetura e Organização de Processadores
#Atividade: Avaliação 01 – Programação em Linguagem de Montagem
#Exercício 01
#Aluna: Sabrina dos Passos Tortelli
#Código em Assembly
####################################################################
# SEGMENTO DE DADOS                                                            
####################################################################

   .data                            # Informa o início do segmento de 
                                    # dados, onde declaramos todas as 
                                    # variáveis envolvidas.

####################################################################
# SEGMENTO DE CÓDIGO                                                           
####################################################################

    .text                      # Informa o início do segmento de
                               # código, onde fica o programa.

main:                          # O início do programa
   
       addi $s0, $zero, 0     # i=0
Loop:  slti $t0, $s0, 10      # se i<10 então $t0=1 senão $t0=0
       beq  $t0, $zero, Exit  # se $t0=0 então goto Exit
       
       addi $v0, $0, 1        # carrega o serviço 1 (print inteiro)
       add $a0, $0, $s0       # carrega o serviço em $a0
       syscall                # chama o serviço

       addi $s0, $s0, 1       # i++ (do laço for)
       j    Loop              # goto Loop
Exit:  nop
