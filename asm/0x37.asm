section .text
global _start

_start:
  mov rax, 0xf000;
  ; 0xffff, 0
  ; 0x0, 0x80
  mov rbx, 0; 
  mov rcx, 0;
  mov rdx, 0;
  mov rsi, 0;
  mov rdi, 0; 

snippet:
  mov rdx, rax
  not rdx
  mov rcx, 0x8080808080808080
  ; (1000 0000 1000 0000)(1000 0000 1000 0000)(1000 0000 1000 0000)(1000 0000 1000 0000)
  and rdx, rcx
  mov rcx, 0x0101010101010101
  ; (0000 0001 0000 0001)(0000 0001 0000 0001)(0000 0001 0000 0001)(0000 0001 0000 0001)
  sub rax, rcx
  and rax, rdx

  ; (1000 0000 1000 0000)(1000 0000 1000 0000)(1000 0000 1000 0000)(1000 0000 1000 0000)
  ; (0000 0001 0000 0001)(0000 0001 0000 0001)(0000 0001 0000 0001)(0000 0001 0000 0001)
after:
  nop ; gdb breakpoint

  ; sys_exit
  mov rax, 60
  xor rdi, rdi
  syscall
