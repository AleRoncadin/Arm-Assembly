.global _start

_start:
    mov r0, #0
    mov r1, #0
    mov r2, #8
    bl es1
    bl es2
    bl es3
    bl es4

es1:                            @ r1 = 8 * r2
    mov r1, r2, lsl #3
    mov pc, lr                  @ torno nel main

es2:                            @ r1 = r2 / 4
    mov r1, r2, lsr #2
    mov pc, lr                  @ torno nel main

es3:                            @ r1 = 5 * r2
    mov r1, #0
    add r1, r2, r2, lsl #2
    mov pc, lr                  @ torno nel main

es4:                            @ r1 = 3/4 * r2
    mov r1, #0
    mov r0, #0
    add r0, r2, r2, lsl #1      @ moltiplico per 3
    mov r1, r0, lsr #2          @ divido per 4
    mov pc, lr                  @ torno nel main
