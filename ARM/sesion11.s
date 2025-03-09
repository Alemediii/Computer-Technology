.data
leds1: .word 0x201
leds2: .word 0x030
button_state: .word 0

.text
main:
  push {lr}
  ldr r1, =leds1
  ldr r0, [r1]
  bl setLEDsStatus
  
  loop:
    ldr r1, =button_state
    mov r0, #0
    bl isButtonPressed
    cmp r0, #1
    beq handle_button_press
    
    b loop

  handle_button_press:
    ldr r1, =button_state
    ldr r0, [r1]
    cmp r0, #3           @ Check if button 3 is pressed
    beq turn_on_odd_leds

    ldr r1, =leds2
    ldr r0, [r1]
    bl setLEDsStatus
    
    b main_exit

  turn_on_odd_leds:
    mov r0, #0x155       @ Set LEDs for odd positions (1, 3, 5, 7, 9)
    bl setLEDsStatus

  main_exit:
    pop {lr}
    bx lr

setLEDsStatus:
  mov r2, #0x202        @ Memory-mapped location of LEDs
  str r0, [r2]
  bx lr

isButtonPressed:
  mov r2, #0x200        @ Memory-mapped location of buttons
  ldr r0, [r2]
  and r0, r0, #1        @ Extract the state of button 0 (LSB)
  bx lr
