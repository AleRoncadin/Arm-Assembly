.data

vett1: 
    .skip 64
file1:
    .asciz "f1.txt"

.text

.global main

main:
    ldr r0, =file1

    mov r1, #0          @ 0 sta per read mode
    swi 0x66            @ apre il file che è specificato in r0

    mov r2, r0          @ salva l'handle del file in r2
    swi 0x6c            @ leggi la lunghezza, quindi la inserisce in r0

    mov r3, r0          @ salva lunghezza in r3, r3 quindi è il contatore della lunghezza
    ldr r6, =vett1
    mov r1, r3

loop:
    mov r0, r2          @ metti il nome del file in r0
    swi 0x6c            @ leggi l'integer dal file
    str r0, [r6], #4    @ store integer
    subs r3, r3, #1     @ decrementa r3, ovvero il contatore della lunghezza
    bne loop           @ prossima lettura

exit:
    mov r0, r2          @ metti il nome del file in r0
    swi 0x68            @ chiudi il file
    ldr r0, =vett1      @ r0 ora contiene l'indirizzo del vettore
    swi 0x11            @ termina il programma
