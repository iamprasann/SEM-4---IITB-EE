ORG 000H
	LJMP START		;Main function
ORG 00BH
	LJMP HANDLER	;Interrupt handler at 050H

ORG 50H
HANDLER:
	MOV TH0, #03CH		;Value loaded corresponds to 0.025 second delay
	MOV TL0, #0B6H
	DJNZ R0, NOTONESEC
	MOV P1, A
	CPL A
	MOV R0, #40			;We run it 40 times to get 1 second
	NOTONESEC:
	RETI
		
ORG 100H
	START: 	
	
	SETB EA					;Enable all interrupts
	SETB ET0				;Enable interrupt on Timer 0
	
	MOV TMOD, #00000001B	;Timer0 in Mode 1
	MOV P1, #0FFH			;Switch on all port pins
	CLR A
	
	MOV TH0, #03CH			;Again, the 0.025s delay value
	MOV TL0, #0C6H
	SETB TR0
	
	MOV R0, #40				;Outerloop counter, 40 X 0.025=1sec
	
	HERE: SJMP HERE		;Program stays here once other parts are done. Only Interrupts affect from here
	
END