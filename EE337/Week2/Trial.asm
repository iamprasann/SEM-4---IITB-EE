org 0000h
ljmp start
org 100h
start:
mov r0,#8
mov a,#2DH
mov b,#9AH
mul AB
rep:
rlc a
jnc next
clr c
next:
djnz r0,rep
jz insert
sjmp here
insert:
add a,#79H

here:
sjmp here
end