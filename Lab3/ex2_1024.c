// CO321 Embedded Systems
// Lab 03: Using Timers in AVR
// Exercise 2: Increasing Delay to 500 ms
// Group 09

// Question:
/*
Try to increase the delay in Exercise 1 to 500ms. 
Talk to an instructor and explain how this can be done, or why this cannot be done.
*/

/*
CALCULATIONS:

XTAL = 16 MHz
i.e. 1 clock cycle = 1 / 16 microseconds
Let us use the 1:1024 Prescaler

Period of counter clock = 1 / (16 MHz / 1024) = 64 microseconds
One overflow of the timer will take 256 * 64 microseconds = 16.384 milliseconds.
i.e. # of overflows needed for 500 ms = 500 ms / 16.384 ms = 30.5176
We need 31 overflows to achieve an approximate delay of 500 ms.

*/

// First, we need to include the necessary header files
#include <avr/io.h>
#include <avr/interrupt.h>

// Let us define a overflow count variable
volatile uint8_t overflow_count = 0; // To keep track of the number of overflows

// Let us write the delay timer function
void delay_timer() {
    // First, we need to load the timer counter register with value 0x00
    TCNT0 = 0x00; // Initial counter value

    // We can now set the Timer Control Register (TCCR0A) to normal mode with a prescaler of 1024
    TCCR0A = 0x00; // Normal mode
    TCCR0B = 0x05; // Prescaler of 1024

    // We can enable the Timer Overflow Interrupt
    TIMSK0 |= (1 << TOIE0); // Enable Timer Overflow Interrupt

    // Enable global interrupts
    sei();
    
    // Wait until we have counted 31 overflows
    while (overflow_count < 31);

    // Stop the timer
    TCCR0A = 0x00; // Stop the timer
    TCCR0B = 0x00; // Stop the timer

    // Clear the overflow count for the next round
    overflow_count = 0;
}

// ISR for Timer0 Overflow
ISR(TIMER0_OVF_vect) {
    overflow_count++; // Increment the overflow count
    TCNT0 = 0x00; // Reset the timer counter to 0 for the next overflow
}

// Now we can define the main function to implement the toggle logic
int main(void) {
    // Configure pin 5 of PORTB as output
    DDRB |= (1 << 5); // Arduino pin 13 corresponds to PB5
    PORTB &= ~(1 << 5); // Ensure pin 5 of PORTB is low initially

    while (1) {
        // Call the delay function to achieve approximately 500 ms delay
        delay_timer();

        // Toggle pin 5 of PORTB
        PORTB ^= (1 << 5);
    }
}
