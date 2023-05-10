.data
n:
    .word 4
array:
    .word 1,2,3,4

.text
.global main

main:
    ldr r0, =array
    ldr r1, =n
    ldr r1, [r1]
    mov r4, #0

loop:
    ldr r2, [r0, r4]
    bl divisione
    bl pari
    subs r1, r1, #1
    blt exit
    add r4, r4, #4
    b loop

divisione:
    cmp r2, #2
    movlt r3, r2
    movlt pc, lr
    sub r2, r2, #2
    b divisione

pari:
    cmp r3, #0
    moveq r5, #0
    streq r5, [r0, r4]
    mov pc, lr

exit:
    swi 0x11