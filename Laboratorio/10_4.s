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
    ldr r1, [r1]
    ldr r2, =length
    ldr r2, [r2]
    mov r3, #0

loop:
    cmp r3, r1
    addle r3, r3, #1
    ble loop
    

exit:
    swi 0x11
