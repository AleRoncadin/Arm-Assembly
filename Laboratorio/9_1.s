@ Scrivere del codice assembly ARM che, nella sezione .data, definisca un vettore con 
@ 4 valori uguali a 0, e nella sezione .text contenga un programma che sostituisce il
@ vettore con il vettore contenente i primi 4 numeri naturali.

.data
vettore: 
        .word 0, 0, 0, 0
lenght:
        .word 4

.text
.global main

main:
        ldr r0, =vettore
        ldr r1, =lenght
        ldr r1, [r1]            @ In questo caso non serve decrementarlo perché 
                                @ il problema chiede di sostituire i numeri da 1 a 4
        mov r2, #1
        mov r3, #0

loop:   
        cmp r2, r1
        bgt exit                @ non metto bge perché nel main non ho decrementato
        str r2, [r0, r3]
        add r2, r2, #1
        add r3, r3, #4
        b loop

exit:  
        swi 0x11
