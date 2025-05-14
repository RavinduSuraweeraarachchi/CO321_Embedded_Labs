// CO321 Embedded Systems
// Lab 02: AVR Interrupt Programming in C
// Exercise 01: Polling
// Group 09

// Question:
// PD7 pin is connected to a push button. 
// Write a program that uses 6 LEDs connected to PORTB (6 LSBs) 
// to display the number of times the push button is pressed, 
// as a binary number. 
// Implement without using external interrupts. (i.e. Use polling)

// First, we need to include the necessary header files
#include <avr/io.h>
#include <util/delay.h>

// Since interrupts are not used, we do not include <avr/interrupt.h>

// Define the PD7 pin number
#define PD7_PIN 7

// Now we can define the main function to implement the counter logic

int main()
{
    // Since we intend to use PD7 as input, we need to set it as input
    DDRD &= ~(1 << PD7_PIN); // Set PD7 as input by clearing the bit

    // Since we need to use PORTB for the LEDs, we need to set it as output
    DDRB |= 0b111111; // Set PORTB as output (6 LSBs)

    // Since we are counting the number of button presses, 
    // we need to initialize PORTB to 0
    PORTB = 0;

    // Making the forever loop
    while (1)
    {
        // Check if the button is pressed
        if (PIND & (1 << PD7_PIN))
        {   
            // Now we need to wait for the button to be released
            // This is to avoid multiple counts for a single press
            // Indirectly, this delay is the polling time
            _delay_ms(20);

            // Now we can check if the button is still pressed
            // This is to confirm the press
            if (PIND & (1 << PD7_PIN)) 
            {   
                // If so, we can increment the counter
                PORTB += 0b1; 

                // Wait for the button to be released
                // We can do that by checking the PD7 pin
                // And make sure it is not pressed
                while (PIND & (1 << PD7_PIN))
                {
                    // Do nothing, just wait
                    // This is a busy wait
                }
            }
        }
    }

    return 0;
}