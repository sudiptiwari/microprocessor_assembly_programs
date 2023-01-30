;This program adds two numbers but this method is not considered good.

jmp start

start: mvi A, 11
sta 2000
mvi A, 22
sta 2001

MVI C, 00
LDA 2000
MOV B,A
LDA 2001
ADD B
JNC NoCarry
INR C
NoCarry: STA 2002
MOV A,C
sta 2003

hlt