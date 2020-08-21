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

msg_1:.asciiz "Entre com o valor de x:"        # mensagem para entrada do x  

               
msg_2:.asciiz  "Entre com o valor de y:"       # mensagem para entrada do y  


msg_3:.asciiz  "A soma de x e y e igual a:"       # mensagem de saída de dados             


####################################################################
# SEGMENTO DE CÓDIGO                                                           
####################################################################

    .text                  # Informa o início do segmento de código, 
                           # onde fica o programa.

main:                      # O início do programa

    li $v0, 4              # carrega o serviço 4 (print string)
    la $a0, msg_1          # carrega ptr para string msg_1         
    syscall                # chama o serviço

    addi $v0, $0, 5        # carrega o serviço 5 (ler inteiro)
    syscall                # chama o serviço
    add $s0, $0, $v0       # carrega o retorno em $s0

    li $v0, 4              # carrega o serviço 4 (print string)
    la $a0, msg_2          # carrega ptr para string msg_2         
    syscall                # chama o serviço

    addi $v0, $0, 5        # carrega o serviço 5 (ler inteiro)
    syscall                # chama o serviço
    add $s1, $0, $v0       # carrega o retorno em $s1
    
    add $s2, $s0, $s1      # $s2 = $s0 (x) + $s1 (y) 
    
    li $v0, 4              # carrega o serviço 4 (print string)
    la $a0, msg_3          # carrega ptr para string msg_1         
    syscall                # chama o serviço

    addi $v0, $0, 1        # carrega o serviço 1 (print inteiro)
    add $a0, $0, $s2      # carrega o serviço em $a3
    syscall                # chama o serviço
