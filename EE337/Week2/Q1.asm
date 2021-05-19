org 0000h
ljmp start
org 100h
	
start: mov 50h, #063h
mov a, 50h
mov b, #64h
div ab
mov 52h, a

mov a, b
mov b, #0ah
div ab
mov 53h, b

mov b, #10h
mul ab
add a, 53h
mov 53h, a

here: sjmp here
end