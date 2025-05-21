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

// Here we define a volatile variable to indicate button release
// This is required to indicate whether the button has been released
volatile uint8_t button_released = 0;

// Let us define the main function to implement the toggle logic
int main()
{
    // Let us use PD2 as the input pin for the button
    // We need to set the respective pin as input
    DDRD &= ~(1 << PD2);

    // We can enable the pull-up resistor on PD2
    PORTD |= (1 << PD2);

    // Now we can set the output pin
    // Let us use PB0 as the output pin
    DDRB |= (1 << PB0);

    // Initialize the PB0 to 0
    // This will turn off the LED initially
    PORTB &= ~(1 << PB0);

    // Since the logic should work whenever the button is released,
    // We need to set the INT0 to trigger on the falling edge
    // For this we need to look at EICRA (External Interrupt Control Register A)
    // According to the datasheet, we need to set the ISC01 bit to 1
    // and ISC00 bit to 0
    EICRA |= (1 << ISC01); 
    EICRA &= ~(1 << ISC00);

    // Now we can enable the INT0 external interrupt
    // For this we need to set the EIMSK (External Interrupt Mask Register)
    EIMSK |= (1 << INT0);
    
    // Enable global interrupts
    sei();

    // Now we can enter an infinite loop
    while (1)
    {   
        // Continuously check if the button has been released or not
        if (button_released) {
            // If the button is released, toggle the LED
            PORTB ^= (1 << PB0);
            
            // After toggling, reset the button_released flag
            button_released = 0;
            
            // Wait for button to be fully released
            while (!(PIND & (1 << PD2))) {
                _delay_ms(1);
            }
            
            // Small debounce delay after release
            _delay_ms(20);
        }
    }
    return 0;
}

// Now we can define the ISR (Interrupt Service Routine) for INT0
// This is the function that will be called when the interrupt is triggered
ISR(INT0_vect)
{
    // Simple debounce delay
    _delay_ms(20);
    
    // Verify button is still pressed (active low)
    if (!(PIND & (1 << PD2))) {
        button_released = 1;
    }
}