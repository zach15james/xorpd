section .text
global _start

_start:
  mov rax, 0xa0a0
  ; 0xffff, 0
  ; 0x0, 0x80
  ; start:  0xf000 4444 0000 aaaa,
  ; finish: 0x0080 0000 8080 0000

  ; s: 0xaaaa ffff 0000 0000
  ; f: 0x0000 0000 8080 8080
  
  ; s: 0x1111222233334444
  ; f: 0x000..0

  ; s: 0x0000555566667777
  ; f: 0x8080 0000 0000 0000

  ; s: 0x88889999bbbbcccc
  ; f: 0x0000 0000 0000 0000

  ; s: 0xa0[00] bb[00] ccc0 00dd ==> implies that it marks the 0-bytes w/ the 80
  ; f: 0x00[80] 00[80] 0000 [80]00
  ; s: a0a0 --> (80's for the leading 0's) 0000

  mov rbx, 0; 
  mov rcx, 0;
  mov rdx, 0;
  mov rsi, 0;
  mov rdi, 0; 

snippet:
  mov rdx, rax
  not rdx
  mov rcx, 0x8080808080808080 ; isolates the highest bit of every byte
  ; (1000 0000 1000 0000)(1000 0000 1000 0000)(1000 0000 1000 0000)(1000 0000 1000 0000)
  and rdx, rcx
  mov rcx, 0x0101010101010101 ; subtracts 1 from every byte section
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
