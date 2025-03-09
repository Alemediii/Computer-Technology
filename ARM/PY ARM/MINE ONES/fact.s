.data
dato1: .word 5
res: .word 1

.text
.global main

main: ldr r0, =dato1
		ldr r1, [r0]
		ldr r0, =res
		ldr r2, [r0]
bucle: cmp r1, #0
		beq pupo 
		mul r2, r1
		sub r1, #1
		bl bucle
pupo: push {r2}
		pop {r5}
		b exit
exit: .end