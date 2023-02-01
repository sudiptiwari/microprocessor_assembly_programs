; store data of first table starting from 80A1H if corresponding data in first table is greater than data in second table starting from 80B1H. Data is stored finally in table starting from 80C1H

lxi b, 80a1h ; starting address of first
lxi h, 80b1h ; starting address of second
lxi d, 80c1h ; starting address of destination
mvi a, 0ah ; counter = 0
lxi sp, 80dfh ; stack pointer at 80dfH

loop: push psw ; push value of a/psw in stack
ldax b ; a = [bc]
cmp m ; temp = a - m
jz skip ; jump to skip without calling if a==m
jnc transfer ; call if no carry
skip: mvi a, ffh
stax d ; transfer ffH to destination
back: inx b
inx h
inx d
pop psw
dcr a
jnz loop
hlt

transfer: stax d
jmp back
