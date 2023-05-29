lxi h, 8050h ; source
mvi a, 0ah ; for 10 data

mvi d, 00h ; sum of odd numbers
mvi e, 00h ; carry of odd numbers

mvi b, 00h ; sum of even numbers
mvi c, 00h ; carry of even numbers

loop: push psw
mov a, m
ani 01h
jz even
; odd block
mov a, d
add m ; a = a + m
mov d, a ; d = a
jnc skip
inr e
jmp skip

even: mov a, b 
add m ; a = a + m
mov b, a ; b = a
jnc skip
inr c

skip: inx h
pop psw
dcr a
jnz loop

; transfer sum of odd numbers to 8060
mov a, d ; a <- sum
sta 8060h
mov a, e ; a<- carry
sta 8061h

; transfer sum of even numbers to 8070
mov a, b ; a <- sum
sta 8070h
mov a, c ; a<- carry
sta 8071h

; you may display in the port with suitable code

hlt
