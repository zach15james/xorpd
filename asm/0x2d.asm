section .text
global _start

_start:
  mov rax, 0x6
  ; 16,32,64->0
  ; 3->2
  ; 5->4
  ; 0x12~18->10
  ; 9->8
  ; 7->6
  ; 6->4
  mov rbx, 0; 
  mov rcx, 0;
  mov rdx, 0;
  mov rsi, 0;
  mov rdi, 0; 

snippet:
  mov rdx, rax
  dec rax
  and rax, rdx

after:
  nop ; gdb breakpoint

  ; sys_exit
  mov rax, 60
  xor rdi, rdi
  syscall
