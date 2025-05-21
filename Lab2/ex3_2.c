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

// NOTE: The code is configured for an Active LOW button configuration.

// First, we need to include the necessary header files
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

// A volatile variable to store the button press count
// This is required to count the number of times the button is pressed
// and is declared as volatile because it is modified in the ISR
// and accessed in the main loop
volatile uint8_t buttonPressCount = 0;  

// Let us define the main function to implement the counter logic
int main()
{
    // Since we intend to use PD2 as input, we need to set it as input
    DDRD &= ~(1 << PD2);

    // Also, we can enable the pull-up resistor on PD2
    PORTD |= (1 << PD2);
    
    // Since we need to use PORTB for the LEDs, we need to set it as output
    DDRB |= 0b00111111;

    // For the counting, we can initialize PORTB to 0
    PORTB = 0;

    // Again, we count the # of times the button is released
    // Hence, we need to set INT0 to trigger on the falling edge
    // For this we need to look at EICRA (External Interrupt Control Register A)
    // According to the datasheet, we need to set the ISC01 bit to 1
    // and ISC00 bit to 0
    EICRA |= (1 << ISC01);
    EICRA &= ~(1 << ISC00);
    
    // Now we can enable the INT0 external interrupt
    // For this we need to set the EIMSK (External Interrupt Mask Register)
    // We need to set the INT0 bit to 1, which the pin PD2 is connected to
    EIMSK |= (1 << INT0);
    
    // Now we can enable global interrupts to allow the interrupt to be triggered
    sei();

    // In this infinite loop, 
    while (1) 
    {
        // Here, we continuously display the current binary value
        // The binary value will be updated in the ISR when a button is pressed
        PORTB = buttonPressCount & 0b00111111;
    }

    return 0;
}

// Now we can define the ISR (Interrupt Service Routine) for INT0
// This is the function that will be called when the interrupt is triggered
ISR(INT0_vect)
{
    // Immediately disable interrupt to prevent re-triggering
    EIMSK &= ~(1 << INT0);
    
    // Simple debounce delay
    _delay_ms(100);
    
    // Verify button is still pressed (active low)
    if (!(PIND & (1 << PD2))) {
        buttonPressCount++;
    }
    
    _delay_ms(20); // Additional debounce delay

    // Re-enable interrupt after processing is complete
    EIMSK |= (1 << INT0);
}