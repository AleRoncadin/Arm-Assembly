.global _start
_start:
    mov r0, #1
    mov r1, #2

    cmp r0, r1          ; fa r0 - r1
    bgt greater         ; branch if greater than
    bal default         ; bal = branch always, lo esegue sempre

greater:
    mov r2, #1

default:
    mov r2, #2


