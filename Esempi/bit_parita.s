@ Scrivere una procedura per calcolare il bit di parità di una parola.

.data
parola:
    .word 0b110011
lunghezza:
    .word 6

.text

.global main

main:
    ldr r0, =parola
    ldr r1, =lunghezza
    ldr r1, [r1]            @ r1 contiene la lunghezza della parola
    mov r2, #0              @ r2 tiene traccia del numero degli uno

loop:
    ldrb r3, [r0], #1       @ carica il bit in r3
    cmp r3, #1              @ se il bit è pari a 1
    addeq r2, r2, #1        @ allora incrementa r2
    subs r1, r1, #1         @ sottrai il contatore della lunghezza
    bne loop                @ se r1 != 0 ricomincia il loop
 
dividi_casi_base:           @ qui esegue dei confronti tra r2 e 0,1,2, ovvero i casi base
    cmp r2, #0              @ se il numero di 1 è pari a 0
    moveq r6, #0            @ r6 indica che il bit di parità è pari a 0
    beq exit                @ allora è pari ed esce

    cmp r2, #1              @ se il numero di 1 è pari a 1
    moveq r6, #1            @ r6 indica che il bit di parità è pari a 1
    beq exit                @ allora è dispari ed esce

    cmp r2, #2              @ se il numero di 1 è pari a 2
    moveq r6, #0            @ r6 indica che il bit di parità è pari a 0
    beq exit                @ allora è pari ed esce

divisione_loop:             @ funzione per dividere per 2 per vedere se è pari o dispari
    cmp r2, #2
    movlt r4, r2
    blt pari_dispari
    sub r2, r2, #2
    add r0, r0, #1
    b divisione_loop

pari_dispari:               
    cmp r4, #0              @ se r4 che contiene il resto è pari a 0:
    moveq r6, #0            @ allora r6 è settato a 0
    movne r6, #1            @ altrimenti a 1

exit:
    swi 0x11                @ esci dal programma