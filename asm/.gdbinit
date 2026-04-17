set pagination off
set confirm off
set debuginfod enabled off
# THIS IS THE MAGIC LINE:
set breakpoint pending on

define dump_regs
  printf "RAX=0x%016lx rbx=0x%016lx RCX=0x%016lx RDX=0x%016lx\n", $rax, $rbx, $rcx, $rdx
  printf "rsi=0x%016lx rdi=0x%016lx rbp=0x%016lx rsp=0x%016lx\n", $rsi, $rdi, $rbp, $rsp
  printf " r8=0x%016lx  r9=0x%016lx r10=0x%016lx r11=0x%016lx\n", $r8, $r9, $r10, $r11
  printf "r12=0x%016lx r13=0x%016lx r14=0x%016lx r15=0x%016lx\n", $r12, $r13, $r14, $r15
  printf "eflags=[ CF=%d ZF=%d SF=%d OF=%d ]\n\n", \
         ($eflags >> 0) & 1, ($eflags >> 6) & 1, ($eflags >> 7) & 1, ($eflags >> 11) & 1
end

break snippet
commands
  silent
  printf "=== BEFORE SNIPPET ===\n"
  dump_regs
  continue
end

break snippet.loop
commands
  silent
  printf "=== LOOP ITERATION ===\n"
  dump_regs
  continue
end

break after
commands
  silent
  printf "=== AFTER SNIPPET ===\n"
  dump_regs
  continue
end

run
