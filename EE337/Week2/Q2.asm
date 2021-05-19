org 0000h
ljmp start
org 100h
	
start: mov 60h, #03h
mov 61h, #01h
mov 62h, #04h
mov 63h, #03h
mov 64h, #04h
mov 65h, #01h
mov 66h, #02h
mov 67h, #03h
mov 68h, #02h
mov 69h, #01h

mov r2, 60h
outerloop: mov r3, 60h
	innerloop: mov b, r2
	mov a, b
	subb a, #01h
	mov b, a
	mov a, 60h
	mul ab
	add a, r3
	subb a, #01h
	add a, #61h
	mov r0, a
	; Sets R0 to point at R[m(i-1)+(j-1)]
	
	mov b, r3
	mov a, b
	subb a, #01h
	mov b, a
	mov a, 60h
	mul ab
	add a, r2
	subb a, #01h
	add a, #61h
	mov r1, a
	; Sets R1 to point at R[m(j-1)+(i-1)]
	
	mov 90h, @r0
	mov a, @r1
	cjne a, 90h, assymetric
	; Compares the values of Mij and Mji if unequal, it exits
	
	djnz r3, innerloop
djnz r2, outerloop

setb psw.5
ljmp here

assymetric: clr psw.5
ljmp here

here: sjmp here
end