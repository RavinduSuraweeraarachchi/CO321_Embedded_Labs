// CO321 Embedded Systems
// Lab 01: Blinking LED
// Exercise 02: knight Rider
// Group 09

// Include Headers
#include <avr/io.h>
#include <util/delay.h>

// Define the delay for the blinking
// The BLINK_DELAY is the delay for each LED to blink
// The BIG_DELAY is the delay for the LED to stay on at the end
#define BLINK_DELAY 100
#define BIG_DELAY 200

// Attempt 1
// Here, we tried to have the Knight Rider Sequence without the use of a loop

// The idea is to turn on the LEDs one by one, and
// in between, keep two consecutive LEDs on
// This gives a smooth transition effect

int main (void){
    // First, we enable the PB2, PB3, PB4, and PB5 pins for output
    // The DDRB is the Data Direction Register B, which is used to set the direction of the pins
    DDRB = DDRB|(0b1111<<2);

    // The forever loop for the Knight Rider sequence
    while(1){

        // The PB2 pin is set to HIGH, and wait for BLINK_DELAY
        PORTB = PORTB|(0b1<<2);
        _delay_ms(BLINK_DELAY);
        
        // Both PB2 and PB3 pins are set to HIGH, and wait for BLINK_DELAY
        PORTB = PORTB|(0b1<<2);
        PORTB = PORTB|(0b1<<3);
        _delay_ms(BLINK_DELAY);

        // The PB2 pin is set to LOW, and wait for BLINK_DELAY
        PORTB = PORTB &~ (0b1<<2);
        PORTB = PORTB|(0b1<<3);
        _delay_ms(BLINK_DELAY);

        // Both PB3 and PB4 pins are set to HIGH, and wait for BLINK_DELAY
        PORTB = PORTB|(0b1<<3);
        PORTB = PORTB|(0b1<<4);
        _delay_ms(BLINK_DELAY);

        // The PB3 pin is set to LOW, and wait for BLINK_DELAY
        PORTB = PORTB &~ (0b1<<3);
        PORTB = PORTB|(0b1<<4);
        _delay_ms(BLINK_DELAY);

        // Both PB4 and PB5 pins are set to HIGH, and wait for BLINK_DELAY
        PORTB = PORTB|(0b1<<4);
        PORTB = PORTB|(0b1<<5);
        _delay_ms(BLINK_DELAY);

        // The PB4 pin is set to LOW, and wait for BIG_DELAY
        PORTB = PORTB &~ (0b1<<4);
        PORTB = PORTB|(0b1<<5);
        _delay_ms(BIG_DELAY);

        // Both PB5 and PB4 pins are set to HIGH, and wait for BLINK_DELAY
        PORTB = PORTB|(0b1<<5);
        PORTB = PORTB|(0b1<<4);
        _delay_ms(BLINK_DELAY);

        // The PB5 pin is set to LOW, and wait for BLINK_DELAY
        PORTB = PORTB &~ (0b1<<5);
        PORTB = PORTB|(0b1<<4);
        _delay_ms(BLINK_DELAY);

        // Both PB4 and PB3 pins are set to HIGH, and wait for BLINK_DELAY
        PORTB = PORTB|(0b1<<4);
        PORTB = PORTB|(0b1<<3);
        _delay_ms(BLINK_DELAY);

        // The PB5 pin is set to LOW, and wait for BLINK_DELAY
        PORTB = PORTB &~ (0b1<<4);
        PORTB = PORTB|(0b1<<3);
        _delay_ms(BLINK_DELAY);

        // Both PB3 and PB2 pins are set to HIGH, and wait for BLINK_DELAY
        PORTB = PORTB|(0b1<<3);
        PORTB = PORTB|(0b1<<2);
        _delay_ms(BLINK_DELAY);

        // The PB3 pin is set to LOW, and wait for BIG_DELAY
        PORTB = PORTB &~ (0b1<<3);
        PORTB = PORTB|(0b1<<2);
        _delay_ms(BIG_DELAY);
    }

    
    return 0;

}