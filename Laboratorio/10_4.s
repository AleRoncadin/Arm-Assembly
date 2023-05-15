.data
v:
    .word 0, 1, 2, 3, 4, 5, 6,
n:
    .word 2
length:
    .word 7

.text

.global main

main:
    ldr r0, =v
    ldr r1, =n
    ldr r1, [r1]            @ r1 contiene il numero n
    ldr r2, =length
    ldr r2, [r2]
    mov r3, #0              @ r3 contiene l'indice del vettore
    mov r6, #0              @ Registro per caricare 0 nell'elemento con indice multiplo di n

loop:
    cmp r3, r1              @ Se r3<=r1, ricomincia il loop con r3+=1
    addle r3, r3, #1
    suble r2, r2, #1
    ble loop

    mov r4, r3              @ r4 prende il valore di r3, ovvero il valore dell'indice
    bl divisione
    bl multiplo

    subs r2, r2, #1         @ Decrementa il contatore della lunghezza
    blt exit                @ Quando supera la lunghezza termina

    add r3, r3, #1
    b loop
    
divisione:
    cmp r4, r1              @ Confronta r4 con n
    movlt r5, r4            @ Se è inferiore r5 assume il valore del resto
    movlt pc, lr            @ Quindi esce dalla funzione e vede se è multiplo

    sub r4, r4, r1          @ Sottrai r4 con r1 per la divisione
    b divisione

multiplo:
    cmp r5, #0              @ Se r5, che contiene il resto, è uguale a 0 allora è multiplo
    streq r6, [r0], #4      @ Quindi carica 0 in quella posizione e passa all'indice successivo
    mov pc, lr              @ Torna quindi nella funzione loop

exit:
    swi 0x11
