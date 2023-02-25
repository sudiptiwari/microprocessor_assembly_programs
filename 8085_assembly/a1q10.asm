; Transfer ten data, which has bit D5 and D0, 0 and 1 respectively from A430H to A440H, else store 00 instead of transformation.
lxi h, a430h ; source
lxi d, a440h ; destination
mvi c, 0ah ; counter = 0

loop: mov a,m
mov b,a ; b is temp
ani 20h
jnz storeZero
mov a,b
ani 01h
jz storeZero
mov a,b
stax d
back: inx h
inx d
dcr c
jnz loop
hlt

storeZero: sub a ; makes a = 00H
stax d
jmp back