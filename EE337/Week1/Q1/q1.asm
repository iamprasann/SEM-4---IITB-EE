org 0000h
ljmp start
org 100h
start: mov 70h, #0ffh
mov a, 70h
mov r1, #08h
mov r0, #00h
nextbit: rrc a
jnc nobit
inc r0
nobit: djnz r1, nextbit
mov 71h, r0
here: sjmp here
end