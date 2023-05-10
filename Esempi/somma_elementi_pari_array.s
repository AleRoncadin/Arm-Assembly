.global _start

_start:
    ldr r0, =array
    mov r1, #0
    ldr r2, =lenght         // lunghezza array
    ldr r2, [r2]

loop:
    ldr r5, [r0, r1]
    add r3, r3, r5
    add r1, r1, #8
    add r4, r4, #1
    cmp r4, r2, lsr #1      // confronto con la metà della lunghezza
    blt loop
    b exit

exit:
    swi 0x11



.data

array:
    .word 0,1,2,3,4,5,6,7,8,9

lenght:
    .word 10
