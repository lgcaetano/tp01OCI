    addi x28, x0, 1 # x28 representa i
Loop1:
    bge x28, x11, ExitLoop1 # se !(i < n) que equivale a i >= n saia do primeiro Loop
    slli x29, x28, 3 # x29 será usado para acessarmos o array, para isso precisamos que x29 = i*8
    add x29, x29, x10 # x29 é somado ao endereço inicial do array, em C o que estamos fazendo seria algo como x29 = &arr[i] 
    lw x30, 0(x29) # x30 recebe o valor de arr[i], representando key
    addi x31, x28, -1 # x31 representa j e recebe i - 1 
Loop2: 
    blt x31, x0, ExitLoop2 # se !(j >= 0) que equivale a j < 0 saia do loop
    slli x5, x31, 3 # x5 faz a mesma função que x29
    add x5, x5, x10 # x5 recebe o endereço de arr[j]
    lw x6, 0(x5) # x6 recebe o valor de arr[j]
    ble x6, x30, ExitLoop2 # se !(arr[j] > key) que equivale a arr[j] <= key, saia do loop
    sw x6, 8(x5) # arr[j+1] = arr[j]
    addi x31, x31, -1 # j--
    beq x0, x0, Loop2 # retornando para o começo do Loop interno
ExitLoop2:
    slli x5, x31, 3
    add x5, x5, x10
    sw x30, 8(x5) # arr[j+1] = key
    addi x28, x28, 1 # i++
    beq x0, x0, Loop1 # retornando para o começo do primeiro loop
ExitLoop1:
ExitFunction: 
    # ... Resto do código ...  
     
    


