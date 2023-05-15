.data

file:
    .asciz "file.txt"
array:
    .word 1,2,3,4,5,6
length:
    .word 6

.text

.global main

main:
    ldr r0, =file
    ldr r1, =array
    ldr r2, =length

    mov r2, [r2]        @ r2 contiene la lunghezza del vettore
    mov r3, r1          @ r3 ora contiene l'indirizzo base del vettore
    mov r1, #1          @ 1 sta per write mode
    swi 0x66            @ apre il file in write mode
    mov r1, r2          @ metti in r1 la lunghezza per caricarla nel file
    swi 0x6b            @ scrivi nel file la lunghezza

loop:
    ldr r4, [r3], #4    @ Salva il r4 l'elemento del vettore
    mov r1, r4          @ metti in r1 l'intero da mettere poi nel file
    swi 0x6b            @ Scrivi l'elemento nel file
    subs r2, r2, #1     @ decrementa il vettore che contiene la lunghezza
    bne loop            @ ricomincia il loop se Z=0

exit:
    swi 0x68            @ chiudi il file
    swi 0x11            @ termina il programma
