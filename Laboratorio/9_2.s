@ Scrivere del codice assembly ARM che, nella sezione.data, definisca un vettore di 3 
@ numeri interi, e nella sezione .text contenga un programma che sostituisce ogni
@ valore nel vettore con il suo quadruplo.

.data
array:
        .word 1,2,3
lenght:
        .word 3

.text
.global main

@ METODO 1

main:
        ldr r0, =array
        ldr r1, =lenght
        ldr r1, [r1]

loop:
        ldr r4, [r0]
        mov r4, r4, lsl #2
        str r4, [r0], #4
        subs r1, r1, #1
        bgt loop
        ble exit

exit:
        swi 0x11



@ METODO 2

@main:
@        ldr r0, =array
@        ldr r1, =lenght
@        ldr r1, [r1]
@        sub r1, r1, #1
@        mov r2, #0              @ Contatore per la lunghezza dell'array
@        mov r3, #0
@
@loop:
@        cmp r2, r1
@        bgt exit
@        ldr r4, [r0, r3]
@        mov r4, r4, lsl #2
@        str r4, [r0, r3]
@        add r3, r3, #4
@        add r2, r2, #1
@        b loop
@
@exit:
@        swi 0x11



@ METODO 3

@main:
@        ldr r0, =array
@        ldr r1, =lenght
@        ldr r1, [r1]
@        mov r2, #0
@
@loop:
@        ldr r4, [r0, r2]
@        mov r4, r4, lsl #2
@        str r4, [r0, r2]
@        add r2, r2, #4
@        subs r1, r1, #1
@        bgt loop
@        ble exit
@
@exit:
@        swi 0x11