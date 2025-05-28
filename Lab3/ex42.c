#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#define BLINK_DELAY 100

void timer1_init()
{
    TCNT1 = 49911; // Initial counter value for 1s
    TCCR1A = 0x00;
    TCCR1B = 0x05; // Prescaler 1024
    TIMSK1 |= (1 << TOIE1); // Enable Timer1 overflow interrupt
    sei();
}

ISR(TIMER1_OVF_vect)
{
    PORTB ^= (1 << 5); // Toggle PB5
    TCNT1 = 49911;     // Reload timer for next 1s
}

int main(void)
{
    DDRB |= (1<<1) | (1 << 2) | (1 << 3) | (1 << 4) | (1 << 5); // PB2–PB5 as output
    PORTB &= ~((1<<1) | (1 << 2) | (1 << 3) | (1 << 4) | (1 << 5)); // All off

    timer1_init();

    while (1)
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
}