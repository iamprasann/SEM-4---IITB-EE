org 0000h
	ljmp start
org 0100h
	
	start: 
		mov p1, #11111111b
		acall delay1s
		acall delay1s
		acall delay1s
		acall delay1s
		acall delay1s
		
		clr a
		mov 70h, p1
		mov r1, #70h
		xchd a, @r1
		mov r7, a
		jz start
		
		blink: 
			mov p1, #00000000b
			acall delay1s
			mov p1, #11110000b
			acall delay1s
			djnz r7, blink
		
		ljmp start
		
		here: sjmp here 

		delay1s:
			mov r1, #40
			delay50000musec:
				mov tmod, #00000001b 
				mov th0, #03ch 
				mov tl0, #0b8h 
				setb tr0 
				del: jnb tf0, del
				clr tr0 
				clr tf0 
				djnz r1, delay50000musec
		ret
		
		end