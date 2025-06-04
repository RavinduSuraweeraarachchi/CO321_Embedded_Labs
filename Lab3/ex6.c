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

TIMER1 for 500 ms:
XTAL = 16 MHz
i.e. 1 clock cycle = 1 / 16 microseconds
Let us use the 1:256 Prescaler
// Period of counter clock = 1 / (16 MHz / 256) = 16 microseconds
// # of counts needed for 500 ms = 500 ms / 16 microseconds = 31250 counts.
// Since 31250 < 65536, we can use the 16-bit timer (TIMER1)

In this case, we have decided to use the CTC mode of TIMER1
CTC mode allows us to set a specific count value (OCR1A)
At this OCR1A value, the timer will reset and trigger an interrupt
We can set OCR1A TO 31249
*/

// First, we need to include the necessary header files
#include <avr/io.h>
#include <avr/interrupt.h>

// Let us define the LED pins
// We will use PB4 and PB5 for the two LEDs
// Arduino Pins 12 and 13 correspond to PB4 and PB5 respectively
#define LED1 PB4 
#define LED2 PB5  

// Let us define overflow count variables for TIMER0
volatile uint8_t timer0_ovfs = 0;

// Let us write the delay timer function for TIMER0 (50 ms)
void timers_init() {

    // First, we need to load the timer counter register with value 203
    TCNT0 = 203;

    // We can now set the Timer Control Register (TCCR0A) to normal mode with a prescaler of 256
    TCCR0A = 0x00;        // Normal mode
    TCCR0B = (1 << CS02); // Prescaler 256

    // We can enable the Timer Overflow Interrupt
    TIMSK0 = (1 << TOIE0); // Overflow interrupt

    // Now, we will set up TIMER1 for 500 ms using CTC mode
    // We have both TCCR1A and TCCR1B for TIMER1
    // TCCR1A is used for mode selection and TCCR1B for prescaler
    TCCR1A = 0x00;        // Normal mode
    TCCR1B = (1 << WGM12) | (1 << CS12); // CTC mode, prescaler 256

    // WGM12 is set for CTC mode, and CS12 sets the prescaler to 256

    // Since we are in CTC mode, we need to set the Output Compare Register (OCR1A)
    OCR1A = 31249; // Set compare value for 500ms

    // Finally, we enable the compare match interrupt for TIMER1
    TIMSK1 = (1 << OCIE1A); // Compare match interrupt

    sei(); // Enable global interrupts
}

// The ISR for TIMER0 overflow
ISR(TIMER0_OVF_vect) {

    // This if statement is to check the initial 53 increments
    // After the first 53 counts, we will start counting full overflows
    if (timer0_ovfs == 0) {
        // We make TCNT0 = 0 to start counting from 0
        TCNT0 = 0;
        timer0_ovfs++;
    } 
    
    // Now we check for 11 overflows
    else if (timer0_ovfs < 12) {
        // Middle overflows (11 more)
        timer0_ovfs++;
    }
    
    // After 12 overflows, we toggle the LED and reset the counter
    else {
        // 12th overflow complete (53 + 256*12 = 3125 counts)
        PORTB ^= (1 << LED1);
        // Make TCNT0 = 203 to start counting again (Initial 53 increments)
        TCNT0 = 203;
        timer0_ovfs = 0;
    }
}

// The ISR for TIMER1 compare match
ISR(TIMER1_COMPA_vect) {
    // No issue with this interrupt, we just toggle the LED
    PORTB ^= (1 << LED2);
}

// Main function to initialize the LEDs and timers
int main() {

    // Set the LED pins as output
    DDRB |= (1 << LED1) | (1 << LED2);

    // Initially turn off the LEDs
    PORTB &= ~((1 << LED1) | (1 << LED2));

    // Run the timers initialization function
    timers_init();
    
    while (1) {
        // Main loop does nothing
    }
}