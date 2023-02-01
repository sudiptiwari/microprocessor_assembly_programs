; add corresponding 16-bit data from 8050H and 8070H and store in table starting from 8090H
; assumption that no carry is generated after beyond 16 bits
lxi b, 8050h ; first table
lxi h, 8070h ; second table
lxi d, 8090h ; destination table
mvi a, 0ah ; counter = 0
lxi sp, 80ffh ; initialize stack pointer

loop: push psw
ldax b ; a = [bc]
add m ; a = a + m
stax d
; since inx, dcx and cma affect NO FLAGS
inx b ; move bc pointer to higher byte
inx h ; move hl pointer to higher byte
inx d ; move de pointer to higher byte
ldax b ; a = [bc]
adc m ; a = a + m + carry(cy)
stax d
inx b ; move to next 16-bit no.
inx h ; move to next 16-bit no.
inx d ; move to next 16-bit no.
pop psw
dcr a
jnz loop
hlt 