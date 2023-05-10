@ Scrivere del codice assembly ARM che, nella sezione .data, definisca un vettore di 3 
@ numeri interi, e nella sezione .text contenga un programma che sostituisce il
@ vettore con una sua rotazione in cui ogni elemento viene spostato in avanti di una
@ locazione. 1 6 7 2 --> 2 1 6 7

.data
array: 
    .word 1, 6, 7, 2        @ --> 2, 1, 6, 7

.text
.global main

main:
    ldr r0, =array
    ldmia r0!, {r1, r2, r3, r4}     @ r1=1, r2=6, r3=7, r4=2
    str r4, [r0]                    @ carica 2 in [r0]
    str r3, [r0, #12]               @ carica 7 in [r0, #12]
    str r2, [r0, #8]                @ carica 6 in [r0, #8]
    str r1, [r0, #4]                @ carica 1 in [r0, #4]
    swi 0x11

@ main:
@     ldr r0, =array
@     ldr r1, =lenght
@     ldr r1, [r1]            @ r1 = 4
@     sub r1, r1, #1          @ r1 = 3
@ 
@     mov r2, #0              @ Carica in r2 l'indirizzo attuale
@ 
@     mov r3, #4              @ Carica in r3 il prossimo indirizzo
@ 
@     mov r4, #0              @ Contatore
@ 
@     mov r5, r1, lsl #2      @ In r5 c'è l'indirizzo dell'ultimo elemento
@ 
@ loop:
@ 
@     cmp r4, r1              @ 3-3
@     bgt exit
@     
@     cmp r2, r5              @ 12-12
@     moveq r3, #0            @ r3 = 0
@ 
@     ldr r6, [r0, r2]
@     ldr r7, [r0, r3]
@     str r6, [r0, r3]
@ 
@     add r4, r4, #1
@     add r2, r2, #4
@     add r3, r3, #4
@     b loop
@ 
@ exit:
@     swi 0x11