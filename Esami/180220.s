@ Scrivere un programma in assembly per ARM il quale, caricati nei registri r2 e r3 rispettivamente
@ due numeri m e n tali che 0 < n ≤ m, calcola il valore m!/(m−n)! = m(m−1). . .(m−n+ 1) attraverso
@ una procedura ricorsiva che esegue le n − 1 moltiplicazioni e deposita il risultato nel registro r1.


.text
.global main

main:
    mov r2, #10             @ r2 contiene m
    mov r3, #7              @ r3 contiene n
    sub r4, r2, r3          
    add r4, r4, #1          @ r4 = m-n+1
    mov r1, #1              @ r1 serve per il fattoriale

loop:
    mul r1, r1, r2          @ moltiplica r1 per m
    subs r2, r2, #1         @ sottrae m finché diventa m-n+1
    cmp r2, r4              @ se m != m-n+1
    bne loop                @ allora torna nel loop

exit:           
    swi 0x11                @ altrimenti termina il programma
                       





    