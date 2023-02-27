; program to add a table of 16-bit numbers and store the 24-bit result at the end of the table
lxi h, 9500h ; starting address of table
lxi sp, 955fh ; initialize stack address
mvi b, 0ah ; counter = 0
sub a ; initialize sum = 0
mvi d, 00h ; lowerByteCarry = 0
mvi e, 00h ; higherByteCarry = 0

loop: add m
jnc skip
inr d
skip: inx h
inx h
dcr b
jnz loop
mov m, a ; lower byte stored

; now to decrease HL
mvi a, 0ah 
back: dcx h
dcx h
dcr a
jnz back
inx h ; set hl to higher byte

sub a ; initialize a = 00H
mvi b, 0ah ; initialize counter = 0 for higher byte
add d
higherByteLoop: add m
jnc skipForHigher
inr e
skipForHigher: inx h
inx h
dcr b
jnz higherByteLoop
mov m,a
inx h
mov m, e
hlt