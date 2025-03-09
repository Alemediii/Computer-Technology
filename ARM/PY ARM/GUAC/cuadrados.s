.data
 mynumr:     .word 8
 res:        .word 0
.text
        ldr r0, =mynumr
		ldr r0, [r0]
cuad:   cmp r0, #1      @ for acabado
        movlt r0, #1    @lt 1 to r0
        sublt r0, #1
        movlt pc, lr    @ move pointer
        push {r0, lr}   
        sub r0, r0, #1  @ r0 -1 
        bl cuad         @ goto link cuad
        pop {r1, lr}
        mul r1, r1, r1      
        add r0, r1, r0  @ r0 = r0 + r1
        mov pc, lr
.end