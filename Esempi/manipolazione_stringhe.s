.data

stringa:
    .asciz "stringa da manipolare"
a: 
    .ascii "a"
o: 
    .ascii "o"

.text

.global main

main: 
    ldr r0, =stringa                @ inizializza registri
    ldr r1, =a
    ldrb r1, [r1]
    ldr r2, =o
    ldrb r2, [r2]
    bl scambia                      @ chiamata procedura
    swi 0x11

scambia:
    ldrb r3, [r0], #1               @ carattere da confrontare
    cmp r3, #0                      @ test fine stringa, la fine della stringa si compone di uno 0
    beq exit
    cmp r3, r1                      @ confronta carattere
    streqb r2, [r0, #-1]            @ modifica stringa
    cmp r3, r2                      @ confronta carattere
    streqb r1, [r0, #-1]            @ modifica stringa
    b scambia                       @ ripete il ciclo

exit: 
    mov pc, lr
