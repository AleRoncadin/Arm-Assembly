.data
array:
    .word 1, 0, 8, 3, 15
lenght:
    .word 5

.text
.global main

main:
    ldr r0, =array
    ldr r1, =lenght
    ldr r1, [r1]
    sub r1, r1, #1
    mov r2, #0
    mov r3, #4
    mov r4, #0                  @ Contatore per la lunghezza dell'array

    stmfd sp!, {r2-r4}
    bl min_array                @ Il registro r5 contiene il valore dell'elemento più piccolo
    ldmfd sp!, {r2-r4}

    stmfd sp!, {r2-r4}
    bl max_array                @ Il registro r6 contiene il valore dell'elemento più piccolo
    ldmfd sp!, {r2-r4}


min_array:
    cmp r4, r1                  @ Se il contatore è maggiore o uguale alla lunghezza dell'array
    movge pc, lr                @ ... Allora torna al main

    ldr r7, [r0, r2]
    ldr r8, [r0, r3]

    cmp r7, r8                  @ Confronta l'elemento di posizione n-1 con l'elemento di poszione n-2

    ldrle r5, [r0, r2]          @ Se il primo è il più piccolo allora lo carica in r5 

    movgt r2, r3                @ Se il primo è più grande allora r2 prende il valore di r3
    ldrgt r5, [r0, r3]          @ Quindi carica in r5 il secondo elemento che è il più piccolo

    add r3, r3, #4              @ Se sono uguali o il primo elemento elemento è maggiore del secondo allora aumenta r3
    add r4, r4, #1              @ Incrementa il contatore

    b min_array                 @ Ricomincia il loop

max_array:
    cmp r4, r1                  @ Se il contatore è maggiore o uguale alla lunghezza dell'array
    movge pc, lr                @ ... Allora torna al main

    ldr r7, [r0, r2]
    ldr r8, [r0, r3]

    cmp r7, r8                  @ Confronta l'elemento di posizione n-1 con l'elemento di poszione n-2

    ldrge r6, [r0, r2]          @ Se il primo è il più grande allora lo carica in r6 

    movlt r2, r3                @ Se il primo è più piccolo allora r2 prende il valore di r3
    ldrlt r6, [r0, r3]          @ Quindi carica in r6 il secondo elemento che è il più piccolo

    add r3, r3, #4              @ Se sono uguali o il primo elemento elemento è maggiore del secondo allora aumenta r3
    add r4, r4, #1              @ Incrementa il contatore

    b max_array                 @ Ricomincia il loop