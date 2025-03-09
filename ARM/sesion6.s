.data
nota1: .word 7
nota2: .word 8
nota3: .word 6
nota4: .word 5
media: .word 0

.text
.global main
main:
    ldr r0, =nota1
    ldr r1, [r0]
    add r2, r2, r1

    ldr r0, =nota2
    ldr r1, [r0]
    add r2, r2, r1

    ldr r0, =nota3
    ldr r1, [r0]
    add r2, r2, r1

    ldr r0, =nota4
    ldr r1, [r0]
    add r2, r2, r1

    mov r3, #4          @ Load divisor (4) into r3
    bl div              @ Branch to division function

    ldr r0, =media      @ Load media address
    str r2, [r0]        @ Store the result in media
	b exit

div:
    mov r4, r2          @ Copy sum to r4
    mov r2, #0          @ Clear r2 for quotient

divide_loop:
    cmp r4, r3          @ Compare sum with divisor
    blt divide_done     @ Branch if sum is less than divisor

    sub r4, r4, r3      @ Subtract divisor from sum
    add r2, r2, #1      @ Increment quotient
    b divide_loop       @ Repeat loop

divide_done:
    bx lr               @ Return

exit: .end