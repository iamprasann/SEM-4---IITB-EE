
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here

S2: DB "PRSNV"
S1: DB "XYZUV" 
N equ 0003H

MOV SP, 0DF20H
PUSH S2
PUSH S1
PUSH N
CALL MY_FUNCTION
ret            

MY_FUNCTION:

PUSH BP
MOV BP, SP
PUSH BX
PUSH CX
PUSH DX
PUSH DI
PUSH SI

MOV DI, WORD[BP+8]
MOV SI, WORD[BP+6]
MOV CX, WORD[BP+4]
REP MOVSB

POP SI
POP DI
POP DX
POP CX
POP BX
POP BP

RET 06H



