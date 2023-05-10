.data
length:
    .word 5
loc:
    .skip 20

.text
.global main

main:
    ldr r0, =loc
    ldr r1, =length
    ldr r1, [r1]
    mov r2, #1

loop:
    str r2, [r0], #4
    subs r1, r1, #1
    ble exit
    add r2, r2, #1
    b loop

exit:
    swi 0x11

