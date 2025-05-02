// CO321 Embedded Systems
// Lab 01: Blinking LED
// Exercise 02: knight Rider
// Group 09

// Include Headers
#include <avr/io.h>
#include <util/delay.h>

#define BLINK_DELAY 100
#define BIG_DELAY 200

int main (void){
    DDRB = DDRB|(0b1111<<2);
    while(1){
        PORTB = PORTB|(0b1<<2);
        _delay_ms(BLINK_DELAY);

        PORTB = PORTB|(0b1<<2);
        PORTB = PORTB|(0b1<<3);
        _delay_ms(BLINK_DELAY);

        PORTB = PORTB &~ (0b1<<2);
        PORTB = PORTB|(0b1<<3);
        _delay_ms(BLINK_DELAY);

        PORTB = PORTB|(0b1<<3);
        PORTB = PORTB|(0b1<<4);
        _delay_ms(BLINK_DELAY);

        PORTB = PORTB &~ (0b1<<3);
        PORTB = PORTB|(0b1<<4);
        _delay_ms(BLINK_DELAY);

        PORTB = PORTB|(0b1<<4);
        PORTB = PORTB|(0b1<<5);
        _delay_ms(BLINK_DELAY);

        PORTB = PORTB &~ (0b1<<4);
        PORTB = PORTB|(0b1<<5);
        _delay_ms(BIG_DELAY);

        PORTB = PORTB|(0b1<<5);
        PORTB = PORTB|(0b1<<4);
        _delay_ms(BLINK_DELAY);

        PORTB = PORTB &~ (0b1<<5);
        PORTB = PORTB|(0b1<<4);
        _delay_ms(BLINK_DELAY);

        PORTB = PORTB|(0b1<<4);
        PORTB = PORTB|(0b1<<3);
        _delay_ms(BLINK_DELAY);

        PORTB = PORTB &~ (0b1<<4);
        PORTB = PORTB|(0b1<<3);
        _delay_ms(BLINK_DELAY);

        PORTB = PORTB|(0b1<<3);
        PORTB = PORTB|(0b1<<2);
        _delay_ms(BLINK_DELAY);

        PORTB = PORTB &~ (0b1<<3);
        PORTB = PORTB|(0b1<<2);
        _delay_ms(BIG_DELAY);
    }
}