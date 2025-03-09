.text

	  mov r0, #4
cuad: cmp r0, #1
	  movlt pc, lr
	  push {r0, lr}
	  sub r0, #1
	  bl cuad
	  pop {r1, lr}
	  mul r1, r1
	  add r0, r1
	  mov pc, lr
	  
	.end
	
	  