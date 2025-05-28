// CO321 Embedded Systems
// Lab 03: Using Timers in AVR
// Exercise 6: Two Timers
// Group 09

// Question:
/*
Implement a program to blink two LEDs. 
One led should blink with an interval of 50 ms
and the other should blink with an interval of 500ms. 
You must use two timers, and timer overflow interrupts.
*/

/*
CALCULATIONS:

TIMER0 for 50 ms:

XTAL = 16 MHz
i.e. 1 clock cycle = 1 / 16 microseconds
Let us use the 1:256 Prescaler

Period of counter clock = 1 / (16 MHz / 256) = 16 microseconds

# of counts needed for 50 ms = 50 ms / 16 microseconds = 3125 counts.

# of full overflows = 3125 / 256 = 12 with a remainder
Remaining Increments = 3125 - 12*256 = 53

i.e. Initial counter value = 256 - 53 = 203

i.e.

    * Timer starts counting from 203
    * Overflows after 53 counts
    * After overflow, counts 256 more counts
    * Total Counts: 53 + 256*12 = 3125 counts


/////////////////////////////////////////////

TIMER2 for 500 ms:

XTAL = 16 MHz
// i.e. 1 clock cycle = 1 / 16 microseconds
// Let us use the 1:256 Prescaler

Period of counter clock = 1 / (16 MHz / 256) = 16 microseconds
# of counts needed for 500 ms = 500 ms / 16 microseconds = 31250 counts.
# of full overflows = 31250 / 256 = 122 with a remainder
# of Remaining Increments = 31250 - 122*256 = 18
Initial counter value = 256 - 18 = 238

i.e.
    * Timer starts counting from 238
    * Overflows after 18 counts
    * After overflow, counts 122 more overflows
    * Total Counts: 18 + 256*122 = 31250 counts
*/

// First, we need to include the necessary header files
#include <avr/io.h>
#include <avr/interrupt.h>

// Let us define overflow count variables for both timers
volatile uint8_t overflow_count_timer0 = 0; // For TIMER0
volatile uint16_t overflow_count_timer2 = 0; // For TIMER2

// Let us write the delay timer function for TIMER0 (50 ms)
void delay_timer() 
{
    // First, we need to load the timer counter register with value 203
    TCNT0 = 203; // Initial counter value

    // We can now set the Timer Control Register (TCCR0A) to normal mode with a prescaler of 256
    TCCR0A = 0x00; // Normal mode
    TCCR0B = 0x04; // Prescaler of 256

    // We can enable the Timer Overflow Interrupt
    TIMSK0 |= (1 << TOIE0); // Enable Timer Overflow Interrupt

    // We need to load the timer counter register with value 238
    TCNT2 = 238; // Initial counter value

    // We can now set the Timer Control Register (TCCR2A) to normal mode with a prescaler of 256
    TCCR2A = 0x00; // Normal mode
    TCCR2B = 0x04; // Prescaler of 256

    // We can enable the Timer Overflow Interrupt
    TIMSK2 |= (1 << TOIE2); // Enable Timer Overflow Interrupt

    // Enable global interrupts
    sei();

}

// ISR for Timer0 Overflow
ISR(TIMER0_OVF_vect) 
{
    static uint8_t ovf_count0 = 0;
    TCNT0 = 203; // Reload the timer counter register
    ovf_count0++;
    if (ovf_count0 >= 12) {
        PORTB ^= (1 << 4); // Toggle LED1
        ovf_count0 = 0;
        TCNT0 = 0x00; // Reload for next cycle
    } else {
        TCNT0 = 0x00;
    }
}

// ISR for Timer2 Overflow
ISR(TIMER2_OVF_vect) 
{
    static uint16_t ovf_count2 = 0;
    TCNT2 = 238; // Reload the timer counter register
    ovf_count2++;
    if (ovf_count2 >= 122) {
        PORTB ^= (1 << 5); // Toggle LED2
        ovf_count2 = 0;
        TCNT2 = 0x00; // Reload for next cycle
    } else {
        TCNT2 = 0x00;
    }
}

// Now we can define the main function to implement the toggle logic
// Let us use Pins PB4 and PB5 for the two LEDs

int main() 
{
    // Configure pin 4 of PORTB as output (Arduino pin 12 corresponds to PB4)
    DDRB |= (1 << 4);
    // Configure pin 5 of PORTB as output (Arduino pin 13 corresponds to PB5)
    DDRB |= (1 << 5);

    // Clear PORTB to ensure both LEDs are off initially
    PORTB &= ~((1 << 4) | (1 << 5)); // Ensure both LEDs are off initially

    delay_timer(); // Initialize the timers

    while (1) 
    {

    }

}

