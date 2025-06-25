// CO321 Embedded Systems
// Lab 05: Analog to Digital Converter (ADC)
// Exercise 2: Light Dependent LED
// Group 09

// Question:
/*
Using an LDR, LED and an ATmega328P microcontroller, 
design the model of a light bulb
that automatically lights when it is dark 
or else turn off. 
Use external AREF as the voltage reference.
*/

#include <avr/io.h>
#include <util/delay.h>


void setupADC()
{
    /*
    
    Configuring ADCMUX
        -Let us use A5 Pin (i.e. 00101) as input
        (Use Bits 0-4)
        -Set the reference voltage to external AREF
        (Use Bits 6-7: REFS0, REFS1)
        - Left Adjust is not necessarily needed in this case.
        - But for convenience, we can use it.
        (Use Bit 5: ADLAR)

    */

    // Set AREF as the reference voltage
    // Wont be necessary as they are already set to 0
    ADMUX &= ~ (1<<REFS0);
    ADMUX &= ~ (1<<REFS1);

    // To use A5 as a single-ended input
    ADMUX |= (0b00101); // Set MUX bits for A5

    // Enable left adjustment of ADC result
    ADMUX |= (1 << ADLAR);  // Left adjust ADC result

    /*
    Configuring ADC Control and Status Register (ADCSRA):
        - Enable the ADC (ADEN)
        - Set the prescaler to 64 for a 250KHz ADC clock
        - No need for interrupts or auto triggering
    */

    // Enable ADC
    ADCSRA |= (1 << ADEN); // Enable ADC

    // Selecting Prescaler of 64
    ADCSRA |= (1 << ADPS2) | (1 << ADPS1); // Set prescaler to 64

}

uint16_t ADCValue()
{
    // Start a new conversion
    ADCSRA |= (1 << ADSC);

    // Wait for conversion to finish
    while (ADCSRA & (1 << ADSC));

    // Read left-adjusted result from ADCH
    return ADCH; 
}

// Main function to control the LED based on light conditions
int main(void)
{
    // Enable the A5 Pin as input
    DDRC &= ~(1 << PC5); // Set PC5 (A5) as input

    // Enable the LED pin as output
    DDRB |= (1 << PB0); // Set PB0 as output (Digital Pin 8)

    // Setup ADC
    setupADC();

    // Now we can make a loop to control the LED based on ADC value
    while (1)
    {
        // Read the ADC value
        uint16_t adcValue = ADCValue();

        // Check if the ADC value is below a certain threshold
        // If it is dark, turn on the LED
        if (adcValue < 70) // Adjust threshold as needed
        {
            PORTB |= (1 << PB0); // Turn on LED
        }
        else
        {
            PORTB &= ~(1 << PB0); // Turn off LED
        }

        _delay_ms(100); // Delay for stability
    }

}