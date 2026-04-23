section .text
global _start

_start:
  mov rax, 0x21
  ; 0,0      (0 1s ??)    zero
  ; 0001~1,1 (1 1)        one!!!
  ; 0010~2,3 (3 0's, 1 1) one!!!
  ; 0011~3,2 (00s 11s) zero
  ; 00000100~4,7  (8 0's - 1 1 = 7 0s)       one
  ; 00000101~5,6  (8 0's - 2 1s = 6 0's)    zero
  ; 00000110~6,4  ^ 
  ; 00000101~7,5 (pattern breaks)  one 
  ; 00000000 00001000~8, 0xf~15 (150s) zero
  ; 00000000 00001001~9, e~14 (14 0s) zero
  ; 00000000 00001010~a~10, c~12 (pattern breaks) zero
  ; 1011~b~11, d~13 one
  ; 1100~c~12, 8
  ; 1101~d~13,9 one
  ; 1110~e~14, b
  ; 1111~f~15, a one
  ; 0x10~16, 0x1f~31
  ; 0x11~17, 0x1e~30
  ; 0x12~18, 0x1c~28
  ; 0x13~19, 0x1d~29
  ; 0x40~64 -> 0x7f~127
  ; ...while small input values may be revealing, I don't see a pattern yet... ie so it must be at the bit level (ie this is about bits, not using bits for decimal-level math)

  ; we know that the iterative formula is the following:
  ; x_n_1 == x_n ⊕ (x_n >> 2^n)
  ; 0xffffffff, 0xaaaaaaaa   1111 1111~ff->aa
  ; 0xeeeeeeee, 0xb4b4b4b4   ee->b4 ie 238-->180
  ; 0xdddddddd, 0x96969696   dd->96 ie 221-->150
  ; 0xcccccccccccccccc, 0x8888888888888888   cc->88
  ; bb,d2
  ; note: most of these results are 2n ie even it don't have a 0 in the result
  ;       and the bit-level folds indicate 2^6 - 1 bits are impacted ie the final 0-bit 
  ;       holds all the info 

  ; ie this does total_parity(rax_0) == 0-bit(rax_*)
  
  mov rbx, 0; 
  mov rcx, 0;
  mov rdx, 0;
  mov rsi, 0;
  mov rdi, 0; 

; let x == rax_0
snippet:
  mov rdx, rax
  shr rdx, 0x1
  xor rax, rdx
  ; rax = x ⊕ (x>>1)

  mov rdx, rax
  shr rdx, 0x2
  xor rax, rdx
  ; rax = (x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2

  mov rdx, rax
  shr rdx, 0x4
  xor rax, rdx
  ; rax = ((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2) ⊕ ((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2)>>4
  
  mov rdx, rax
  shr rdx, 0x8
  xor rax, rdx
  ; rax = (((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2) ⊕ ((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2)>>4)  ⊕  (((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2) ⊕ ((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2)>>4)>>8
 
  mov rdx, rax
  shr rdx, 0x10
  xor rax, rdx
  ; rax = ((((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2) ⊕ ((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2)>>4)  ⊕  (((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2) ⊕ ((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2)>>4)>>8)
  ;     ⊕ ((((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2) ⊕ ((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2)>>4)  ⊕  (((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2) ⊕ ((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2)>>4)>>8)>>0x10

  mov rdx, rax
  shr rdx, 0x20
  xor rax, rdx
  ; rax = {((((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2) ⊕ ((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2)>>4)  ⊕  (((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2) ⊕ ((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2)>>4)>>8)
  ;     ⊕ ((((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2) ⊕ ((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2)>>4)  ⊕  (((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2) ⊕ ((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2)>>4)>>8)>>0x10}
  ;   ⊕
  ;       {((((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2) ⊕ ((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2)>>4)  ⊕  (((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2) ⊕ ((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2)>>4)>>8)
  ;     ⊕ ((((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2) ⊕ ((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2)>>4)  ⊕  (((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2) ⊕ ((x ⊕ (x>>1)) ⊕ (x ⊕ (x>>1))>>2)>>4)>>8)>>0x10}



after:
  nop ; gdb breakpoint

  ; sys_exit
  mov rax, 60
  xor rdi, rdi
  syscall
