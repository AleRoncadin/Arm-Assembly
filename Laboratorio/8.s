@ Scrivere un programma assembly che, dopo aver immesso in memoria 
@ mediante una dichiarazione nella sezione .data quattro numeri interi n1, 
@ n2, n3, n4 (di cui 3 negativi e 1 positivo), inserisca nei registri r0, r1, r2, r3, r4 
@ rispettivamente i seguenti valori: 
@ 1. la somma dei valori n1, n2, n3, n4 
@ 2. la media dei valori n1, n2, n3, n4 (arrotondando sempre verso -∞) 
@ 3. il risultato dell’operazione (2^10 + 1) ∗ n1 
@ 4. il resto r della divisione di n1 per 16, inteso come n1 = (n1/16) * 16+r 
@ 5. il segno di n1, ossia il valore 0 se n1 è positivo o il valore 1 se n1 è 
@ negativo.


.data
numeri: 
    .word -1, -8, 3, 4

.text
main:   
    ldr r0, =numeri
    ldr r1, [r0]
    ldr r2, [r0, #4]
    ldr r3, [r0, #8]
    ldr r4, [r0, #12]

    add r6, r1, r2
    add r6, r6, r3
    add r6, r6, r4              @ somma di tutti i numeri

    mov r7, r6, asr #2          @ divisione per 4 per ottenere la media

    add r2, r6, r6, lsl #10     @ esegue n1 + (n1 x 2^10)

    mov r8, r1, lsr #31         @ sposto a sinistra di 31 bit per il segno