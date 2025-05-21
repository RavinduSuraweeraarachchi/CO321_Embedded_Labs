// CO321 Embedded Systems
// Lab 02: AVR Interrupt Programming in C
// Exercise 04: Using two external interrupts
// Group 09

// Question:
// Connect two push buttons (A and B) to two external interrupt pins. 
// Connect 6 LEDs to a GPIO port. 
// Write a program where a user can input a binary number using the two push buttons 
// (press A to input a '0', press B to input a '1') through external interrupts,
// and display that number using the LEDs. 
// The number must be updated and displayed every time one of the buttons are pressed.

// NOTE: The code is configured for an Active LOW button configuration.

// First, we need to include the necessary header files
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

// Here, we define two required bits
// current_bit: which bit we are setting (0-5)
// binary_value: the complete binary value (0-63)
// They are volatile because they are modified in the ISR and accessed in the main loop
volatile uint8_t current_bit = 0;  // Tracks which bit we're setting
volatile uint8_t binary_value = 0; // Stores the complete binary value

int main()
{
    // In this case, we need two pins which we can use as external interrupts
    // According to the datasheet, we can use PD2 and PD3 as INT0 and INT1 respectively
    // Hence, we need to set them as input
    DDRD &= ~((1 << PD2) | (1 << PD3));

    // Enable pull-up resistors on PD2 and PD3
    PORTD |= (1 << PD2) | (1 << PD3);
    
    // Now we can setup the output pins (for 6 LEDs)
    // We can use PORTB for the LEDs
    // Set PORTB as output (6 LSBs for LEDs)
    DDRB |= 0b00111111;

    // Initialize PORTB to 0
    // This will turn off all LEDs initially
    PORTB = 0;

    // Now we can set the INT0 and INT1 to trigger on the falling edge
    // We use EICRA (External Interrupt Control Register A)
    // Now we have two external interrupts

    // According to the datasheet, we need to 
    // Set the ISC01 bit to 1
    // Set the ISC00 bit to 0
    // Set the ISC11 bit to 1
    // Set the ISC10 bit to 0

    EICRA |= (1 << ISC01) | (1 << ISC11);  
    EICRA &= ~((1 << ISC00) | (1 << ISC10));
    
    // Now we can enable the INT0 and INT1 external interrupts
    // For this we need to set the EIMSK (External Interrupt Mask Register)
    // We need to set the INT0 and INT1 bits to 1, which the pins PD2 and PD3 are connected to
    EIMSK |= (1 << INT0) | (1 << INT1);
    
    // Now we can enable global interrupts to allow the interrupt to be triggered
    sei();

    // Now we can enter an infinite loop
    // The main loop will continuously display the current binary value
    // The binary value will be updated in the ISR when a button is pressed
    while (1) 
    {
        // Continuously display the current binary value
        PORTB = binary_value & 0b00111111;
    }

    return 0;
}

// Now, we have devised a function to handle the button presses
// This function will be called in the ISR for both buttons
// It will take a bit_value as an argument, which indicates which button was pressed

void handle_button(uint8_t bit_value)
{
    // To avoid bouncing, we disable the interrupts temporarily
    // This will prevent the ISR from being called again while we are processing the current button press
    EIMSK &= ~((1 << INT0) | (1 << INT1));
    
    // Debounce delay
    _delay_ms(100);
    
    // Here we check whether either button A or button B was pressed
    if ((bit_value == 0 && !(PIND & (1 << PD2))) || 
        (bit_value == 1 && !(PIND & (1 << PD3)))) {
        
        // If the button pressed is A (0), we set the current bit to 0
        // If the button pressed is B (1), we set the current bit to 1
        if (bit_value) {
            binary_value |= (1 << current_bit);
        } else {
            binary_value &= ~(1 << current_bit);
        }
        
        // Now we can increment the current bit
        // If current_bit reaches 6, we need to reset it
        current_bit = (current_bit + 1) % 6;
    
    }
    
    // Now we can re-enable the interrupts
    // This will allow the ISR to be called again when the button is pressed
    EIMSK |= (1 << INT0) | (1 << INT1);
}

// Now we can define the ISR (Interrupt Service Routine) for INT0
// This ISR will be called when the button A is pressed
ISR(INT0_vect)
{
    handle_button(0);
}

// Now we can define the ISR (Interrupt Service Routine) for INT1
// This ISR will be called when the button B is pressed
ISR(INT1_vect)  
{
    handle_button(1);
}