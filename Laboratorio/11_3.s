.data

array1: 
    .skip 64
file1:
    .asciz "f1.txt"
    
file2:
    .asciz "f2.txt"
array2:
    .word 1,2,3,4,5,6
length2:
    .word 6

SWI_Open_File:
    .equ 0x66
SWI_Close_File:
    .equ 0x68
SWI_Write_Int:
    .equ 0x6b
SWI_Read_Int:
    .equ 0x6c
SWI_Exit:
    .equ 0x11

.text

.global main

main:

    ldr r0, =file1
    bl read_int             @ Passa all'es. 11_1

    ldr r0, =file2
    ldr r1, =array
    ldr r2, =length
    bl write_int            @ Passa all'es. 11_2

    ldr r0, =file1
    ldr r1, =file2
    bl copy_values          @ Passa all'es. 11_3

read_int:
    mov r1, #0              @ 0 sta per read mode
    swi SWI_Open_File       @ apre file1
    mov r2, r0              @ salva l'handle del file in r2
    swi SWI_Read_Int        @ leggi la lunghezza, quindi la inserisce in r0
    mov r3, r0              @ salva lunghezza in r3, r3 quindi è il contatore della lunghezza
    ldr r6, =array1
    mov r1, r3

read_int_loop:
    mov r0, r2              @ metti il nome del file in r0
    swi SWI_Read_Int        @ leggi l'integer dal file
    str r0, [r6], #4        @ store integer
    subs r3, r3, #1         @ decrementa r3, ovvero il contatore della lunghezza
    bne read_int_loop       @ ricomincia il loop se r3=0
    mov r0, =file1          @ in r0 va il nome del file così posso chiudere il file
    swi SWI_Close_File      @ chiude il file1
    ldr r0, =array1         @ r0 ora contiene l'indirizzo del vettore
    mov r6, r0              @ anche r6 ora contiene l'indirizzo del vettore
    mov pc, lr              @ torna nel main

write_int:
    mov r2, [r2]            @ r2 contiene la lunghezza del vettore
    mov r3, r1              @ r3 ora contiene l'indirizzo base del vettore
    mov r1, #1              @ 1 sta per write mode
    swi SWI_Open_File       @ apre il file in write mode
    mov r1, r2              @ metti in r1 la lunghezza per caricarla nel file
    swi SWI_Write_Int       @ scrivi nel file la lunghezza

write_int_loop:
    ldr r4, [r3], #4        @ Salva il r4 l'elemento del vettore
    mov r1, r4              @ metti in r1 l'intero da mettere poi nel file
    swi SWI_Write_Int       @ Scrivi l'elemento nel file
    subs r2, r2, #1         @ decrementa il vettore che contiene la lunghezza
    bne write_int_loop      @ ricomincia il loop se r3=0
    mov r0, =file2          @ r0 ora contiene l'indirizzo del vettore
    swi SWI_Close_File      @ anche r6 ora contiene l'indirizzo del vettore
    mov pc, lr              @ torna nel main

copy_values:
    mov r1, #0              @ per aprire il primo file in read mode
    swi SWI_Open_File       @ apre il file1
    swi SWI_Read_Int        @ legge il primo elemento in r0
    mov r3, r0              @ sposta in r3, il primo elemento, ovvero la lunghezza
    swi SWI_Close_File      @ chiudi file1

    ldr r0, =file2          @ ora r0 contiene il nome del secondo file
    mov r1, #1              @ per aprire il secondo file in write mode
    swi SWI_Open_File       @ apre il file2

copy_values_loop:
    ldr r1, [r6], #4        @ Carica in r1 l'elemento che verrà poi salvato nel file2
    swi SWI_Write_Int       @ Salva il valore nel file2
    subs r3, r3, #1         @ sottrai la lunghezza
    bne copy_values_loop    @ continua il loop finchè non r3=0
    swi SWI_Close_File      @ chiudi file2
    swi SWI_Exit            @ termina il programma