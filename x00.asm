section .text
global _start

_start:
  mov rax, 0;
  mov rbx, 0; 
  mov rcx, 0;
  mov rdx, 0;
  mov rsi, 0;
  mov rdi, 0; 

puzzzle_snippet:
  xor eax, eax ; eax := 0 (CF,OF=0, SF,ZF,PF=same, AF=undefined)
 
  ; a 'rip relative' ie address of the next instruction (https://news.ycombinator.com/item?id=8866985)
  lea rbx, [0]  ; rbx := address of $ (of the loopo instruction below)
  ; xor rbx, rbx (3 bytes); mov rbx, 0 (5 bytes) ie more efficient ??
  ; ie this 0-s rbx w/o touching flags??

  loop $ ; decrements rcx(ecx(cx)) until it hits 0, jumping every time to $ (itself)

  mov rdx, 0
  and esi, 0 ; esi := 0 (ZF,PF=1, CF,OF,SF=0)
  sub edi, edi
  push 0
  pop rdp

  ; ie "to zero a register" is what this puzzle is doing (in various ways, to set or not set flags)

after:
  nop ; gdb breakpoint

  ; sys_exit
  mov rax, 60
  xor rdi, rdi
  syscall
