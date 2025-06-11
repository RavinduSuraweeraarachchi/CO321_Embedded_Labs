#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>

// Configure Timer1 in CTC mode to toggle OC1A (PB1 / pin 9)
void setupCTC_Timer1(uint16_t ocr_value, uint16_t prescaler_bits) {
    DDRB |= (1 << PB1);  // Set PB1 (OC1A) as output

    TCCR1A = (1 << COM1A0);  // Toggle OC1A on compare match
    TCCR1B = (1 << WGM12);   // CTC mode: WGM13:0 = 0100
    TCCR1B |= prescaler_bits;

    OCR1A = ocr_value;  // Compare value for CTC
}

int main(void) {
    // Example: generate a 440 Hz tone on PB1 using CTC mode
    // Choose a prescaler and calculate OCR1A
    // f = 440 Hz, prescaler = 64:
    // OCR1A = (F_CPU / (2 * N * f)) - 1
    uint16_t freq = 440;
    uint16_t prescaler = 64;
    uint16_t ocr_val = (F_CPU / (2UL * prescaler * freq)) - 1;

    // Set prescaler bits for 64 → CS11 | CS10
    uint16_t prescaler_bits = (1 << CS11) | (1 << CS10);

    setupCTC_Timer1(ocr_val, prescaler_bits);

    while (1) {
        // Tone keeps playing from Timer1, do nothing or add blinking, etc.
        _delay_ms(1000);
    }
}
