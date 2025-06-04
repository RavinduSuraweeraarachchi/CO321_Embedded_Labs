#include <avr/io.h>
#include <avr/interrupt.h>

#define LED1 PB4 // Toggles every 50ms (100ms period)
#define LED2 PB5 // Toggles every 500ms (1000ms period)

// Global counters
volatile uint16_t timer1_ovf_count = 0;
volatile uint16_t timer2_ovf_count = 0;

void timers_init() {
    // TIMER1 (16-bit) for precise 50ms
    // 16MHz/256 = 62,500 Hz (16μs per tick)
    // 50ms = 50,000μs → 50,000/16 = 3125 ticks
    // 65536 - 3125 = 62411
    TCNT1 = 62411;
    TCCR1A = 0x00;       // Normal mode
    TCCR1B = (1 << CS12); // Prescaler 256
    TIMSK1 = (1 << TOIE1); // Overflow interrupt

    // TIMER2 (8-bit) for 4ms ticks (count 125 for 500ms)
    // 16MHz/1024 = 15,625 Hz (64μs per tick)
    // 4ms = 4,000μs → 4,000/64 = 62.5 → use 62 ticks (3.968ms)
    // 256 - 62 = 194
    // 125 × 3.968ms ≈ 496ms (close enough to 500ms)
    TCNT2 = 194;
    TCCR2A = 0x00;       // Normal mode
    TCCR2B = (1 << CS22) | (1 << CS21) | (1 << CS20); // Prescaler 1024
    TIMSK2 = (1 << TOIE2); // Overflow interrupt

    sei(); // Enable interrupts
}

ISR(TIMER1_OVF_vect) {
    TCNT1 = 62411; // Reload for exact 50ms
    PORTB ^= (1 << LED1); // Toggle LED1
}

ISR(TIMER2_OVF_vect) {
    TCNT2 = 194; // Reload for ~4ms
    timer2_ovf_count++;
    if (timer2_ovf_count >= 125) { // 125 × 3.968ms ≈ 496ms
        PORTB ^= (1 << LED2); // Toggle LED2
        timer2_ovf_count = 0;
    }
}

int main() {
    DDRB |= (1 << LED1) | (1 << LED2);
    PORTB &= ~((1 << LED1) | (1 << LED2));
    
    timers_init();

    while (1) {
        // Main loop does nothing
    }
}