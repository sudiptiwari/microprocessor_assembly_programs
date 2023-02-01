; !!!! CAREFUL HERE !!!!
; add 16-bit data of two tables and store result in third table only if result > 00ffH else store 0000H
lxi b, 8050h ; table 1
lxi h, 8070h ; table 2
lxi d, 8090h ; destination table
mvi a, 0ah ; counter = 0
lxi sp, 80ffh ; stack pointer

loop: push psw
ldax b ; a = lower byte
add m
push psw ; push sum of lower byte
inx b
inx h
inx d
ldax b
adc m ; a = a + m + cy
cpi 00h ; a - 00H
jz storeZero
stax d
dcx d
pop psw
stax d
inx d ; after this, all bc, de and hl are at same level, i.e, higher byte
return: inx b
inx h
inx d
pop psw
dcr a
jnz loop
hlt

storeZero: dcx b
dcx h
dcx d
pop psw
mvi a, 00h
stax d
inx b
inx h
inx d
stax d
jmp return
