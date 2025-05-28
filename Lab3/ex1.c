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
Let us use 1:64 Prescaler

Period of counter clock = 1 / (16 MHz / 64) = 4 microseconds
To toggle every 2 ms, we need to count 500 cycles (2 ms / 4 microseconds = 500).

Since 500 > 255, we need to use timer overflow to achieve this.

# of full overflows = 500 / 256 = 1 with a remainder
Remaining Increments = 500 - 1*256 = 244
Initial counter value = 256 - 244 = 12

i.e.

    * Timer starts counting from 12
    * Overflows after 244 counts
    * After overflow, counts 256 more counts
    * Total Counts: 244 + 256 = 500 counts

*/

// First, we need to include the necessary header files
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h> // DEBUGGING

volatile uint8_t overflow_count = 0; // To keep track of the number of overflows

void delay_timer()
{
    // First, we need to load the timer counter register with value 12
    TCNT0 = 12; // Initial counter value

    // We can now set the Timer Control Register (TCCR0A) to normal mode with a prescaler of 64
    TCCR0A = 0x00; // Normal mode
    TCCR0B = 0x03; // Prescaler of 64

    // We can enable the Timer Overflow Interrupt
    TIMSK0 |= (1 << TOIE0); // Enable Timer Overflow Interrupt

    // Enable global interrupts
    sei();

    while(overflow_count < 2) {
        // Wait until we have counted 2 overflows
        // This will take approximately 2 ms (2 * 256 * 4 microseconds)
    };

    // After 2 overflows, we can reset the overflow count
    TCCR0A = 0x00; // Stop the timer
    TCCR0B = 0x00; // Stop the timer
    TIMSK0 &= ~(1 << TOIE0); // Disable Timer Overflow Interrupt
    overflow_count = 0; // Reset the overflow count
    

}

// Now we have to write a Timer Overflow Interrupt Service Routine (ISR)
ISR (TIMER0_OVF_vect)
{
    overflow_count++;
    //TCNT0 = 12;
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