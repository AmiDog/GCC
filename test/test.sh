#!/bin/sh
export PATH=/usr/local/halfmips/bin:$PATH
mkdir -p obj
halfmips-gcc.exe -S -O3 -fno-delayed-branch test.c -o obj/test.s
halfmips-gcc.exe -S -O3 -fno-delayed-branch -mint16 test.c -o obj/test_16.s
