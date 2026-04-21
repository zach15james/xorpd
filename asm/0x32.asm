section .text
global _start

_start:
  mov rax, 0xffffff41
  ; rax start, rax end
  ; result 0 for inputs: 0,1
  ; 
  mov rbx, 0; 
  mov rcx, 0;
  mov rdx, 0;
  mov rsi, 0;
  mov rdi, 0; 

snippet:
  mov rcx, rax

  mov rdx, rax
  shr rdx, 1
  xor rax, rdx

  popcnt rax, rax
  xor rax, rcx
  and rax, 1
   

after:
  nop ; gdb breakpoint

  ; sys_exit
  mov rax, 60
  xor rdi, rdi
  syscall
