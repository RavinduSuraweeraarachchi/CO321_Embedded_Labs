// CO321 Embedded Systems
// Lab 04: Pulse Width Modulation (PWM)
// Exercise 0: Practice
// Group 09

// Question:
/*
The frequency of the sound made by a piezo buzzer depends on the frequency of the
PWM waveform applied to it. In this case, the duty cycle affects the volume of the
sound. Write a program that repeatedly generates 4 separate sound frequencies in
increasing order one after the other. (each frequency should be heard for a notable
time before switching to the next frequency so that it can be heard properly). Keep in
mind that humans can hear frequencies in the range 20Hz - 20,000Hz only.
*/

#include <avr/io.h>
#include <util/delay.h>  // For _delay_ms function

void setupPWM() {
    // Configure the corresponding PWM pin as an output pin
    DDRB |= (1 << PB1);  // 
    
    // Configure PWM settings
    TCCR1A |= (1 << COM1A0);  // 
    TCCR1B |= (1 << WGM12);  // 
    
    // For F_CPU=16MHz: N = 64 (prescaler)
    TCCR1B |= (1 << CS01) | (1 << CS00);  // Prescaler = 64
}

int main(void) {
    setupPWM();

    // Notes Considered: Eb4, G4, A#4, Eb5
    // Frequencies in Hz: 311.13, 392.00, 466.16, 622.25
    // Calculate OCR1A values for each frequency
    // f = F_CPU / (2 * N * OCR1A)
    // For F_CPU = 16MHz and prescaler = 64:
    // OCR1A = (F_CPU / (2 * 64 * f)) - 1
    // For 311.13Hz: OCR1A = (16000000 / (2 * 64 * 311.13)) - 1 = 400
    // For 392.00Hz: OCR1A = (16000000 / (2 * 64 * 392.00)) - 1 = 318
    // For 466.16Hz: OCR1A = (16000000 / (2 * 64 * 466.16)) - 1 = 266
    // For 622.25Hz: OCR1A = (16000000 / (2 * 64 * 622.25)) - 1 = 200

    // Higher the frequency, lower the OCR1A value
    
    while (1) {

        OCR1A = 400;
        _delay_ms(1000);  

        OCR1A = 318;
        _delay_ms(1000);  

        OCR1A = 266;
        _delay_ms(1000);  

        OCR1A = 200;
        _delay_ms(1000);

    }
    
    return 0;
}