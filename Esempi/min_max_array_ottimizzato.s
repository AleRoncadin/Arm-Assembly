.data
array:
    .word 1, 0, 8, 3, 15
lenght:
    .word 5

.text
.global main

main:
    ldr r0, =array              @ Carica l'indirizzo dell'array in r0
    ldr r1, =lenght            @ Carica la lunghezza dell'array in r1
    ldr r1, [r1]
    sub r1, r1, #1              @ r1 contiene la lunghezza dell'array - 1

    mov r2, #0                  @ r2 contiene l'indice dell'elemento minimo
    mov r3, #4                  @ r3 contiene l'indice dell'elemento successivo all'elemento minimo
    mov r4, #0                  @ r4 contiene l'indice dell'elemento corrente

    ldr r5, [r0]                @ r5 contiene l'elemento minimo iniziale
    ldr r6, [r0]                @ r6 contiene l'elemento massimo iniziale

loop:
    cmp r4, r1                  @ Controlla se abbiamo raggiunto la fine dell'array
    bge exit

    ldr r7, [r0, r3]            @ Carica l'elemento successivo all'elemento corrente in r7

    cmp r5, r7                  @ Controlla se l'elemento successivo è minore dell'elemento minimo
    movle r5, r7                @ Se sì, aggiorna l'elemento minimo

    cmp r6, r7                  @ Controlla se l'elemento successivo è maggiore dell'elemento massimo
    movge r6, r7                @ Se sì, aggiorna l'elemento massimo

    add r4, r4, #1              @ Incrementa l'indice dell'elemento corrente
    add r3, r3, #4              @ Incrementa l'indice dell'elemento successivo
    b loop

exit:
    swi 0x11