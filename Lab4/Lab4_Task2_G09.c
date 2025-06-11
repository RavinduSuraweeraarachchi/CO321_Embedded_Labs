// CO321 Embedded Systems
// Lab 04: Pulse Width Modulation (PWM)
// Exercise 0: Practice
// Group 09

// Question:
/*
Write a program that generates a PWM waveform with a frequency of approximately
976.56Hz and a duty cycle of 50%. 
Connect one LED to the PWM output pin and another to the 5V output pin 
(LEDs and the resistors you use should be identical)
and check if the intensity of the bulb connected to the PWM is half of the other.
Extend the program to slowly fade an LED from off->on and
then on->off repeatedly.
*/

#include <avr/io.h>
#include <util/delay.h>  // For _delay_ms function

void setupPWM() {
    // 1. Configure the corresponding PWM pin as an output pin
    DDRD |= (1 << PD6);  // PD6 is OC0A on most AVRs (Arduino pin 6)

    // We do not need a set Duty Cycle here as we fade in and out.
    // 2. Calculate and set duty cycle (50% of 256 = 128)
    // OCR0A = 127;  // 50% duty cycle
    
    // 3. Configure PWM settings
    // Fast PWM mode (WGM02:0 = 011)
    // Mode of Operation: Fast PWM
    // TOP = 0xFF (8-bit)

    TCCR0A |= (1 << WGM01) | (1 << WGM00);  // Fast PWM, 8-bit
    TCCR0B &= ~(1 << WGM02);  // Part of Fast PWM mode setting
    
    // Non-inverting mode (COM0A1:0 = 10)
    TCCR0A |= (1 << COM0A1);
    TCCR0A &= ~(1 << COM0A0);
    
    // 4. Select clock source with prescaler to achieve ~976.56Hz
    // For Fast PWM: freq = F_CPU / (N * 256)
    // For 976.56Hz with F_CPU=16MHz: N = 64 (prescaler)
    TCCR0B |= (1 << CS01) | (1 << CS00);  // Prescaler = 64
    TCCR0B &= ~(1 << CS02);
}

int main(void) {
    setupPWM();
    
    while (1) {
        // Fade in
        for (uint8_t duty = 0; duty < 255; duty++) {
            OCR0A = duty;
            _delay_ms(10);  // Adjust delay for speed of fading
        }
        // Fade out
        for (uint8_t duty = 255; duty > 0; duty--) {
            OCR0A = duty;
            _delay_ms(10);
        }
    }
    
    return 0;
}