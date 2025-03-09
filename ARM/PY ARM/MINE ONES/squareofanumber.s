.data
dato1: .word 5
res: .word 0

.text
.global main
main: ldr r0, =dato1
		ldr r1, [r0]
		
		bl cuadrado
		ldr r0, =res
		str r2, [r0]
		
cuadrado:	
		mul r2, r1, r1
		bx lr