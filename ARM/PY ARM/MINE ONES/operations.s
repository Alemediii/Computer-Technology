.data 
dato1: .word 4
dato2: .word 3
sum: .word 0
mult: .word 0
sub: .word 0

.text
.global main
main: ldr r0, =dato1	
		ldr r1, [r0]
		ldr r0, =dato2
		ldr r2, [r0]
		add r3, r1, r2
		sub r4, r1, r2
		mul r5, r1, r2
		

fin: bx lr