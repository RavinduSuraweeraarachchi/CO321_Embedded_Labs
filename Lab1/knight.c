// CO321 Embedded Systems
// Lab 01: Blinking LED
// Exercise 02: knight Rider
// Group 09

// Include Headers
#include <avr/io.h>
#include <util/delay.h>

// Define the delay for the blinking
// The BLINK_DELAY is the delay for each LED to blink
#define BLINK_DELAY 100

// Attempt 2
// Here, we use a for loop 

// The idea is to turn on the LEDs one by one, and
// in between, keep two consecutive LEDs on
// This gives a smooth transition effect

int main (void){
    // First, we enable the PB2, PB3, PB4, and PB5 pins for output
    // The DDRB is the Data Direction Register B, which is used to set the direction of the pins
    DDRB = DDRB|(0b1111<<2);

    // The forever loop for the Knight Rider sequence
    while(1)
    {
        // The first for loop is used to turn on the LEDs one by one
        for (int i = 0; i < 4; i++)
        {
            // Turn on the LED at position i
            PORTB = (1<<i+2);
            // Wait for a short time
            _delay_ms(BLINK_DELAY);
            // Turn on the LED at position i+1
            PORTB = (1<<(i+1)+2);
            // Wait for a short time
            _delay_ms(BLINK_DELAY);
            // Turn off the LED at position i
            PORTB = (0<<i+2);
        }
        // The second for loop is used to turn off the LEDs one by one
        for (int i = 3; i >= 0; i--)
        {
            // Turn on the LED at position i
            PORTB = (1<<i+2);
            // Wait for a short time
            _delay_ms(BLINK_DELAY);
            // Turn on the LED at position i-1
            PORTB = (1<<(i-1)+2);
            // Wait for a short time
            _delay_ms(BLINK_DELAY);
            // Turn off the LED at position i
            PORTB = (0<<i+2);
        }
    }

    return 0;
}