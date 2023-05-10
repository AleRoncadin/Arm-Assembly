.data

lenght:
    .word 5

stringa:
    .asciz "radar"

.text

.global main

main:
    ldr r0, =stringa
    ldr r1, =lenght
    ldr r1, [r1]        // r1 contiene un contatore che parte dalla lunghezza della stringa
    mov r2, #0          // r2 contiene un contatore che parte da 0

check:
    cmp r1, r2
    blt exit            // esce quando i due contatori si superano
    ldrb r3, [r0,r1]
    ldrb r4, [r0,r2]
    cmp r3, r4
    bne exit            // se sono diversi esci
    add r2, r2, #1
    sub r1, r1, #1
    b check

si_palindroma:
    mov r5, #1          // se è palindroma inizializzo r5 a 1
    bal exit

no_palindroma:
    mov r5, #0          // se è palindroma inizializzo r5 a 0
    bal exit

exit:
    swi 0x11
