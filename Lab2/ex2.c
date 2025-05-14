// CO321 Embedded Systems
// Lab 02: AVR Interrupt Programming in C
// Exercise 01: Toggle with Interrupt
// Group 09

// Question:
// Write a program that toggles pin PB0 
// (show using a connected LED) 
// whenever the push button is released, 
// using external interrupts.

// First and foremost, we need to include the necessary header files
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

// We can write the main function to implement the toggle logic
int main()
{
    // Let us use PD2 as the input pin for the button
    // We need to set the respective pin as input
    DDRD &= ~(1 << PD2);

    // Now we can set the output pin
    // Let us use PB0 as the output pin
    DDRB |= (1 << PB0); // Set PB0 as output

    // Since the logic should work whenever the button is released,
    // We need to set the INT0 to trigger on the falling edge
    // For this we need to look at EICRA (External Interrupt Control Register A)
    // According to the datasheet, we need to set the ISC01 bit to 1
    // and ISC00 bit to 0
    EICRA |= (1 << ISC01); 
    EICRA &= ~(1 << ISC00);

    // Now we can enable global interrupts to allow the interrupt to be triggered
    // For this we can use the sei() macro which sets the global interrupt enable bit
    // Global interrupt enable bit is in the SREG register (bit 7)
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
    // Toggle the LED connected to PB0
    // To toggle the LED, we can use the XOR operator
    // What XOR does is it flips the bit
    PORTB ^= (1 << PB0);

    // Add a small delay to debounce the button
    _delay_ms(100); 
}