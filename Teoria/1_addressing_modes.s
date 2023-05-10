.global _start
_start:
	ldr r0, =list
	ldr r1, [r0]
	ldr r2, [r0,#4]   // incrementa
    ldr r3, [r0,#8]!  // pre-incrementa
    ldr r4, [r0],#8   // post-incrementa
	
.data
list: .word 4,5,6,-9,1,0,2,-3