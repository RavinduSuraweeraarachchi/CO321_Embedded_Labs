// CO321 Embedded Systems
// Lab 03: Using Timers in AVR
// Exercise 4: Toggle + Knight Rider
// Group 09

// Question:
/*
Write a program that toggles 
an LED connected to PB5 pin every second using TIMER1,
while at the same time 
operating a Knight Rider style circuit of 4 LEDs (from Lab 1). 
For the LED toggle you must use the timer overflow interrupts. 
For the Knight Rider style circuit
you are allowed use either timer interrupts, 
polling, software delays or any other method.
*/

/*
CALCULATIONS:

XTAL = 16 MHz
i.e. 1 clock cycle = 1 / 16 microseconds
Let us use the 1:1024 Prescaler

Period of counter clock = 1 / (16 MHz / 1024) = 64 microseconds

3 of counts needed for 1 second = 1 second / 64 microseconds = 15625 counts.
Do NOT need to use timer overflow to achieve this, as 15625 < 65536.

i.e. Initial counter value = 65536 - 15625 = 49911
*/


// Include Headers
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

// Define the delay for the blinking
// The BLINK_DELAY is the delay for each LED to blink
#define BLINK_DELAY 100

// The idea is to turn on the LEDs one by one, and
// in between, keep two consecutive LEDs on
// This gives a smooth transition effect


void delay_timer()
{
    // First, we need to load the timer counter register with value 49911
    TCNT1 = 49911; // Initial counter value

    // We can now set the Timer Control Register (TCCR1A) to normal mode with a prescaler of 1024
    TCCR1A = 0x00; // Normal mode
    TCCR1B = 0x05; // Prescaler of 1024

    // We can enable the Timer Overflow Interrupt
    TIMSK1 |= (1 << TOIE1); // Enable Timer Overflow Interrupt

    // Enable global interrupts
    sei();

}

ISR (TIMER1_OVF_vect)
{
    // This ISR is called when the timer overflows
    // We can toggle the LED connected to PB5 (Arduino pin 13)
    PORTB ^= (1 << 5); // Toggle PB5
    
    // Reload the counter for the next overflow
    TCNT1 = 49911; // Reload timer for next 1 second

}

int main (void){
    // First, we enable the PB2, PB3, PB4, and PB5 pins for output
    // The DDRB is the Data Direction Register B, which is used to set the direction of the pins
    DDRB = DDRB|(0b1111<<1);

    DDRB |= (1<<1) | (1 << 2) | (1 << 3) | (1 << 4) | (1 << 5); // PB2–PB5 as output
    PORTB &= ~((1<<1) | (1 << 2) | (1 << 3) | (1 << 4) | (1 << 5)); // All off
    
    delay_timer(); // Initialize the timer
    
    // The forever loop for the Knight Rider sequence
    while(1)
    {   
        
        // Knight Rider forward
        for (int i = 1; i <= 4; i++)
        {
            // Preserve PB5, update PB1–PB4
            PORTB = (PORTB & (1 << 5)) | (1 << i);
            _delay_ms(BLINK_DELAY);
        }
        // Knight Rider backward
        for (int i = 3; i >= 2; i--)
        {
            PORTB = (PORTB & (1 << 5)) | (1 << i);
            _delay_ms(BLINK_DELAY);
        }
        
    }

    return 0;
}