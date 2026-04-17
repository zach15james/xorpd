section .text
global _start

_start:
  mov rax, 1;
  mov rbx, 0; 
  mov rcx, 0xf ; 15 iterations of this loop
  mov rdx, 0;
  mov rsi, 0;
  mov rdi, 0; 

snippet:
  ; this is c_n = c_n-1 + d_n-1, d_n = c_n-1 ie fibonacci seq
  .loop:
    xadd rax, rdx 
    ; addition (not in xorpd puzzle):
    ;int 3 
    loop .loop

after:
  nop ; gdb breakpoint

  ; sys_exit
  mov rax, 60
  xor rdi, rdi
  syscall
