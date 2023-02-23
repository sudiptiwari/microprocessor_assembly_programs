; In two tables 16-bit data are stored, each table having ten numbers each. Subtract the data from one table to other and store the result in the third table
; Subtract 16-bit data from two tables and store result in third table
; assumption that no borrow is generated after beyond 16 bits
lxi b, 8050h ; first table
lxi h, 8070h ; second table
lxi d, 8090h ; destination table
mvi a, 0ah ; counter = 0
lxi sp, 80ffh ; initialize stack pointer

loop: push psw
ldax b ; a = [bc]
sub m ; a = a + m
stax d
; since inx, dcx and cma affect NO FLAGS
inx b ; move bc pointer to higher byte
inx h ; move hl pointer to higher byte
inx d ; move de pointer to higher byte
ldax b ; a = [bc]
sbb m ; a = a + m + carry(cy)
stax d
inx b ; move to next 16-bit no.
inx h ; move to next 16-bit no.
inx d ; move to next 16-bit no.
pop psw
dcr a
jnz loop
hlt 
