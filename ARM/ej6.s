.data
 numel:      .word 8
 vect:       .word 64,25,9,23,56,77,87,100
 res:        .word 0

 .text
 .global main
 main:       push {lr}
             ldr r0, =vect          @ load addres in r0
             ldr r1, =numel          
             ldr r1, [r1]           @ load number of elements into r1
             ldr r4, =res           @ load address result into r4
             bl evencount           @ call function
             str r0, [r4]           @ store result
             bx lr                  @ Finish program
            
 iseven:     @Code to check if the number is even or not.
             @ evencount should call this code. You do not have to modify
             mov r1, r0
             mov r2, #1
             and r3, r2, r1
             eor r0, r3, #1
             bx lr
  
 evencount:
		push {r5-r7, lr}
		mov r5, r1
		mov r6, #0
		mov r7, r0
		ldr r0, [r7], #4
		
loop: 
		cmp r5, #0
		moveq r0, r6
		beq salir
		bl iseven
		cmp r0, #1
		addeq r6, r6, #1
		sub r5, r5, #1
		ldr r0, [r7], #4
		b loop

salir:
	mov r0, r6
	pop {r5-r7, lr}
	bx lr