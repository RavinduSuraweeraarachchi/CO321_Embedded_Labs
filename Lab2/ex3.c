// CO321 Embedded Systems
// Lab 02: AVR Interrupt Programming in C
// Exercise 03: Binary Counter with Interrupt
// Group 09

// Question:
// PD7 pin is connected to a push button. 
// Write a program that uses 6 LEDs connected to PORTB (6 LSBs) 
// to display the number of times the push button is pressed, 
// as a binary number. 
// Extend the program so that the number of times the push button was released
// is displayed as a binary number on a set of LEDs connected to PORTB

// First, we need to include the necessary header files
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

// Let us define the main function to implement the counter logic
int main()
{
    // Since we intend to use PD2 as input, we need to set it as input
    DDRD &= ~(1 << PD2); // Set PD2 as input by clearing the bit

    // Since we need to use PORTB for the LEDs, we need to set it as output
    DDRB |= 0b111111; // Set PORTB as output (6 LSBs)

    // For the counting, we can initialize PORTB to 0
    PORTB = 0;

    // Again, we count the # of times the button is released
    // Hence, we need to set INT0 to trigger on the falling edge
    // For this we need to look at EICRA (External Interrupt Control Register A)
    // According to the datasheet, we need to set the ISC01 bit to 1
    // and ISC00 bit to 0
    EICRA |= (1<< ISC01);
    EICRA &= ~(1<< ISC00);

    // Now we can enable global interrupts to allow the interrupt to be triggered
    sei();

    // Now we can enable the INT0 external interrupt
    // For this we need to set the EIMSK (External Interrupt Mask Register)
    // We need to set the INT0 bit to 1, which the pin PD2 is connected to
    EIMSK |= (1 << INT0);

    // Now we can enter an infinite loop
    while (1)
    {
        // Do nothing, just wait for the interrupt to be triggered
    }

    return 0;
}

// Now we can define the ISR (Interrupt Service Routine) for INT0
// This is the function that will be called when the interrupt is triggered

ISR (INT0_vect)
{
    // Increment the counter
    PORTB += 0b1; // Increment the counter by 1
    _delay_ms(500); 

    // Wait for the button to be released
    // We can do that by checking the PD2 pin
    // And make sure it is not pressed
    while (PIND & (1 << PD2))
    {
        // Do nothing, just wait
        // This is a busy wait
        // This is to avoid multiple counts for a single press
        _delay_ms(100);
    }
}