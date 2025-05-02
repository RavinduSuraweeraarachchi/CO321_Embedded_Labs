// CO321 Embedded Systems
// Lab 01: Blinking LED
// Exercise 01: 4 LEDs simultaneously
// Group 09

// Include Headers
#include <avr/io.h>
#include <util/delay.h>

#define BLINK_DELAY 1000

int main (void){
    // DDRB = DDRB|(0b1111<<2);
    DDRB = (0b1111<<2);
    while(1){
        //PORTB = PORTB|(0b1111<<2);
        PORTB = (0b1111<<2);
        _delay_ms(BLINK_DELAY);

        //PORTB = PORTB &~(0b1111<<2);
        PORTB = (0b0000<<2);
        _delay_ms(BLINK_DELAY);
    }
}