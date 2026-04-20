section .text
global _start

_start:
  mov rax, 0xa;
  mov rbx, 0; 
  mov rcx, 0;
  mov rdx, 0;
  mov rsi, 0;
  mov rdi, 0; 

  ; testing results: rax --> rax, rdx
  ;0x40 --> 0x41,1
  ; 5 -> 6,2
  ; x10 -> x11, 1
  ; x7 -> x8,x8
  ; 0 -> 1,1
  ; 1 -> 2,2
  ; 2 -> 3,1
  ; 3 -> 4,4
  ; 4 -> 5,1
  ; 5 -> 6,2
  ; 6 -> 7,1
  ; 7 -> 8,8
  ; 8 -> 9, 1
  ; 9 -> a~10, 2
  ; a~10 -> b~11, 1


  ; the algebraic meaning isn't obvious... so I'm emperically testing...
snippet:
  mov rcx, rax
  shr rcx, 1
  xor rcx, rax

  inc rax

  mov rdx, rax
  shr rdx, 1
  xor rdx, rax

  xor rdx, rcx

after:
  nop ; gdb breakpoint

  ; sys_exit
  mov rax, 60
  xor rdi, rdi
  syscall
