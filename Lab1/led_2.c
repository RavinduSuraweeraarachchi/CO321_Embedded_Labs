// CO321 Embedded Systems
// Lab 01: Blinking LED
// Exercise 01: 4 LEDs simultaneously
// Group 09

// Include Headers
#include <avr/io.h>
#include <util/delay.h>

// Define the delay for the blinking
#define BLINK_DELAY 1000

int main (void){
    // Data Direction Register B (DDRB) is used to set the direction of the pins
    // Set the pins for the LEDs as output
    // Here, we try to use PB2, PB3, PB4, and PB5
    // Corresponding Pins in Arduino: 10, 11, 12, and 13 (Digital Pins)
    DDRB = DDRB | (0b1111<<2);

    // The forever loop to blink the LEDs
    while(1){
        // Now that the pins are set as output, we can turn on the LEDs
        // The PB2, PB3, PB4, and PB5 pins are set to HIGH, and wait for BLINK_DELAY
        PORTB = PORTB | (0b1111<<2);
        _delay_ms(BLINK_DELAY);

        // Now turn off the said LEDs
        // The PB2, PB3, PB4, and PB5 pins are set to LOW, and wait for BLINK_DELAY
        PORTB = PORTB & ~(0b1111<<2);
        _delay_ms(BLINK_DELAY);

    }

    // Return 0 to indicate successful completion
    return 0;
}