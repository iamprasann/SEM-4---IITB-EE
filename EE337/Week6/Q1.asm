; This subroutine writes characters on the LCD
LCD_data equ P2    ;LCD Data port
LCD_rs   equ P0.0  ;LCD Register Select
LCD_rw   equ P0.1  ;LCD Read/Write
LCD_en   equ P0.2  ;LCD Enable

ORG 0000H
LJMP INITIALIZE

ORG 000BH
LJMP HANDLER	;Interrupt handler at 050H

ORG 50H
HANDLER:
    INC R7
	MOV TH0, #00H	
	MOV TL0, #00H	
	RETI

ORG 0100H
INITIALIZE: 
	SETB EA				;Enable all interrupts
	SETB ET0			;Enable interrupt on Timer 0
	
	mov P2,#00h
	mov P1,#00h
	;initial delay for lcd power up

	;here1:setb p1.0
	acall delay
	;clr p1.0
	acall delay
	;sjmp here1
	acall lcd_init      ;initialise LCD
	mov r5, #0AH
START:
	acall delay
	acall delay
	acall clearscreen
	acall delay
	
	acall delay
	mov a, #83h		 ;Put cursor on first row, 4 column
	acall lcd_command	 ;send command to LCD
	acall delay
	mov   dptr,#my_string1   ;Load DPTR with sring1 Addr
	acall lcd_sendstring	   ;call text strings sending routine
	acall delay

	mov a,#0C2h		  ;Put cursor on second row,3 column
	acall lcd_command
	acall delay
	mov   dptr,#my_string2
	acall lcd_sendstring

	;Main logic begins here:
	ACALL DELAY1S
	ACALL DELAY1S
	MOV P1, #1FH
	MOV R7, #00H

	MOV TMOD, #00000001B	;Timer0 in Mode 1

	MOV TH0, #00H			;Again, the 0.025s delay value
	MOV TL0, #00H
	SETB TR0

	STAY: JNB P1.0, STAY

	CLR TR0
	CLR P1.4
	
	acall delay
	acall clearscreen
	acall delay
	
	acall delay
	mov a,#82h		 ;Put cursor on first row,2 column
	acall lcd_command	 ;send command to LCD
	acall delay
	mov   dptr, #my_string3   ;Load DPTR with sring1 Addr
	acall lcd_sendstring	   ;call text strings sending routine
	acall delay

	acall delay
	mov a,#0C0h		 ;Put cursor on first row,2 column
	acall lcd_command	 ;send command to LCD
	acall delay
	mov   dptr, #my_string4   ;Load DPTR with sring1 Addr
	acall lcd_sendstring	   ;call text strings sending routine
	acall delay
	mov a, r7
	mov b, #10H
	div ab
	acall DISPLAY
	mov a, b
	acall DISPLAY
	
	mov a, #32			;For a space
	acall lcd_senddata
	
	mov a, TH0			;TH0 XX
	mov b, #10H
	div ab
	acall DISPLAY
	mov a, b
	acall DISPLAY
	
	mov a, TL0			;TL0 XX
	mov b, #10H
	div ab
	acall DISPLAY
	mov a, b
	acall DISPLAY
	
	ACALL DELAY1S
	ACALL DELAY1S
	ACALL DELAY1S
	ACALL DELAY1S
	ACALL DELAY1S
	
	LJMP START

DELAY1S:
	mov r3, #40
	delay50000musec:
		mov tmod, #00010000b 
		mov th1, #03ch 
		mov tl1, #0b8h 
		setb tr1 
		del: jnb tf1, del
		clr tr1 
		clr tf1 
		djnz r3, delay50000musec
ret

;------------------------LCD Initialisation routine----------------------------------------------------
lcd_init:
         mov   LCD_data,#38H  ;Function set: 2 Line, 8-bit, 5x7 dots
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
	     acall delay

         mov   LCD_data,#0CH  ;Display on, Curson off
         clr   LCD_rs         ;Selected instruction register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         
		 acall delay
         mov   LCD_data,#01H  ;Clear LCD
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         
		 acall delay

         mov   LCD_data,#06H  ;Entry mode, auto increment with no shift
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en

		 acall delay
         
         ret                  ;Return from routine

;-----------------------command sending routine-------------------------------------
 lcd_command:
         mov   LCD_data,A     ;Move the command to LCD port
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
		 acall delay
    
         ret  
;-----------------------data sending routine-------------------------------------		     
 lcd_senddata:
         mov   LCD_data,A     ;Move the command to LCD port
         setb  LCD_rs         ;Selected data register
         clr   LCD_rw         ;We are writing
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         acall delay
		 acall delay
         ret                  ;Return from busy routine

;-----------------------text strings sending routine-------------------------------------
lcd_sendstring:
	push 0e0h
	lcd_sendstring_loop:
	 	 clr   a                 ;clear Accumulator for any previous data
	         movc  a,@a+dptr         ;load the first character in accumulator
	         jz    exit              ;go to exit if zero
	         acall lcd_senddata      ;send first char
	         inc   dptr              ;increment data pointer
	         sjmp  LCD_sendstring_loop    ;jump back to send the next character
exit:    pop 0e0h
         ret                     ;End of routine

;-----------------------display ---------------------------------------------------------
DISPLAY:
		MOV R4, A
		SUBB A, R5
		JNC ALPHA
		MOV A, R4
		ADD A, #30H
		ACALL lcd_senddata
		RET
		
		ALPHA: MOV A, R4
		ADD A, #37H
		ACALL lcd_senddata
		RET

;-----------------------Clear Screen-----------------------------------------------------
clearscreen:		
		mov   LCD_data,#01H  ;Clear LCD
		clr   LCD_rs         ;Selected command register
		clr   LCD_rw         ;We are writing in instruction register
		setb  LCD_en         ;Enable H->L
		acall delay
		clr   LCD_en
		ret
;----------------------delay routine-----------------------------------------------------
delay:	 push 0
	 push 1
         mov r0,#1
loop2:	 mov r1,#255
	 loop1:	 djnz r1, loop1
	 djnz r0, loop2
	 pop 1
	 pop 0 
	 ret

;------------- ROM text strings---------------------------------------------------------------
org 300h
my_string1:
         DB   "Toggle SW1", 00H
my_string2:
		 DB   "if LED glows", 00H
my_string3:
		 DB   "Reaction Time", 00H
my_string4:
		 DB   "Count is ", 00H
end

