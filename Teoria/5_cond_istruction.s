.global _start
_start:
    mov r0, #2
    mov r1, #4
    cmp r0, r1
    addlt r2, r2, #1
    movge r2, #5

exit:
    swi 0x11
    .end