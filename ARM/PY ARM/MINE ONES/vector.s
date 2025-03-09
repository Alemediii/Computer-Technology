.data
tam: .word 5
vec: .word 4, 6, -5, 1, 0
sum: .word 0		

.text
.global main

main: ldr r0, =tam
		ldr r1, [r0]
		ldr r2, =vec
loop:	cmp r1, #0
		beq salir
		ldr r4, [r2], #4
		add r3, r4
		sub r1, #1
		b loop
		
salir: ldr r0, =sum
		 str r3, [r0]
		 bx lr