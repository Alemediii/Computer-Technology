.data
tam:   .word 8
datos: .word 2, 4, 6, 8, -2, -4, -6, -7
res:   .word 0

main:

ldr r0, =tam
ldr r1, [r0]
ldr r0, =datos
ldr r2, [r0], #4
sub r1, #1

loop:
cmp r1, #0
beq salir
ldr r3, [r0], #4
cmp r2, r3
movle r2, r3
sub r1, #1
b loop
salir:
ldr r0, =res
str r2, [r0]
bx lr