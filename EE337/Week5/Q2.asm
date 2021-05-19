; This subroutine writes characters on the LCD
LCD_data equ P2    ;LCD Data port
LCD_rs   equ P0.0  ;LCD Register Select
LCD_rw   equ P0.1  ;LCD Read/Write
LCD_en   equ P0.2  ;LCD Enable

ORG 000H
	LJMP START		;Main program jump
ORG 00BH
	LJMP HANDLER	;jump to Handler from T0 interrupt vector 

ORG 50H
HANDLER:
	MOV TH0, #03CH	;Corresponds to 0.025s delay
	MOV TL0, #0B6H
	INC 69H			;Will act as counter to wait 0.025s correct number of times
	RETI
		
ORG 100H
	START:
	MOV 69H, #00H	;Initialising spaces and enabling interrupts
	SETB EA
	SETB ET0
	
	MOV TMOD, #00000001B	;Mode 1 Timer 0
	MOV TH0, #03CH
	MOV TL0, #0B6H
	
	acall lcd_init      ;initialise LCD, (from LCD week4)
	
	  acall delay
	  acall delay
	  acall delay
	  
	MOV P1, #0FFH		;Enables P1 to take input
	SETB TR0			;Start the Timer 0
	
	MAINLOOP:
	mov P2,#00h
	;initial delay for lcd power up (from LCD week4)

	;here1:setb p1.0
	acall delay
	;clr p1.0
	acall delay
	;sjmp here1	(from LCD week4)
	
	MOV A, #07H 	;To binary AND with P1 to get least significant 3 bits
	ANL A, P1		;Logical AND as explained before	
	MOV 65H, A		;65H placeholder for P1 value
	MOV A, #09H
	SUBB A, 65H
	MOV R3, A		;R3 stores the duty cycle type
	
	
	;Printing duty cycle type on LCD
	mov a,#80H		 ;Position cursor on first row
	  acall lcd_command	 ;send command to LCD
	  acall delay
	  mov   dptr, #my_string1   ;Load DPTR with sring1 Addr
	  acall lcd_sendstring	   ;call text strings sending routine
	  acall delay
	  mov a, r3
	  acall DISPLAY
	  mov a, #00h
	  acall DISPLAY
	
	;Printing pulse width on LCD in milliseconds
	mov a,#0C0H		  ;Put cursor on second row
	  acall lcd_command
	  acall delay
	  mov   dptr, #my_string2
	  acall lcd_sendstring
	  acall delay
	  mov a, r3
	  mov b, #02h
	  mul ab
	  mov b, #0ah
	  div ab
	  acall DISPLAY
	  mov a, b
	  acall DISPLAY
	  mov a, #00h
	  acall DISPLAY		;ASCII values to add a zero at end
	  mov a, #00h
	  acall DISPLAY
	  
	  MOV A, R3		;Main logic begins here
	  MOV B, #8		;R3 contains (9-P1) which times 8 is the length of ON cycle
	  MUL AB
	  MOV R4, A		;ON cycle length stored in R4
	  MOV A, #80
	  SUBB A, R4	;OFF cycle is 80 - ON cycle 
	  MOV R5, A
	  MOV A, R4
	  
	  ;Equations:
	  ; 80*0.025 = 2 seconds
	  ; ON length = Duty Cycle% of 2 seconds
	  ; OFF length = (100-Duty Cycle)% of 2 seconds
	  
	  ONLOOP:
	  CJNE A, 69H, ONLOOP
	  
	  CPL P1.4
      CPL P1.5
      CPL P1.6
      CPL P1.7
      MOV 69H, #00H
	  MOV A, R5
	  
	  OFFLOOP:
	  CJNE A, 69H, OFFLOOP
	  
	  CPL P1.4
      CPL P1.5
      CPL P1.6
      CPL P1.7
      MOV 69H, #00H
	  
	  ;Minor errors of orders of mu seconds ignored
	  
	  LJMP MAINLOOP

;------------------------LCD Initialisation routine (from LCD week4) ----------------------------------------------------
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

;-----------------------command sending routine (from LCD week4) -------------------------------------
 lcd_command:
         mov   LCD_data,A     ;Move the command to LCD port
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
		 acall delay
    
         ret  
;-----------------------data sending routine (from LCD week4) -------------------------------------		     
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

;-----------------------text strings sending routine (from LCD week4) -------------------------------------
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
          ADDC A, #30H			;ASCII value adjust
		  ACALL lcd_senddata
		  RET
		  
;----------------------delay routine (from LCD week4) -----------------------------------------------------
delay:	 push 0
	 push 1
         mov r0,#1
loop2:	 mov r1,#255
	 loop1:	 djnz r1, loop1
	 djnz r0, loop2
	 pop 1
	 pop 0 
	 ret

;------------- ROM text strings (from LCD week4) ---------------------------------------------------------------
org 300h
my_string1:
	DB   "Duty Cycle: ", 00H
my_string2:
    DB   "Pulse Width: ", 00H

END