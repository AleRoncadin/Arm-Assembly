.global _start
_start:
    mov r0, #1
    mov r1, #3
    push {r0,r1}
    bl getValue

getValue:
    mov r0, #5
    mov r1, #7
    add r2, r0, r1
    bx lr