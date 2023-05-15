@ Scrivere il codice per Assembly per ARM a 32 bit 
@ per calcolare il logaritmo in base 2 di un numero.

.data
esponente:
    .word 8
base:
    .word 2

.text

.global main

main:
    ldr r0, =esponente
    ldr r0, [r0]
    ldr r1, =base
    ldr r1, [r1]

    mov r2, #1              @ inizializza un contatore a 1, il quale alla fine contiene il risultato
    mov r3, r1

loop:
    mul r3, r3, r1          @ r3 contiene la moltiplicazione di se stesso per la base
    add r2, r2, #1          @ incrementa r2, il quale alla fine contiene il risultato
    cmp r3, r0              @ se è r3 < r0
    blt loop                @ torna al loop

exit:
    swi 0x11