.global _start

_start:
    ldr r0, =array
    ldr r1, =lenght
    ldr r1, [r1]
    mov r2, #0
    mov r3, #0          // contatore per vedere quando arriva alla fine dell'array
    mov r5, #0          // teniamo questo registro come 0 per poi caricare il valore nella posizione in cui l'elemento vale meno di 0

loop:
    cmp r3, r1
    bge exit
    ldr r4, [r0,r2]
    cmp r4, #0
    strlt r5, [r0,r2]        // se l'elemento è < 0 allora carica 0 nella posizione dell'array
    add r2, r2, #4
    add r3, r3, #1
    b loop
    
exit:
    swi 0x11

.data

array:
    .word 0, -1, 2, 4, -6, 7

lenght:
    .word 6
