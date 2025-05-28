#include <avr/io.h>
#include <avr/interrupt.h>

// LED pins
#define LED1 PB4 // 50 ms blink
#define LED2 PB5 // 500 ms blink

volatile uint8_t t0_ovf = 0;
volatile uint16_t t2_ovf = 0;

void timers_init() {
    // TIMER0: 50 ms, prescaler 256, start at 203, 12 overflows
    TCNT0 = 203;
    TCCR0A = 0x00;
    TCCR0B = 0x04; // prescaler 256
    TIMSK0 |= (1 << TOIE0);

    // TIMER2: 500 ms, prescaler 256, start at 238, 122 overflows
    TCNT2 = 238;
    TCCR2A = 0x00;
    TCCR2B = 0x04; // prescaler 256
    TIMSK2 |= (1 << TOIE2);

    sei();
}

ISR(TIMER0_OVF_vect) {
    static uint8_t ovf_count0 = 0;
    ovf_count0++;
    if (ovf_count0 >= 12) {
        PORTB ^= (1 << LED1); // Toggle LED1
        ovf_count0 = 0;
        TCNT0 = 203; // Reload for next cycle
    } else {
        TCNT0 = 0x00;
    }
}

ISR(TIMER2_OVF_vect) {
    static uint16_t ovf_count2 = 0;
    ovf_count2++;
    if (ovf_count2 >= 122) {
        PORTB ^= (1 << LED2); // Toggle LED2
        ovf_count2 = 0;
        TCNT2 = 238; // Reload for next cycle
    } else {
        TCNT2 = 0x00;
    }
}

int main() {
    DDRB |= (1 << LED1) | (1 << LED2); // Set LED pins as output
    PORTB &= ~((1 << LED1) | (1 << LED2)); // LEDs off

    timers_init();

    while (1) {
        // Main loop does nothing, all work is done in ISRs
    }
}