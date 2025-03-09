.data
numel: 		.word 8
vector1: 	.word 8,-3,4,-2,-5,7,6,1
res: 		.word 27

.text
.global main	
main:	ldr r2, =numel
		ldr r2, [r2]
		ldr r3, =vector1

		bl vectequal
		ldr r1, =res
		str r0, [r1]

		mov lr, #0
		bx lr
		
vectequal:	push {r4}
		mov r0, #0		

loop:   cmp r2, #0
		beq end	

		ldr r4, [r3], #4
		cmp r4, #0
		blt nosum
		add r5, r5, r4
		
nosum:	sub r2, r2, #1
		b loop

end:		pop {r4}
		bx lr

		