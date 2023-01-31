; Program to add two numbers in Address 2000H and 2001H using M-memory pointer
mvi c,00h
lxi h,2000h
mov a,m
inx h ;hl = 2001
add m
jnc skip
inr c
skip: inx h ;hl = 2002
mov m,a
inx h ;hl = 2003
mov m,c
hlt