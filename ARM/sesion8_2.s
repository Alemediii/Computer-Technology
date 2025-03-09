.data

tam: .word 8
pos: .word 0
vector: .word 2, -3, 6, 5, -4, 8, 1, 0
val: .word -4

.text
.global main
main: ldr r0, =tam
		ldr r1, [r0]
		ldr r2, =vector
		ldr r0, =val
		ldr r3, [r0]  @we store the value to compare in r3
		ldr r0, =pos
		
		mov r5, #0
		bl search_loop

		str r5, [r0]
		b end
		
search_loop:
		cmp r5, r1                    @ Compare counter with vector size
		bge search_not_found          @ If counter >= vector size, the search is unsuccessful

		ldr r4, [r2], #4      @ Load the value at vector[r3] into r4
		cmp r4, r3                    @ Compare the value with the target
		beq found_position            @ If equal, the position is found

		add r5, r5, #1                @ Increment counter
		b search_loop                 @ Repeat the loop
		
		
search_not_found: mov r3, #-1			
found_position: bx  lr

end: .end