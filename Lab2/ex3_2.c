#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

volatile uint8_t buttonPressCount = 0;  // Counter variable

int main()
{
    // Set PD2 as input (button) with pull-up
    DDRD &= ~(1 << PD2);
    PORTD |= (1 << PD2);
    
    // Set PORTB as output (6 LSBs for LEDs)
    DDRB |= 0b00111111;
    PORTB = 0;

    // Configure INT0 to trigger on falling edge (button press)
    EICRA |= (1 << ISC01);
    EICRA &= ~(1 << ISC00);
    
    // Enable INT0 interrupt
    EIMSK |= (1 << INT0);
    
    // Enable global interrupts
    sei();

    while (1) 
    {
        // Continuously update the display
        PORTB = buttonPressCount & 0b00111111;
    }

    return 0;
}

ISR(INT0_vect)
{
    // Immediately disable interrupt to prevent re-triggering
    EIMSK &= ~(1 << INT0);
    
    // Simple debounce delay
    _delay_ms(100);
    
    // Verify button is still pressed (active low)
    if (!(PIND & (1 << PD2))) {
        buttonPressCount++;
        
        // Wait for button release before re-enabling interrupt
        // This prevents counting multiple times during long press
        // while (!(PIND & (1 << PD2))) {
        //     _delay_ms(10);
        // }
    }
    
    _delay_ms(20); // Additional debounce delay

    // Re-enable interrupt after processing is complete
    EIMSK |= (1 << INT0);
}