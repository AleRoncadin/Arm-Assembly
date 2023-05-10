.data
m:
    .word 8
a:
    .word 2

.text
.global main

main:
    ldr r1, =m
    ldr r1, [r1]
    ldr r2, =a
    ldr r2, [r2]
    mov r3, #1
    mov r0, #0

loop:
    mul r3, r2, r3
    cmp r1, r3
    blt exit
    add r0, r, #1
    b loop

exit:
    swi 0x11