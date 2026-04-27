section .text
global _start

_start:
  mov rax, 0x0;
  mov rbx, 0x0
  mov rcx, 0x0
  mov rdx, 0;
  mov rsi, 0;
  mov rdi, 0; 

snippet:
  
  ; need to verify the cf != 0 cases
  xor rax, rbx
  xor rbx, rcx
  mov rsi, rax
  add rsi, rbx
  cmovc rax, rbx
  xor rax, rbx
  cmp rax, rsi

after:
  nop ; gdb breakpoint

  ; sys_exit
  mov rax, 60
  xor rdi, rdi
  syscall


