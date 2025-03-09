.data
vector: .word 1, 2, 3, 4
sum: .word 0

.text
main: 
	ldr r0, =vector
	mov r1, #4
	bl suma
	ldr r1, =sum
	str r0, [r1]
	bx lr
	
suma:
	push {r3, r4}
	mov r3, #0
	mov r4, #0
	
loop: 
	cmp r4, r1
	bge exit
	ldr r2, [r0], #4
	add r3, r3, r2
	add r4, r4, #1
	b loop
	
exit: 
	mov r0, r3
	pop {r3, r4}
	bx lr