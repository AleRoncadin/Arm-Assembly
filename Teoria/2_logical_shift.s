.global _start
_start:
	mov r0, #10 // 10 = 1010 in binario
	mov r1, #10
	mov r2, #15 // 15 = 1111 in binario
	
	// facendo così r0 cambia valore
    lsl r0, #1	// 20 = 10100 in binario (è raddoppiato)
	lsr r0, #1	// 10 = 1010 in binario (è dimezzato)
	
	ror r2, #1	// 2147483655 = 10000000000000000000000000000111 in binario
				//              1000|0000|0000|0000|0000|0000|0000|0111
			    //               8   0     0   0    0    0    0    7
			    //  2147483655 = 80000007 in hex          
	
	// in questo modo, il registro iniziale rimane invariato
	mov r3, r1, lsl #1
	mov r4, r2, lsl #1
