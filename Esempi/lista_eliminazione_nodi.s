@ Scrivere una procedura che, data una lista di
@ interi, elimina i nodi in posizione pari e duplica
@ quelli in posizione dispari. Si richiede che il
@ primo nodo della lista resti inalterato.

.data
head:
    .skip 4
n:
    .word 5

.text

.global main
main:
    ldr r1, =head           @ in r1 l'indirizzo della testa della lista
    ldr r2, =n              @ in r2 l'indirizzo dei numeri di interi
    ldr r2, [r2]            @ in r2 il numero di interi da caricare
    cmp r2, #0              @ se r2 = 0
    streq r2, [r1]          @ allora la testa viene impostata a NULL
    beq exit                @ quindi esci   

next_node:
    mov r0, #8              @ alloca 8 bytes per il nuovo nodo
    swi 0x12                @ crea un nuovo nodo
    str r0, [r1]            @ il puntatore viene salvato nul nuovo nodo nella testa della lista
    mov r6, r0              @ copia l'indirizzo del nuovo nodo in r6
    str r2, [r1, #4]        @ quindi inserisci il valore in quel nodo   
    subs r2, r2, #1         @ decrementa r3, che contiene il numero di interi
    movne r1, r6            @ se ci sono altri interi punta al prossimo nodo
    bne next_node           @ ricomincia il ciclo se r3 è diverso da 0
    str r2, [r1]            @ l'ultimo puntatore punta a NULL

exit:
    swi 0x11                @ esce dal programma