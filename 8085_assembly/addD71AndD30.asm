; Program to add all the numbers with bit D5 and D3, 1 and 0 respectively, stored in the memory location 90B1H to 90BAH. Display the 16-bit result in any ports.
lxi h, 90b1h ; starting address
sub a ;initialize a = 0
mvi d, 00h ;initialize sum = 0
mvi b, 0ah ;initialize counter to 10
mvi c, 00h ;initialize carry = 0

loop: mov a,m
ani 20h
jz skip
mov a,m
ori f7h
sui ffh
jz skip
mov a,d ; move sum upto now to 'a'
add m
mov d,a ; safely keep sum till now in 'd'
jnc skip
inr c
skip: inx h
dcr b
jnz loop
mov m,d ; store sum as m here
inx h
mov m,c ; store carry as m here
hlt

