.data
array:
    .word 1,2,3,4,5,6
n:
    .word 6

.text

.global main

main:
    ldr r0, =array
    ldr r1, =n
    ldr r1, [r1]
    mov r2, #0

loop:
    ldr r3, [r0], #4
    add r2, r2, r3
    subs r1, r1, #1
    ble exit
    b loop

exit:
    mov r0, r2
    swi 0x11