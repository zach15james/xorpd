section .text
global _start

_start:
  mov rax, 0x40 ; what is being optimized (& luckily > 1)
  mov rbx, 0; 
  mov rcx, 0;
  mov rdx, 0;
  mov rsi, 0;
  mov rdi, 0; 

snippet:
  ; rbx, rsi := rax ie b,s := a = 64
  mov rbx, rax
  mov rsi, rax
  
  ; while (rax > 1) ie where rcx = rax_n * rax_n-1
  .loop:
    ; rax = 64 * 64 =: rcx
    mul rbx
    mov rcx, rax
    
    sub rax, 2 ; rax = rax - 2 - CF  = 64*64 - 2
    neg rax ; rax = -rax = -(64*64 - 2)
    mul rsi ; rax = 64 * -(64^2 - 2)
    mov rsi, rax ; rsi := rax = 64 * -(64^2 - 2)
    ; ie rsi := a * -(a^2 - 2)

    cmp rcx, 1
    ja .loop
  .exit_loop:

after:
  nop ; gdb breakpoint

  ; sys_exit
  mov rax, 60
  xor rdi, rdi
  syscall
