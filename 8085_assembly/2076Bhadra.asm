; 2076 Bhadra Exam Question Regular
; sort 10 data in descending order starting from 8920h

; always take counter value as (n-1) in bubble sort
mvi b, 09h ; outer loop counter
loopOuter: mvi c, 09h ; inner loop counter
lxi h, 8920h
loopInner: mov a,m
inx h
mov d,m
cmp d ; a - d
jnc skip
jz skip
; executes only when d > a
dcx h
mov m,d ; store higher number above
inx h
mov m,a ; store lower number below
skip: dcr c
jnz loopInner
dcr b
jnz loopOuter
hlt