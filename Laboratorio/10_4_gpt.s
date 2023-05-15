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
    cmp r3, r2              @ Se r3<=r2, ricomincia il loop con r3+=1
    bgt exit
    mov r4, r3              @ r4 prende il valore di r3, ovvero il valore dell'indice
    bl divisione
    beq skip @ Se è multiplo di n e diverso da 0 e n, salta la parte di codice per azzerare l'elemento
    streq r6, [r0, r4, lsl #2] @ Carica 0 in quella posizione

skip:
    add r3, r3, #1 @ Passa all'indice successivo
    b loop

divisione:
    mov r5, #0 @ r5 contiene il resto della divisione
    cmp r4, #0 @ Controlla se l'indice è 0
    beq end
    mov r7, r4 @ r7 contiene l'indice

div:
    sub r7, r7, r1 @ Sottrae r1 per la divisione
    cmp r7, #0
    bge div
    add r7, r7, r1 @ Aggiunge r1 al resto
end:
    mov r5, r7 @ r5 contiene il resto
    mov pc, lr

exit:
    swi 0x11