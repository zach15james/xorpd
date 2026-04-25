section .text
global _start

_start:
  mov rax, 0x6; is set!
  mov cl, 0 ; not sure what this does
  mov rbx, 0; 
  mov rcx, 0;
  mov rdx, 0;
  mov rsi, 0;
  mov rdi, 0; 
;0, 0x7ffff...ff;
;1,2;
;2,4;
;3,5;
;4,8;
;5,6;
;6,9;
;7,b~11
;8,0x10~16
;9, a~10
;10~a, c~12
;11~b,13~d
; had ai convert the format for this from the asm loop (manually doing it is just delusional) for the following
;12,11
;13,e
;14,18
;15,17
;16,20
;17,12
;18,14
;19,15
;1a,1c
;1b,1d
;1c,23
;1d,1e
;1e,27
;1f,2f
;20,40
;21,22
;22,24
;23,25
;24,28
;25,26
;26,29
;27,2b
;28,30
;29,2a
;2a,2c
;2b,2d
;2c,31
;2d,2e
;2e,33
;2f,37
;30,41
;31,32
;32,34
;33,35
;34,38
;35,36
;36,39
;37,3b
;38,43
;39,3a
;3a,3c
;3b,3d
;3c,47
;3d,3e
;3e,4f
;3f,5f
;40,80

; testing loop
mov r12, 0

test_loop: 
  mov rax, r12

snippet:
  bsf rcx, rax

  mov rdx, rax
  dec rdx
  or rdx, rax

  mov rax, rdx
  inc rax

  mov rbx, rdx
  not rbx
  inc rdx
  and rdx, rbx
  dec rdx
  
  shr rdx, cl
  shr rdx, 1

  or rax, rdx

after:
  nop ; gdb breakpoint

  ; for the looping of inputs
  inc r12
    cmp r12, 0x41
    jb test_loop

  ; sys_exit
  mov rax, 60
  xor rdi, rdi
  syscall
