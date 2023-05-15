.data
head:
    .skip 4
value:
    .skip 4
file:
    .asciz "inputLista.txt"

.text
.global create_list

create_list:
    ldr r4, =head           @ carica l'indirizzo della testa della lista in r4
    ldr r0, =stringa        @ carica in r0 l'indirizzo dell'handle del file 
    mov r1, #0              @ specifica in r1 che il file viene aperto in read mode
    swi 0x66                @ apri file in read mode
    mov r2, r0              @ salva in r2 l'handle del file
    swi 0x6c                @ leggi il numero di interi presenti nel file
    movs r3, r0             @ salva il numero di interi in r3 e com movs controlla se è uguale a 0
    streq r3, [r4]          @ se la lista è vuota allora la testa viene impostata a NULL
    beq exit                @ esci se la lista è vuota

next_node:
    mov r0, #8              @ alloca 8 bytes per il nuovo nodo
    swi 0x12                @ crea un nuovo nodo
    str r0, [r4]            @ il puntatore viene salvato nul nuovo nodo nella testa della lista
    mov r6, r0              @ copia l'indirizzo del nuovo nodo in r6
    mov r0, r2              @ carica in r0 il nome del file
    swi 0x6c                @ leggi l'intero dal file
    mov r5, r0              @ salva l'intero dal file
    str r5, [r6,#4]         @ quindi inserisci il valore in quel nodo
    subs r3, r3, #1         @ decrementa r3, che contiene il numero di interi
    movne r4, r6            @ se ci sono altri interi punta al prossimo nodo
    bne next_node           @ ricomincia il ciclo se r3 è diverso da 0
    str r3, [r6]            @ l'ultimo puntatore punta a NULL

exit:
    swi 0x11
