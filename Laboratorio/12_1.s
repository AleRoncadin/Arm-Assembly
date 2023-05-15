.data

array:
    .word 3,1,-1,0,-2,2,-3      @ vettore con numeri da -3 a 3
length:
    .word 5
SWI_Exit:
    .equ 0x11

.text

.global main

main:
    ldr r0, =array
    ldr r1, [r1]                @ r1 contiene la lunghezza

loop:
    ldr r3, [r0], #4
    cmp r3, #0
    
