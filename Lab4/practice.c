// CO321 Embedded Systems
// Lab 04: Pulse Width Modulation (PWM)
// Exercise 0: Practice
// Group 09

// Question:
/*

*/

#include <avr/io.h>
#include <util/delay.h>  // For _delay_ms function

#define F_CPU 16000000UL  // Assuming 16MHz clock frequency

void setupPWM() {
    // 1. Configure the corresponding PWM pin as an output pin
    DDRD |= (1 << PD6);  // PD6 is OC0A on most AVRs (Arduino pin 6)
    
    // 2. Calculate and set duty cycle (50% of 256 = 128)
    // OCR0A = 127;  // 50% duty cycle
    
    // 3. Configure PWM settings
    // Fast PWM mode (WGM02:0 = 011)
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