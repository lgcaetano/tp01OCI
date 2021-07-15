    addi x28, x0, 1 # usaremos x28 para armazenar o número 1
    bge x28, x10, False # se x10 <= x28 então vá para False
    addi x28, x0, 2 #x28 será onde armazenaremos o valor da variável d, que é incializada com valor 2
Loop:
    bge x28, x10, True # se d >= n, condição de parada do loop, então vá para True
    rem x29, x10, x28 #x29 vai conter n%d
    beq x29, x0, False # se n%d == 0, vá para False
    addi x28, x28, 1 #d++
    jal x0, Loop # Volte para o início d loop
True:
    addi x11, x0, 1 # Retornando 1(TRUE) para x11(que é comummente usado para retornos)
    jal x0, Exit # Saindo da função, para que o próximo código não seja executado
False:
    add x11, x0, x0 # Retornando 0(FALSE) para x11(que é comummente usado para retornos)
Exit:
    #... Resto do código ...
    