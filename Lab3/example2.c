// CO321 Embedded Systems
// Lab 02: AVR Interrupt Programming in C
// Example 1
// Group 09

// Question:
// Write a C program to toggle all the bits of 
// PORTB continuously with a fixed delay. 
// Use TIMER0, in normal mode, and no pre-scalar options to generate the delay.

// First, we need to include the necessary header files
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

// We can write the delay timer function
void delay_timer0(){
    // First, we have to load the timer counter register with value 0x00
    // TCNT means Timer Counter Register where the 8-bit counter value for TIMER0 is stored
    TCNT0 = 116;

    // Now we need to set the Timer Control Register (TCCR0A) to normal mode with no prescaler
    TCCR0A = 0x00; // Normal mode
    TCCR0B = 0x02; // No prescaler

    // We can wait until the timer overflows
    // Which means until Timer Overflow Flag (TOV0) is set
    while((TIFR0 & 0x01) == 0);

    // After the overflow, we need to clear timer settings
    // Which will stop the timer
    TCCR0A = 0x00; // Stop the timer
    TCCR0B = 0x00; // Stop the timer

    // Now we need to clear the timer overflow flag for the next round
    TIFR0 = (0x01); // Clear Timer Overflow Flag
    // In order to clear the flag, we should write a 1 to it


}

// Now we can define the main function to implement the toggle logic

int main (void){
    // Configure pin 5 of PORTB as output
    // Arduino pin 13 corresponds to PB5
    DDRB |= (1 << 4);

    

    while(1){
        PORTB = PORTB ^ (1<<4); // Toggle pin 5 of PORTB
        delay_timer0(); // Call the delay function
    }
}