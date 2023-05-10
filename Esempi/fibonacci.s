.global _start

_start:
    mov r0, =n
    mov r0, [r0]
    mov r2, #0
    cmp r0, r1
    moveq r1, #0
    mov r2, #1
    cmp r0, r1
    moveq r1, #1
    bgt fib
    b exit

fib:
    sub r3, r0, #1
    sub r4, r0, #2
    add r4, r3, r4
    mov r1, r4
    b exit

exit:
    swi 0x11
    .end


.data

n:
    .word 8