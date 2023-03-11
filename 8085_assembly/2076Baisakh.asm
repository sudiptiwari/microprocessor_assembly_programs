; (Exam question 2076 Baisakh) smallest and largest find garne
lxi h, 2050h ; source
mvi c, 04h ; counter

mov d, m ; d = greatest
mov e, m ; e = smallest
inx h

loop: mov a, m
cmp e
jnc skip
; carry aayo vane matra execute hunchha
mov e, a ; move that number to smallest if carry comes
jmp endif
skip: cmp d
jc endif
mov d, a ; update d if no carry
endif: inx h
dcr c
jnz loop

mov a,e ; a = smallest
mov m, a
inx h
mov a,d ; a = greatest
mov m,a 
hlt