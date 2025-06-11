#define F_CPU 16000000UL  // Arduino Uno runs at 16 MHz
#include <avr/io.h>
#include <util/delay.h>

// Helper function to delay for variable milliseconds
void variable_delay_ms(uint16_t duration) {
    while (duration--) {
        _delay_ms(1);
    }
}

// Configure Timer1 in CTC mode to toggle OC1A (PB1) at given OCR1A and prescaler
void setup_timer1_ctc(uint16_t ocr_value, uint16_t prescaler_bits) {
    DDRB |= (1 << PB1);  // Set PB1 (OC1A, Arduino Pin 9) as output

    TCCR1A = (1 << COM1A0); // Toggle OC1A on compare match
    TCCR1B = (1 << WGM12);  // CTC mode (WGM13:0 = 0100)

    TCCR1B |= prescaler_bits; // Set prescaler
    OCR1A = ocr_value;        // Set compare value
}

// Play a tone of given frequency (Hz) for given duration (ms)
void play_tone(uint16_t freq, uint16_t duration_ms) {
    // Try various prescalers to find valid OCR1A < 65536
    uint16_t prescalers[] = {1, 8, 64, 256, 1024};
    uint16_t prescaler_bits[] = {
        (1 << CS10),
        (1 << CS11),
        (1 << CS11) | (1 << CS10),
        (1 << CS12),
        (1 << CS12) | (1 << CS10)
    };

    for (uint8_t i = 0; i < 5; i++) {
        uint32_t ocr = (F_CPU / (2UL * prescalers[i] * freq)) - 1;
        if (ocr <= 65535) {
            setup_timer1_ctc((uint16_t)ocr, prescaler_bits[i]);
            break;
        }
    }

    variable_delay_ms(duration_ms);  // Delay while tone plays

    // Stop the timer and reset output
    TCCR1B = 0;
    PORTB &= ~(1 << PB1);
}

int main(void) {
    // Frequencies in Hz: D#4, G4, A#4, D#5
    uint16_t tones[] = {311, 392, 466, 622};
    uint8_t count = sizeof(tones) / sizeof(tones[0]);

    while (1) {
        for (uint8_t i = 0; i < count; i++) {
            play_tone(tones[i], 500);  // Play each tone for 500 ms
            variable_delay_ms(200);   // Delay between tones
        }
    }
}
