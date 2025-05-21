#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

volatile uint8_t current_bit = 0;  // Tracks which bit we're setting
volatile uint8_t binary_value = 0; // Stores the complete binary value

int main()
{
    // Set PD2 (INT0) and PD3 (INT1) as inputs with pull-ups
    DDRD &= ~((1 << PD2) | (1 << PD3));
    PORTD |= (1 << PD2) | (1 << PD3);
    
    // Set PORTB as output (6 LSBs for LEDs)
    DDRB |= 0b00111111;
    PORTB = 0;

    // Configure INT0 and INT1 to trigger on falling edge (button press)
    EICRA |= (1 << ISC01) | (1 << ISC11);  // Falling edge triggers
    EICRA &= ~((1 << ISC00) | (1 << ISC10));
    
    // Enable INT0 and INT1 interrupts
    EIMSK |= (1 << INT0) | (1 << INT1);
    
    // Enable global interrupts
    sei();

    while (1) 
    {
        // Continuously display the current binary value
        PORTB = binary_value & 0b00111111;
    }

    return 0;
}

// Common debounce and button handling function
void handle_button(uint8_t bit_value)
{
    // Disable interrupts temporarily
    EIMSK &= ~((1 << INT0) | (1 << INT1));
    
    // Debounce delay
    _delay_ms(20);
    
    // Verify button is still pressed (active low)
    if ((bit_value == 0 && !(PIND & (1 << PD2))) || 
        (bit_value == 1 && !(PIND & (1 << PD3)))) {
        
        // Set the current bit
        if (bit_value) {
            binary_value |= (1 << current_bit);
        } else {
            binary_value &= ~(1 << current_bit);
        }
        
        // Move to next bit
        current_bit = (current_bit + 1) % 6;
        
        // Wait for button release
        while ((bit_value == 0 && !(PIND & (1 << PD2))) || 
               (bit_value == 1 && !(PIND & (1 << PD3)))) {
            _delay_ms(10);
        }
    }
    
    // Re-enable interrupts
    EIMSK |= (1 << INT0) | (1 << INT1);
}

ISR(INT0_vect)  // Button A (input 0)
{
    handle_button(0);
}

ISR(INT1_vect)  // Button B (input 1)
{
    handle_button(1);
}