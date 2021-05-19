org 0000h
	ljmp start
org 0100h
	
	start: mov p1, #00000011b
		jnb p1.0, port4off
		jnb p1.1, port4on6off
		port46on:
			setb p1.4
			setb p1.6
			acall delay1s
			clr p1.4
			acall delay1s
			clr p1.6
			acall delay1s
			acall delay1s
			ljmp start
		
		port4on6off: clr p1.6
			setb p1.4
			acall delay1s
			clr p1.4
			acall delay1s
			acall delay1s
			acall delay1s
			ljmp start
			
		port4off: clr p1.4
		jnb p1.1, port46off
		
		port6on4off:
			setb p1.6
			acall delay1s
			acall delay1s
			clr p1.6
			acall delay1s
			acall delay1s
			ljmp start
			
		port46off: clr p1.6
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