// Scrivere un programma in assembly per ARM, il quale trova il valore massimo tra n elementi contenuti in
// un file testuale di nome inputLista.txt. 
// Il file contiene il numero n di elementi nella prima riga e n valori interi nelle righe successive. 
// Al termine dell’esecuzione il programma avr`a restituito in memoria l’indice dell’elemento
// di valore massimo, oppure il valore -1 se il file contiene 0 elementi. 
// Nel caso in cui nel file esista pi`u di un elemento di valore massimo il programma restituir`a 
// l’indice del primo massimo presente nel file

.data
file:
    .asciz "inputLista.txt"
output:
    .skip 4              @ Riserva spazio di memoria per memorizzare il risultato

.text
.global main

main:
    ldr r0, =stringa  @ Carica l'indirizzo della stringa di input nel registro r0
    mov r1, #0  @ Imposta il registro r1 a 0 per indicare la modalità di lettura del file
    swi 0x66  @ Apre il file in modalità di lettura e salva il nome del file restituito in r0

    mov r2, r0  @ Salva il nome del file in r2
    swi 0x6c  @ Legge il numero di interi dal file e salva il valore restituito in r3

    mov r5, #0x80000000  @ Inizializza il valore massimo a -2^31
    mov r4, #0  @ Inizializza l'indice corrente a 0
    mov r6, #0xFFFFFFFF  @ Inizializza l'indice del valore minimo a -1

loop:
    subs r3, r3, #1  @ Decrementa il registro r3 e controlla lo stato del flag di risultato
    blt exit  @ Se il flag è negativo, esce dal ciclo e salta alla sezione "exit"

    add r4, r4, #1  @ Incrementa l'indice corrente
    mov r0, r2  @ Carica il nome del file nel registro r0
    swi 0x6c  @ Legge il prossimo intero dal file e salva il valore restituito in r0

    cmp r5, r0  @ Confronta il valore corrente con il valore minimo finora trovato
    movlt r5, r0  @ Se il valore corrente è minore, aggiorna il valore minimo
    movlt r6, r4  @ Se il valore corrente è minore, aggiorna l'indice corrispondente

    b loop  @ Torna all'inizio del ciclo

exit:
    mov r0, r2  @ Carica il nome del file nel registro r0
    swi 0x68  @ Chiude il file

    ldr r0, =output  @ Carica l'indirizzo della sezione di memoria "output" nel registro r0
    str r6, [r0]  @ Salva l'indice del valore minimo nella sezione di memoria "output"

    swi 0x11  @ Esce dal programma