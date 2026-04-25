section .text
global _start

_start:
  mov rax, 0
  mov cl, 0 
  mov rbx, 0; 
  mov rcx, 0;
  mov rdx, 0;
  mov rsi, 0;
  mov rdi, 0;
  
; before testing loop
  mov r12, 0

test_loop: 
  mov rax, r12

snippet:
  mov rdx, rax
  neg rdx
  and rax, rdx

  mov rdx, 0x218a392cd3d5dbf
  mul rdx
  shr rax, 0x3a
  
  ;xlatb ; there needs to be an actual lookup table here... and i dont' have the time to implement that separately for this example to work, but the concept of getting the lowest set bit via the de Bruijn seq of al is undersood and thus i don't even need to emperically look this up

after:
  nop ; gdb breakpoint

  ; for the looping of inputs
  inc r12
    cmp r12, 0x41
    jb test_loop

  ; sys_exit
  mov rax, 60
  xor rdi, rdi
  syscall

