// CO321 Embedded Systems
// Lab 05: Analog to Digital Converter (ADC)
// Exercise 1: Digital Voltmeter
// Group 09

// Question:
/*
Build a digital voltmeter 

(one that always measures a voltage 
with respect to ground 
rather than a differential voltage) 

that measures voltages of the range 0V-5V with a 10-bit
resolution.

Use ADC1 pin of the microcontroller for the input and 
LEDs connected to Port D as the output. 

Use AVCC as the voltage reference. 

Demonstrate that it works by connecting to 
ground, 5V and 3.3V pins on the Arduino board.

Hint: Use left justification of the ADC result 
for your own convenience.

*/

#include <avr/io.h>
#include <util/delay.h>

void setupADC() {
   
    /*
    Configuring the ADC Multiplexer Selection Register (ADCMUX):
        - Bits 0-4 (MUX0-MUX4) select the ADC channel.
        - Bit 5 (ADLAR): Whether to left adjust the ADC result.
        - Bits 6-7 (REFS0, REFS1): Select the reference

    For this task,
        We will take AVCC (5V) as the reference voltage
        Which means our values vary between 0V and 5V.
            i.e. REFS1 = 0, REFS0 = 1

        We do not need any differential input, 
        only a single-ended input.
        Since we use the ADC1 pin (PC1),
            MUX[4:0] = 00001
            i.e. MUX0 = 1
        
        Since we are using 8 LED pins,
        We can easily use ADCH register alone
        i.e. left adjust the ADC result
            ADLAR = 1
    */

    // Set AVCC as reference voltage
    ADMUX |= (1 << REFS0);  // AVCC with external capacitor at AREF pin

    // Left adjust ADC result for easier reading
    ADMUX |= (1 << ADLAR);  // Left adjust ADC result

    /*
    Configuring the ADC Control and Status Register (ADCSRA):

    Contains the following bits:
        - Bits 0-2 (ADPS0-ADPS2): ADC Prescaler Selection
        - Bit 3 (ADIE): ADC Interrupt Enable
        - Bit 4 (ADIF): ADC Interrupt Flag
        - Bit 5 (ADATE): ADC Auto Trigger Enable
        - Bit 6 (ADSC): ADC Start Conversion
        - Bit 7 (ADEN): ADC Enable

    In this task,
        We have to enable the ADC
            i.e. ADEN = 1
        
        Recommended ADC Clock frequency is 50KHz to 200KHz
        For a 16MHz system clock, we can use a prescaler of 64
        Such that ADC clock frequency = F_CPU / 64 
        = 16MHz / 64 = 250KHz
        Hence, we can use a prescaler of 64
            i.e. ADPS2 = 1, ADPS1 = 1, ADPS0 = 0

        No need of Interrupts or Auto Triggering
    */

    // Enable ADC and set prescaler to 64 for 125KHz ADC clock (F_CPU = 16MHz)
    ADCSRA = (1 << ADEN) | (1 << ADPS2) | (1 << ADPS1);
}

uint16_t readADC() {

    /*
    Here, we have created two separate functions:
        1. setupADC() - to configure the ADC settings
        2. readADC() - to read the ADC value from ADC1 pin
    But two functions are not necessary, can be done in one function.
    (For clarity, we have separated them)

    Tasks of this function:
        - Set the ADC channel to ADC1 (PC1)
        - Start the conversion
        - Wait for the conversion to finish
        - Read the result from ADCH (left adjusted)

    In Manual mode, setting ADSC flag starts the conversion.
    In completion, the ADSC flag is cleared automatically.

    The conversion fills the ADCH register with the upper 8 bits of the 10-bit result.
    The lower 2 bits are in ADCL, but we are not using them here.
    The ADCH register is left adjusted, so we can directly use it for our 8 LEDs.
    */

    // Set only the channel bits, 
    // keep reference and left adjust intact
    ADMUX = (ADMUX & 0xF0) | (1 << MUX0); // Select ADC1

    // Start conversion
    ADCSRA |= (1 << ADSC);

    // Wait for conversion to finish
    while (ADCSRA & (1 << ADSC));

    // return result;
    return ADCH;
}

int main(void) {

     // Set ADC1 (PC1) as voltage input
    DDRC &= ~(1 << PC1);  // Clear PC1 bit to set it as input

    // Set the port D as output
    DDRD = 0xFF; // Set all pins of Port D as output

    setupADC();

    while (1) {
        uint16_t adcValue = readADC();
        PORTD = adcValue; // Display the ADC value on Port D
        _delay_ms(100);
    }
}

