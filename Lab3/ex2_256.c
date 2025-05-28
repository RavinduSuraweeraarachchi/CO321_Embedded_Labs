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
Let us use the 1:256 Prescaler

Period of counter clock = 1 / (16 MHz / 256) = 16 microseconds
Counter increments needed for 500 ms = 500 ms / 16 microseconds = 31250 counts.
We need to use timer overflow to achieve this, as 31250 > 256.

# of full overflows = 31250 / 256 = 122 with a remainder
Remaining Increments = 31250 - 122*256 = 18
Initial counter value = 256 - 18 = 238


*/

#include <avr/io.h>
#include <avr/interrupt.h>

volatile uint16_t overflow_count = 0; // To keep track of the number of overflows

void delay_timer_256()
{
    // First, we need to load the timer counter register with value 238
    TCNT0 = 238; // Initial counter value

    // We can now set the Timer Control Register (TCCR0A) to normal mode with a prescaler of 256
    TCCR0A = 0x00; // Normal mode
    TCCR0B = 0x04; // Prescaler of 256

    // We can enable the Timer Overflow Interrupt
    TIMSK0 |= (1 << TOIE0); // Enable Timer Overflow Interrupt

    // Enable global interrupts
    sei();

    // Wait until we have counted 122 overflows
    while (overflow_count < 122);

    // Stop the timer
    TCCR0A = 0x00; // Stop the timer
    TCCR0B = 0x00; // Stop the timer

    // Clear the overflow count for the next round
    overflow_count = 0;
}

// ISR for Timer0 Overflow
ISR(TIMER0_OVF_vect)
{
    overflow_count++; // Increment the overflow count
}

// Now we can define the main function to implement the toggle logic
int main()
{
    DDRB |= (1 << 5); // Configure pin 5 of PORTB as output (Arduino pin 13 corresponds to PB5)
    PORTB &= ~(1 << 5); // Ensure pin 5 of PORTB is low initially

    while (1)
    {
        PORTB ^= (1 << 5); // Toggle pin 5 of PORTB
        delay_timer_256(); // Call the delay function
    }
}