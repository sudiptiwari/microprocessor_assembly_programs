mvi c, 1eh ; counter

OuterLoop: mov a,m ; a = source
adi 00h ; for parity flag check
jpe ultoPulto
mvi b, 00h ; counter to store no. of 1s
push h ; save because of lack of registers
mvi h, 08h ; counter to rotate
loopCarry: rlc
jc carryAayo
carryGayo: dcr h
jnz loopCarry
pop h
mov a, b ; a = no. of 1s
stax d ; transfer to destination
exit: inx h
inx d
dcr c
jnz OuterLoop
hlt


carryAayo: inr b
jmp carryGayo

ultoPulto: ori 20h ; set d5 to 1
ani fbh ; set d2 to 0
stax d ; transfer to destination
jmp exit
