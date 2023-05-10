.global _start
_start:
    mov r0, #1
    mov r1, #2
    bl add2             ; con bl, finita la funzione torna dove era
    mov r3, #4

add2:
    add r2, r0, r1
    bx lr


; in poche parole, in questo codice viene messo il return
; quindi finita la funzione torna a dove era nel main