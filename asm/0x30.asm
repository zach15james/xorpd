section .text
global _start

_start:
  mov rax, 0x80 ;;;; only relevant
  mov rbx, 0; 
  mov rcx, 0;
  mov rdx, 0x7f ;;;; only relevant
  ; (rax,rdx) -> (rax_final, rdx_final)....
  ; 5,5 -> no change (nor to the flags)
  ; 4,5 same
  ; 0x40~64, 5 -> 0, 5
  ; 0x40, 0x3f -> 0, 0x3f
  ; 0x30, 0x3f -> no change
  ; 0x80, 0x3f -> 0, 0x3f
  ; ie so if its a power of 16^n --> 0???
  ; 0x80, 0x80 stays same
  ; 0x80, 0x7f -> 0, 0x7f
  ; ie so likely its if one of them ====== 16^k (for some k in N) & other isn't, then wipe the 16^k one ? 
  mov rsi, 0;
  mov rdi, 0; 

snippet:
  and rax, rdx

  sub rax, rdx
  and rax, rdx

  dec rax
  and rax, rdx

after:
  nop ; gdb breakpoint

  ; sys_exit
  mov rax, 60
  xor rdi, rdi
  syscall
