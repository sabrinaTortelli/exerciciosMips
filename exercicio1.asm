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

msg_1:.asciiz "Entre com o valor de x:"        # mensagem para entrada do x  

               
msg_2:.asciiz  "Entre com o valor de y:"       # mensagem para entrada do y  


msg_3:.asciiz  "A soma de x e y e igual a:"       # mensagem de sa�da de dados             


####################################################################
# SEGMENTO DE C�DIGO                                                           
####################################################################

    .text                  # Informa o in�cio do segmento de c�digo, 
                           # onde fica o programa.

main:                      # O in�cio do programa

    li $v0, 4              # carrega o servi�o 4 (print string)
    la $a0, msg_1          # carrega ptr para string msg_1         
    syscall                # chama o servi�o

    addi $v0, $0, 5        # carrega o servi�o 5 (ler inteiro)
    syscall                # chama o servi�o
    add $s0, $0, $v0       # carrega o retorno em $s0

    li $v0, 4              # carrega o servi�o 4 (print string)
    la $a0, msg_2          # carrega ptr para string msg_2         
    syscall                # chama o servi�o

    addi $v0, $0, 5        # carrega o servi�o 5 (ler inteiro)
    syscall                # chama o servi�o
    add $s1, $0, $v0       # carrega o retorno em $s1
    
    add $s2, $s0, $s1      # $s2 = $s0 (x) + $s1 (y) 
    
    li $v0, 4              # carrega o servi�o 4 (print string)
    la $a0, msg_3          # carrega ptr para string msg_1         
    syscall                # chama o servi�o

    addi $v0, $0, 1        # carrega o servi�o 1 (print inteiro)
    add $a0, $0, $s2      # carrega o servi�o em $a3
    syscall                # chama o servi�o
