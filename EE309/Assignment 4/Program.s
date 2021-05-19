# Code provided by Assignment 4 Hint:-
# Form the basic initialisation block of the program

.data
TestTab: 	.word AnyKey, TheKey
ActTab:  	.word DoNothing, FindKey, ReportKey
PortAddress:.word 0x00400000
Cur_St:		.byte 0x00
Key_Code:	.byte 0x7E
Key_Buffer:	.space 16
In_Dest:	.byte 0
Out_From:	.byte 0
Periph:		.space 4
# State Diagram Data
Test_No:	.byte 0, 1, 1, 1
Yes_Act:	.byte 1, 2, 0, 0
No_Act:		.byte 0, 0, 0, 0
Yes_Next:	.byte 1, 2, 2, 2
No_Next:	.byte 0, 0, 3, 0
	.text
	.globl main
main:

# Value written for testing
li $t1, 0xBE
lw $t0, PortAddress
sb $t1, 0($t0)

jal DO_TEST		#Call DO_TEST first
nop

jal DO_ACTION	#After testing, check for action (Yes or No)
nop

jal SET_NEXT	#Then move to next state and set next state as current
nop

j END_LOOP
nop

DO_TEST:
# Get current state
lbu $t0, Cur_St

# Get corresponding test number 
la $t1, Test_No
addu $t2, $t0, $t1
lbu $t0, ($t2)

# Jump to the selected test
la $t1, TestTab
addu $t0, $t0, $t0
addu $t0, $t0, $t0		#Adding four times as we are dealing with 32 bit (4 Byte) addresses
addu $t2, $t0, $t1
lw $t3, ($t2)
jr $t3

DO_ACTION:
# Selecting the correct action table (Yes or No)
la $t1, Yes_Act
bgtz $s0, Action_Select
la $t1, No_Act

Action_Select:
# Get the current state
lbu $t0, Cur_St

# Get the action number mapped to the current state
addu $t2, $t0, $t1
lbu $t0, ($t2)

# Jump to the selected action
la $t1, ActTab

addu $t0, $t0, $t0
add $t0, $t0, $t0		#Adding four times as we are dealing with 32 bit (4 Byte) addresses

addu $t2, $t0, $t1
lw $t3, ($t2)
jr $t3

SET_NEXT:
# Selecting the correct NEXT STATE table
la $t1, Yes_Next
bgtz $s0, Do_Next
la $t1, No_Next

Do_Next:
# Get the current state
lbu $t0, Cur_St

# Get the next state number for the current state based on test result
addu $t2, $t0, $t1
lbu $t0, ($t2)
sb $t0, Cur_St

jr $ra

# Here begin the tests (AnyKey and TheKey)
AnyKey:
# Writing 1's to columns and 0's to rows
li $t2, 0x0F
lw $t0, PortAddress
sb $t2, 0($t0)

# Reading the lower nibble of the port
lw $t0, PortAddress
lbu $t1, ($t0) 
and $t1, $t1, 0x0F

# In case no key is pressed, we have 0F in port
li $s0, 0
beq $t1, $t2, Not_Pressed
li $s0, 1

Not_Pressed:
jr $ra

TheKey: 
# Reading The Port
li $t0, 0x0F
sb $t0, PortAddress
lbu $t1, ($t0)
li $t0, 0xF0
sb $t0, PortAddress
lbu $t1, ($t0) 
or $t0, $t0, $t1

# Get the current key code
lbu $t2, Key_Code

# Check if the key is still pressed
li $s0, 1
beq $t1, $t2, Still_Pressed
li $s0, 0

Still_Pressed:
jr $ra

DoNothing:
jr $ra

FindKey:
# Writing 1's to columns and 0's to rows
li $t2, 0x0F
lw $t0, PortAddress
sb $t2, 0($t0)

# Reading the port
lw $t0, PortAddress
lbu $t1, ($t0)

# Forcing the upper nibble to 1 and writing back to the port
or $t1, $t1, 0xF0
lw $t0, PortAddress
sb $t1, 0($t0)

# Reading the port again
lw $t0, PortAddress
lbu $t1, ($t0)

sb $t1, Key_Code
jr $ra

ReportKey:
# In_Dest stores the index of the last reported key
lbu $t0, In_Dest

# Incrementing for next key position
addi $t0, 1

# Getting the remainder (For circular array wrap around)
li $t1, 0x10
divu $t0, $t1
mfhi $t0  

# Calculate address for next key
la $t1, Key_Buffer
addu $t2, $t1, $t0

# Get the current key code
lbu $t3, Key_Code

# Move the key into the key buffer
sb $t3, 0($t2)

jr $ra

END_LOOP:
# Looping for the next FSM iteration
j main
nop

syscall
.end