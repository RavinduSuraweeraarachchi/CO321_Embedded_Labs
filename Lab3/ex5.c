// CO321 Embedded Systems
// Lab 03: Using Timers in AVR
// Exercise 5: Increasing Delay to 100 ms
// Group 09

// Question:
/*
You found out the maximum interval you can implement using TIMER0 in exercise 3.
However, by using an 8-bit counter variable and interrupts, you can make this interval
much longer. 
Develop a program to blink an LED with a 100ms interval using TIMER0.
*/

/*
CALCULATIONS:

XTAL = 16 MHz
i.e. 1 clock cycle = 1 / 16 microseconds
Let us use the 1:1024 Prescaler

Period of counter clock = 1 / (16 MHz / 1024) = 64 microseconds

# of counts needed for 100 ms = 100 ms / 64 microseconds = 1562.5 counts.
We need to use timer overflow to achieve this, as 1562.5 > 256.

# of full overflows = 1562.5 / 256 = 6 with a remainder
Remaining Increments = 1562.5 - 6*256 = 50

Initial counter value = 256 - 50 = 206

i.e.

    * Timer starts counting from 206
    * Overflows after 50 counts
    * After overflow, counts 256 more counts
    * Total Counts: 50 + 256*6 = 1562.5 counts

*/

// First, we need to include the necessary header files
#include <avr/io.h>
#include <avr/interrupt.h>

// Let us define a overflow count variable
volatile uint8_t overflow_count = 0; // To keep track of the number of overflows

// Let us write the delay timer function
void delay_timer() 
{
    // First, we need to load the timer counter register with value 206
    TCNT0 = 206; // Initial counter value

    // We can now set the Timer Control Register (TCCR0A) to normal mode with a prescaler of 1024
    TCCR0A = 0x00; // Normal mode
    TCCR0B = 0x05; // Prescaler of 1024

    // We can enable the Timer Overflow Interrupt
    TIMSK0 |= (1 << TOIE0); // Enable Timer Overflow Interrupt

    // Enable global interrupts
    sei();

    // Wait until we have counted 6 overflows
    while (overflow_count < 6);

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
    // Configure pin 5 of PORTB as output (Arduino pin 13 corresponds to PB5)
    DDRB |= (1 << 5);
    
    // Clear PORTB to ensure the LED is off initially
    PORTB &= ~(1 << 5);

    while (1) 
    {
        // Toggle pin 5 of PORTB to turn on the LED
        PORTB ^= (1 << 5);
        
        // Call the delay function
        delay_timer();
    }
}

