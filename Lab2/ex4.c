// CO321 Embedded Systems
// Lab 02: AVR Interrupt Programming in C
// Exercise 04: Using two external interrupts
// Group 09

// Question:
// Connect two push buttons (A and B) to two external interrupt pins. 
// Connect 6 LEDs to a GPIO port. 
// Write a program where a user can input a binary number using the two push buttons 
// (press A to input a '0', press B to input a '1') through external interrupts,
// and display that number using the LEDs. 
// The number must be updated and displayed every time one of the buttons are pressed.

// First, we need to include the necessary header files
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>


// Let us define the main function to implement the logic
int main()
{
    // In this case, we need two pins which we can use as external interrupts
    // According to the datasheet, we can use PD2 and PD3 as INT0 and INT1 respectively
    // Hence, we need to set them as input
    DDRD &= ~(1 << PD2); // Set PD2 as input
    DDRD &= ~(1 << PD3); // Set PD3 as input

    // Now we can setup the output pins (for 6 LEDs)
    // We can use PORTB for the LEDs
    DDRB |= 0b111111;

    // We can initialize PORTB to 0
    PORTB = 0;

    // Now we can set the INT0 and INT1 to trigger on the falling edge
    // We use EICRA (External Interrupt Control Register A)
    // Now we have two external interrupts

    // INT0
    // According to the datasheet, we need to set the ISC01 bit to 1
    // and ISC00 bit to 0
    EICRA |= (1 << ISC01); // Set ISC01 to 1
    EICRA &= ~(1 << ISC00); // Set ISC00 to 0

    // INT1
    // According to the datasheet, we need to set the ISC11 bit to 1
    // and ISC10 bit to 0
    EICRA |= (1 << ISC11); // Set ISC11 to 1
    EICRA &= ~(1 << ISC10); // Set ISC10 to 0

    // Now we can enable global interrupts to allow the interrupt to be triggered
    sei();

    // Now we can enable the INT0 and INT1 external interrupts
    // For this we need to set the EIMSK (External Interrupt Mask Register)
    // We need to set the INT0 and INT1 bits to 1, which the pins PD2 and PD3 are connected to
    EIMSK |= (1 << INT0); // Enable INT0 interrupt
    EIMSK |= (1 << INT1); // Enable INT1 interrupt

    // Now we can enter an infinite loop
    while (1)
    {
        // Do nothing, just wait for the interrupt to be triggered
    }
    return 0;

}

// We need to have a variable i to store which bit to set
uint8_t i = 0;

// Now we can define the ISR (Interrupt Service Routine) for INT0
ISR(INT0_vect)
{
    // When the button A is pressed, we need to set the bit i to 0
    PORTB &= ~(1 << i); // Set the bit i to 0

    _delay_ms(500); // Wait for 500ms

    // Increment the i variable
    i++;
    

    // If i reaches 6, we need to reset it
    if (i>=6)
    {
        i = 0; // Reset i to 0
    }
}

// Now we can define the ISR (Interrupt Service Routine) for INT1
ISR(INT1_vect)
{
    // When the button B is pressed, we need to set the bit i to 1
    PORTB |= (1 << i); // Set the bit i to 1

    _delay_ms(500); // Wait for a short time`
    
    // Increment the i variable
    i++;

    // If i reaches 6, we need to reset it
    if (i>=6)
    {
        i = 0; // Reset i to 0
    }

}