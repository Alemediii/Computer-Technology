.global main

main:
    @ Prompt user for input
    mov r0, #0       @ r0 will hold the user's input
    bl printf
    ldr r0, =scanf_format
    ldr r1, =input_buffer
    bl scanf

    @ Calculate the nth Fibonacci number
    ldr r1, =n       @ r1 will hold the nth Fibonacci number
    ldr r0, =input_buffer
    ldr r0, [r0]
    bl fib

    @ Print the result
    ldr r0, =output_format
    ldr r1, =n
    ldr r2, [r1]
    ldr r1, =result
    ldr r3, [r1]
    bl printf

    @ Exit the program
    mov r0, #0
    bx lr

fib:
    cmp r0, #0
    beq base_case
    cmp r0, #1
    beq base_case
    sub r4, r0, #1
    sub r5, r0, #2
    ldr r0, =fib
    mov r1, r4
    bl fib
    mov r2, r0
    ldr r0, =fib
    mov r1, r5
    bl fib
    add r0, r0, r2
    bx lr

base_case:
    mov r0, #1
    bx lr

.data
n:      .word   0
result: .word   0
input_buffer: .skip 4
scanf_format: .asciz "%d"
output_format: .asciz "Fibonacci number %d: %d\n"