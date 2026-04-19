section .text
global _start

_start:
  mov rax, 0x8 ; === 2
  ; f(0x40)=0x15
  ; f(0xa)=0x3
  ; f(0x30)=0x10
  ; f(0x20)=0xa
  ; f(0x9)=0x3
  ; f(0x8)=0x2

  mov rbx, 0; 
  mov rcx, 0;
  mov rdx, 0;
  mov rsi, 0;
  mov rdi, 0; 
; i feel that this necessitates a command bc 
snippet:
  mov rdx, 0xaaaaaaaaaaaaaaab ; not sure why this number yet
  mul rdx
  shr rdx, 1
  mov rax, rdx

after:
  nop ; gdb breakpoint

  ; sys_exit
  mov rax, 60
  xor rdi, rdi
  syscall
