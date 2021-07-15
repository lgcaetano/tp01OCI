
    beq x10, x0, Voltage # Caso V==0, então RETORNO = V = R*I
    beq x11, x0, Resistance # R==0 ->  V/I = RETORNO 
    beq x12, x0, Current # I==0 -> V/R = RETORNO
Voltage:
    mul x10, x11, x12 # Não é necessário checar se outra variável também possui valor 0, já que neste caso o resultado da multiplicação também será 0
    beq x0, x0, Exit # Instrução feita para pular o código a seguir
Resistance:
    beq x12, x0, ReturnZero # Caso o denominador seja 0, o retorno é automaticamente 0, no caso do numerador ser 0, temos situação idêntica à de Voltage
    div x10, x10, x12 # colocamos o valor da divisão em x10, nosso registrador de retorno
    beq x0, x0, Exit # Instrução feita para pular o código a seguir
Current:
    beq x11, x0, ReturnZero # Situação igual à anterior, só precisamos chegar se o denominador é 0
    div x10, x10, x11 # Aqui ocorre o mesmo que em Resistance
    beq x0, x0, Exit
ReturnZero:
    add x10, x0, x0
Exit:
    #... Resto do código

    

    