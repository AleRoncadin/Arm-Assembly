.data
seq: 
    .word 0b110011
len: 
    .word 6

.text
.global main

main:
    ldr r1, =seq      @ Carica l'indirizzo della sequenza in r1
    ldr r2, =len      @ Carica l'indirizzo della lunghezza in r2
    ldr r2, [r2]      @ Carica la lunghezza in r2
    sub r2, r2, #1    @ Sottrae 1 dalla lunghezza per ottenere l'ultimo indice della sequenza

    mov r3, #0        @ Inizializza un contatore a 0

check:
    cmp r2, r3        @ Controlla se l'indice più grande ha superato quello più piccolo
    blt is_palindrome @ Se sì, è palindromo

    ldr r4, [r1, r3]  @ Carica il byte alla posizione specificata dal contatore più piccolo
    ldr r5, [r1, r2]  @ Carica il byte alla posizione specificata dall'indice più grande
    cmp r4, r5        @ Confronta i due byte
    bne not_palindrome @ Se sono diversi, non è palindromo

    add r3, r3, #1    @ Incrementa il contatore più piccolo
    sub r2, r2, #1    @ Sottrae 1 dall'indice più grande
    b check

is_palindrome:
    mov r0, #1        @ Imposta il registro r0 a 1 per indicare che è palindromo
    b end

not_palindrome:
    mov r0, #0        @ Imposta il registro r0 a 0 per indicare che non è palindromo

end:
    swi 0x11          @ Termina il programma
