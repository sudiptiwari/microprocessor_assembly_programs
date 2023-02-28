; Data is stored from 8050H to 805AH. Insert 5 data after 8055H taking from 8040H, but do not lose the previous content.
lxi h, 8040h ; source containing 5 data
lxi d, 8050h ; de register has destination
mvi c, 0bh ; counter = 0

loop: mov a, c
sui 05h
jc transfer ; jump to transfer if counter < 5
jz transfer  ; jump to transfer if counter = 5
return: inx d
dcr c
jnz loop
hlt

transfer: mov a, m
stax d
inx h ; hl pair is increased only if transfer takes place
jmp return