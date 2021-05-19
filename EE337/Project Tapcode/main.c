#include <at89c5131.h>
#include "lcd.h"	//To include LCD functions
#include "serial.c"		//To include Serial UART communication

sbit OP_signal = P1^4;	//P1.4 is our audio signal to speaker
sbit serial_en = SCON^4;

void play_tone(unsigned char count){
		unsigned char i;		// i is the outer loop counter
		unsigned int j;			// j is inner loop counter
		for(i=0; i<=count; i++){
				for(j=0; j<1000; j++){
						OP_signal = ~OP_signal;			// Square wave of frequency 500Hz
						msdelay(1);
				}
				msdelay(1000);			// One second silence
		}
}

void main(void){
	
		OP_signal = 0;		//Global variable initialisation
	  lcd_init();				//Clear and configure lcd
		uart_init();			//Configure UART to 4800 baud
		
		while(1){
				unsigned char letter;			//Letter stores keyboard input character
				unsigned char row;				//Row and column of the 5X5 Alphabet to Grid map
				unsigned char col; 			
				
				lcd_init();
				lcd_cmd(0x82);						//82 because I want to centre text
				lcd_write_string("Input please");
				
				serial_en = 1;								//Enable serial communication
				letter = receive_char();			//Receive character from Serial Port
				serial_en = 0;								//Disable serial communication till next tapcode
			
				lcd_init();
			
				if((letter < 'A') || (letter > 'Z')){			//If not in uppercase range, INVALID
						lcd_cmd(0x81);
						lcd_write_string("Invalid input");
						msdelay(2000);												//Invalid displayed for 2 seconds
						continue;
				}
				else if(letter < 'K'){				//Alphabets less than K correspond to 
						row = (letter-65)/5;			// ((pos-65)/5+1, (pos-65)%5+1) position
						col = (letter-65)%5;
						
						play_tone(row);
						msdelay(1000);
						play_tone(col);
						msdelay(1000);
				}
				else if(letter == 75){
						play_tone(0);						//K corresponds to (1, 3) position
						msdelay(1000);
						play_tone(2);
						msdelay(1000);
				}
				else{
						row = (letter-66)/5;		//After K, alphabets correspond to
						col = (letter-66)%5;		// ((pos-66)/5+1, (pos-66)%5+1) position
						
						play_tone(row);
						msdelay(1000);
						play_tone(col);
						msdelay(1000);
				}
		}
}
