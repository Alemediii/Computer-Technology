.data
tam: .word 5
vec: .word 2, 6, -5, 0, 4
sum: .word 0		

.text
.global main
 
main: ldr r0, =tam
		ldr r1, [r0] @loads in r1 the size of the vector
		ldr r0, =vec @loads in r2 the size data of the vec
loop:	cmp r1, #0
		beq salir
		ldr r2, [r0], #4
		bl multi
		add r3, r2 
		sub r1, #1
		b loop
		
multi: mul r2, r2
		bx lr
		
salir: .end