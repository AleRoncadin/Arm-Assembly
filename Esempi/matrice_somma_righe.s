.data

matrice:
    .word 1,3,5,7,8,6,8,1,1,4,1,5
m_righe:
    .word 3
n_colonne:
    .word 4
array:
    .skip 12        @ L'array contiene le somme delle righe, quindi 3 somme
                    @ Riservo 12 Byte

.text

.global main

main:
    ldr r0, =matrice
    ldr r1, =m_righe
    ldr r1, [r1]
    ldr r2, =n_colonne
    ldr r2, [r2]
    ldr r3, =array

    mov r4, #0              @ Contatore per ogni n-1 elementi
    sub r5, r2, #1          @ Contiene il valore n-1
    mov r6, #0              @ Registro per le somme
    mul r7, r1, r2          @ Lunghezza della matrice


loop:
    ldr r9, [r0], #4        @ Prende l'elemento della matrice
    add r6, r6, r9          @ Somma il valore con quello precedente
    add r4, r4, #1          @ Incrementa il contatore

    cmp r4, r2              @ Se il contatore è pari a n
    streq r6, [r3], #4      @ Inserisci nell'array la somma della riga
    moveq r4, #0            @ Azzera il contatore degli n-1 elementi
    moveq r6, #0            @ Azzera il registro delle somme

    subs r7, r7, #1         @ Decrementa il contatore della lunghezza
    ble exit                @ Se è pari a 0, allora termina

    b loop                  @ Altrimenti ricomincia il loop

exit:
    swi 0x11                 


