#!/bin/bash

sudo sysctl -w kernel.randomize_va_space=0

gcc -m32 -o stack -z execstack stack.c

sudo chown root stack
sudo chmod 4755 stack

rm badfile
gcc -m32 exploit.c -o exploit
./exploit

./stack
