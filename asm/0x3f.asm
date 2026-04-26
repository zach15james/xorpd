section .text
global _start

_start:
  mov rax, 0x0ff0000030000000 ; ie lsb = 0-index of 28 
  mov cl, 0 ; not sure what this does
  mov rbx, 0; 
  mov rcx, 0;
  mov rdx, 0;
  mov rsi, 0;
  mov rdi, 0;

; setup testing loop
mov r12, 0

; testing loop in itself
;test_loop:
;  mov rax, r12

snippet:
  
  mov rbx, 3
  mov r8, rax
  mov rcx, rax
  dec rcx

  and rax, rcx
  xor edx, edx
  div rbx
  mov rsi, rdx

  mov rax, r8
  or rax, rcx
  xor edx, edx
  div rbx
  inc rdx
  cmp rdx, rbx
  sbb rdi, rdi

  bsf rax, r8


after:
  nop ; gdb breakpoint

  ; for the looping of inputs
;  inc r12
;    cmp r12, 0x41
;    jb test_loop

  ; sys_exit
  mov rax, 60
  xor rdi, rdi
  syscall


  ; output of the loop (not very helpful... need more full register to see what happens):

; rax start (x) = 0x0000000000000000
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x5555555555555555

; rax start (x) = 0x0000000000000001
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000002
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000001

; rax start (x) = 0x0000000000000003
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000004
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000002

; rax start (x) = 0x0000000000000005
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0x0000000000000000
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000006
; rsi end (& remainder) = 0x0000000000000001
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000001

; rax start (x) = 0x0000000000000007
; rsi end (& remainder) = 0x0000000000000001
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000008
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000003

; rax start (x) = 0x0000000000000009
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x000000000000000a
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000001

; rax start (x) = 0x000000000000000b
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0x0000000000000000
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x000000000000000c
; rsi end (& remainder) = 0x0000000000000001
; rdi end (or remainder) = 0x0000000000000000
; rax end (bsf) = 0x0000000000000002

; rax start (x) = 0x000000000000000d
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x000000000000000e
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000001

; rax start (x) = 0x000000000000000f
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000010
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000004

; rax start (x) = 0x0000000000000011
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000012
; rsi end (& remainder) = 0x0000000000000001
; rdi end (or remainder) = 0x0000000000000000
; rax end (bsf) = 0x0000000000000001

; rax start (x) = 0x0000000000000013
; rsi end (& remainder) = 0x0000000000000001
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000014
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000002

; rax start (x) = 0x0000000000000015
; rsi end (& remainder) = 0x0000000000000001
; rdi end (or remainder) = 0x0000000000000000
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000016
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000001

; rax start (x) = 0x0000000000000017
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0x0000000000000000
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000018
; rsi end (& remainder) = 0x0000000000000001
; rdi end (or remainder) = 0x0000000000000000
; rax end (bsf) = 0x0000000000000003

; rax start (x) = 0x0000000000000019
; rsi end (& remainder) = 0x0000000000000001
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x000000000000001a
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000001

; rax start (x) = 0x000000000000001b
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x000000000000001c
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000002

; rax start (x) = 0x000000000000001d
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x000000000000001e
; rsi end (& remainder) = 0x0000000000000001
; rdi end (or remainder) = 0x0000000000000000
; rax end (bsf) = 0x0000000000000001

; rax start (x) = 0x000000000000001f
; rsi end (& remainder) = 0x0000000000000001
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000020
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000005

; rax start (x) = 0x0000000000000021
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000022
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000001

; rax start (x) = 0x0000000000000023
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0x0000000000000000
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000024
; rsi end (& remainder) = 0x0000000000000001
; rdi end (or remainder) = 0x0000000000000000
; rax end (bsf) = 0x0000000000000002

; rax start (x) = 0x0000000000000025
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000026
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000001

; rax start (x) = 0x0000000000000027
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000028
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000003

; rax start (x) = 0x0000000000000029
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0x0000000000000000
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x000000000000002a
; rsi end (& remainder) = 0x0000000000000001
; rdi end (or remainder) = 0x0000000000000000
; rax end (bsf) = 0x0000000000000001

; rax start (x) = 0x000000000000002b
; rsi end (& remainder) = 0x0000000000000001
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x000000000000002c
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000002

; rax start (x) = 0x000000000000002d
; rsi end (& remainder) = 0x0000000000000001
; rdi end (or remainder) = 0x0000000000000000
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x000000000000002e
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000001

; rax start (x) = 0x000000000000002f
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0x0000000000000000
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000030
; rsi end (& remainder) = 0x0000000000000001
; rdi end (or remainder) = 0x0000000000000000
; rax end (bsf) = 0x0000000000000004

; rax start (x) = 0x0000000000000031
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000032
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000001

; rax start (x) = 0x0000000000000033
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000034
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000002

; rax start (x) = 0x0000000000000035
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000036
; rsi end (& remainder) = 0x0000000000000001
; rdi end (or remainder) = 0x0000000000000000
; rax end (bsf) = 0x0000000000000001

; rax start (x) = 0x0000000000000037
; rsi end (& remainder) = 0x0000000000000001
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000038
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000003

; rax start (x) = 0x0000000000000039
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x000000000000003a
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000001

; rax start (x) = 0x000000000000003b
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0x0000000000000000
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x000000000000003c
; rsi end (& remainder) = 0x0000000000000001
; rdi end (or remainder) = 0x0000000000000000
; rax end (bsf) = 0x0000000000000002

; rax start (x) = 0x000000000000003d
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x000000000000003e
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000001

; rax start (x) = 0x000000000000003f
; rsi end (& remainder) = 0x0000000000000000
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000000

; rax start (x) = 0x0000000000000040
; rsi end (& remainder) = 0x0000000000000002
; rdi end (or remainder) = 0xffffffffffffffff
; rax end (bsf) = 0x0000000000000006
