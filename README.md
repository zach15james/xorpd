this is a collection of all the solved 'xchg rax, rax' xorpd puzzle solutions (may be helpful to some, as I don't think there is a complete set out there as a help up if you're stuck - though riding around in your car with Strava on does nothing lol) + its a proof of work if you are considering hiring me.

the code I did run (for convenience or tedious necesssity is all inside asm, along w/ my .gdb - which may have been modified for specific exercises)
the command I ran was
```bash
nasm -f elf64 -g -F dwarf 0xNN.asm -o 0xNN.o && ld 0xNN.o -o 0xNN && gdb ./0xNN
```

if you disagree or have any questions, feel free to email me: zach15james@proton.me
