.data
string: .asciz "This is a test 1, 2, 3"

.text 
main:   ldr a1, =string
        push {lr}
        bl ucase
        pop {lr}
        mov a1,#0
        mov v4,#1
        bx lr
ucase:

mov a3, a1 @Metiendo la direccion de la letra de a1 en a3
ldrb a2, [a3] @Metiendo la letra en a2

loop:
	cmp a2, #97
	blt next
	cmp a2, #122
	bgt next
	
	sub a2, a2, #32
	strb a2, [a3]

next: 
	add a3, a3, #1
	ldrb a2, [a3]
	cmp a2, #0
	bne loop
	
	bx lr
