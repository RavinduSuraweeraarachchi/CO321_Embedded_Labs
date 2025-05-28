// CO321 Embedded Systems
// Lab 03: Using Timers in AVR
// Exercise 1: Toggle every 2 ms
// Group 09

// Question:
/*
Write a C program to toggle an LED connected to pin 5 of PORTB register (PB5) every 2ms.
Use TIMER0, normal mode, and a suitable pre-scalar to create the delay. 
Assume XTAL= 16 MHz. 
    * What is the selected prescaler? 
    * What is the initial counter value? Explain the output.
    * What is the reason for it?
*/

/*
CALCULATIONS:

XTAL = 16 MHz
i.e. 1 clock cycle = 1 / 16 microseconds
Let us use 1:256 Prescaler

Period of counter clock = 1 / (16 MHz / 256) = 16 microseconds
To toggle every 2 ms, we need to count 125 cycles (2 ms / 16 microseconds = 500).

In this case, we do not need to use timer overflow to achieve this, as 125 < 256.
Initial counter value = 256 - 125 = 131
i.e.

    * Timer starts counting from 131
    * Overflows after 125 counts
    * Total Counts: 125 cycles = 2 ms

*/

// First, we need to include the necessary header files
#include <avr/io.h>

void delay_timer()
{
    // First, we need to load the timer counter register with value 131
    TCNT0 = 131; // Initial counter value

    // We can now set the Timer Control Register (TCCR0A) to normal mode with a prescaler of 64
    TCCR0A = 0x00; // Normal mode
    TCCR0B = 0x04; // Prescaler of 256

    // We can enable the Timer Overflow Interrupt
    TIMSK0 |= (1 << TOIE0); // Enable Timer Overflow Interrupt


    while((TIFR0 & (1 << TOV0)) == 0); // Wait until Timer Overflow Flag is set

    TCCR0A = 0x00; // Stop the timer
    TCCR0B = 0x00; // Stop the timer
    TIFR0 |= (1 << TOV0); // Clear Timer Overflow Flag
    

}


int main()
{
    DDRB |= (1 << 5); // Configure pin 5 of PORTB as output (Arduino pin 13 corresponds to PB5)
    PORTB &= ~ (1 << 5); // Ensure pin 5 of PORTB is low initially

    while(1)
    {
        // Call 2ms delay 250 times to get ~500ms delay
        for (uint16_t i = 0; i < 250; i++) {
            delay_timer();
        }

        // Toggle the LED
        PORTB ^= (1 << 5);
    }
}