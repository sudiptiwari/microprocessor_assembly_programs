;Transfer ten data with even parity from location 9270H to 9280H, else transfer the data by clearing bit D7 and setting bit D2.
lxi h, a430h ; source
lxi d, a440h ; destination
mvi c, 0ah ; counter = 0

loop: mov a,m
ani ffh ; to change flags since mov a,m does not affect flags
jpe transfer
ani 7fh ; to clear d7 bit
ori 04h ; to set d2 bit
stax d
back: inx h
inx d
dcr c
jnz loop
hlt

transfer: stax d
jmp back