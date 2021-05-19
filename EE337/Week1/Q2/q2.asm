org 0000h
ljmp start
org 100h
start: mov 40h, #01h
mov 41h, #02h
mov 42h, #03h
mov 43h, #03h 
mov 44h, #03h
mov 45h, #90h
mov 46h, #0feh 
mov 47h, #04h
mov 48h, #03h
mov 49h, #03h 
mov 4ah, #03h
mov 4bh, #07h
mov 4ch, #03h
mov 4dh, #0ffh
mov 4eh, #03h
mov 4fh, #05h 
mov 50h, #03h
mov 51h, #03h
mov 52h, #03h
mov 53h, #90h

mov r0, #40h
mov r2, 40h
mov r3, 41h

mov a, @r0
inc r0
subb a, @r0
jnc skipbasecase
mov a, r2
mov r3, a
mov a, @r0
mov r2, a

skipbasecase: mov r7, #12h
loop: inc r0
mov a, r3
subb a, @r0
jnc fullskip
mov a, r2
subb a, @r0
jnc halfskip
mov a, r2
mov r3, a
mov a, @r0
mov r2, a
ljmp fullskip
halfskip: mov a, @r0
mov r3, a
fullskip: djnz r7, loop

mov 70h, r2
mov 71h, r3
here: sjmp here
end