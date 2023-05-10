.data
m: 
        .word 9
n:
        .word 2

.text
.global main

main:
        ldr r2, =m
        ldr r2, [r2]
        ldr r3, =n
        ldr r3, [r3]
        mov r0, #0                     @ Contatore
        mov r1, #0

loop:
        cmp r2, r3
        movlt r1, r2
        blt exit
        sub r2, r2, r3
        add r0, r0, #1
        b loop

exit:
        swi 0x11