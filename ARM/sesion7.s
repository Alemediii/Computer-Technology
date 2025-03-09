.data
fib: .word 0
n: .word 5
ant1: .word 0
ant2: .word 1

.text
.global main
main:
    ldr r0, =n
    ldr r1, [r0]          @ Load the value of n into r1
    ldr r0, =ant1
    ldr r2, [r0]         
    ldr r0, =ant2
    ldr r3, [r0]       
    
    mov r5, #0            
    bl fibonacci
    
	mov r4, r2 
    ldr r0, =fib
    str r4, [r0]          @ Store the value of ant1 (fib) into fib
    b end

fibonacci:
    cmp r5, r1           
    beq ret               @ If counter >= n, return
    
    add r4, r2, r3        @ Calculate the next Fibonacci number
    mov r2, r3           
    mov r3, r4           
    add r5, r5, #1        @ Increment counter
    b fibonacci           @ Repeat the loop

ret:
    bx lr                 @ Return

end:
    .end
