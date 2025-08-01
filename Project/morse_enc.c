// CO321 Embedded Systems
// Project: Morse Communicator
// Part 1: Morse Code Encoder
// Group 09

// Question:
/*
    PART 1: Morse Code Encoder
    - Listen to the serial communication to the Arduino on USB Serial (9600 baud).
    - Once receiving printable characters, convert them to Morse code.
    - For every 
        dot (.)
        dash (-)
        inter-symbol gap
        inter-word gap
        choose appropriate time intervals
    - Light an LED and activate a piezo buzzer for each symbol
    - Choose an appropriate frequency for the buzzer
*/

// Importing Necessary Libraries
#include <avr/io.h>
#include <avr/interrupt.h>
#include "lcd.h"
#include <string.h>
#include <util/delay.h>

// For Serial Communication

// Define the Baud Rate
#define BAUD_RATE 9600

// F_OSC for Calculation of UBRR Value
#define F_OSC 16000000UL

// Equation to calculate UBRR value

/*
We know that Desired Baud Rate (BAUD_RATE) = F_OSC / (16 * (X + 1))
We need to subject X, which is the value to be loaded to UBRR register.
X + 1 = F_OSC / (16 * BAUD_RATE)
X = (F_OSC / (16 * BAUD_RATE)) - 1
*/

#define UBRR (F_OSC/16/BAUD_RATE)-1


/*
*******************************************************************************
*******************************************************************************
    For Serial Communication
    Previously created functions are needed

*******************************************************************************
*******************************************************************************
*/

void usart_init(void)
{

    /*
    Enabling the Transmitter
    */
    UCSR0B |= (1 << TXEN0); // Enable transmitter

    /*
    Enabling the Receiver
    */
    UCSR0B |= (1 << RXEN0); // Enable receiver

    /*
    Setting the Baud Rate
    */
    UBRR0L = (uint8_t)(UBRR); // Load lower 8 bits of UBRR
    UBRR0H = (uint8_t)(UBRR >> 8); // Load upper 4 bits of UBRR
    // It is alright to do this as last 4 bits of UBRR0H are reserved

    /*
    Setting to Asynchronous Mode
    */
    UCSR0C &= ~(1<<UMSEL01);
    UCSR0C &= ~(1<<UMSEL00);

    /*
    Setting 8-bit data mode
    */
    UCSR0B &= ~(1 << UCSZ02); // Clear UCSZ02
    UCSR0C |= (1 << UCSZ01) | (1 << UCSZ00); // Set UCSZ01 and UCSZ00

    /*
    Setting the Parity Mode   
    */
    
    UCSR0C &= ~(1<<UPM00);
    UCSR0C &= ~(1<<UPM01);

    /*    Setting the Stop Bit
    */
    UCSR0C &= ~(1 << USBS0); 

}

void usart_send(char send_char)
{
    // We can wait until the transmit buffer is empty
    // i.e. it waits as long as the UDRE0 bit is not set (0)
    while (!(UCSR0A & (1 << UDRE0)));

    // Load the character into the transmit buffer
    UDR0 = send_char;   
}

char usart_receive(void)
{
    // Wait until a character is received
    while (!(UCSR0A & (1 << RXC0)));

    // Return the received character from the data register
    return UDR0;
}

// This is a simple function to send a string over USART

void usart_send_string(char* str)
{
    // Loop through each character in the string until we reach the null terminator
    while (*str != '\0')
    {
        usart_send(*str);
        str++;
    }
}

/*
*******************************************************************************
*******************************************************************************
*/

/*
    We have created a Morse code map to convert characters to Morse code.
    Each character is represented by a string of dots and dashes.
    The map is indexed by the position of the character in the alphabet
        Eg: A is at index 0, B is at index 1, .... Z is at index 25 etc.
    
    NOTE:
    We have used char* because we need to access them using addresses (pointers).
*/
const char* morseCodeMap[] = 
{
    ".-",    // A
    "-...",  // B
    "-.-.",  // C
    "-..",   // D
    ".",     // E
    "..-.",  // F
    "--.",   // G
    "....",  // H
    "..",    // I
    ".---",  // J
    "-.-",   // K
    ".-..",  // L
    "--",    // M
    "-.",    // N
    "---",   // O
    ".--.",  // P
    "--.-",  // Q
    ".-.",   // R
    "...",   // S
    "-",     // T
    "..-",   // U
    "...-",  // V
    ".--",   // W
    "-..-",  // X
    "-.--",  // Y
    "--..",  // Z
    "-----", // 0
    ".----", // 1
    "..---", // 2
    "...--", // 3
    "....-", // 4
    ".....", // 5
    "-....", // 6
    "--...", // 7
    "---..", // 8
    "----."  // 9
};

// Now we have added a Timer function
// To be used for delays in the Morse code signaling

/*
TIMER CALCULATIONS FOR TIMER0 CTC MODE:

XTAL = 16 MHz
Prescaler = 64
Timer0 is 8-bit, so max OCR0A = 255

Timer clock: 16 MHz / 64 = 250 kHz (1 count = 4 us)
To achieve 100 ms delay:
    - 100 ms / 4 us = 25,000 counts needed
    - Set OCR0A = 249 for 1 ms per compare match (250 counts * 4 us = 1 ms)
    - Loop 100 times for 100 ms total delay

This method uses CTC mode and is precise for short delays with 8-bit timers.
*/

// 100ms delay using Timer0 in CTC mode, prescaler 64
void delay_timer0()
{
    // Set Timer0 to CTC mode (Clear Timer on Compare Match)
    TCCR0A = (1 << WGM01); // CTC mode
    TCCR0B = 0x00; // Stop timer for setup

    // Calculate compare value for 100ms:
    // OCR0A = (F_CPU / (Prescaler * Target Frequency)) - 1
    // For 100ms: Target Frequency = 10Hz (period = 0.1s)
    // OCR0A = (16,000,000 / (64 * 10)) - 1 = 24,999
    // But Timer0 is 8-bit, max OCR0A = 255, so we need to loop
    // Each count: 64 prescaler, 16MHz/64 = 250kHz, 1 count = 4us
    // 100ms / 4us = 25,000 counts. So loop 100 times with OCR0A=249 (1ms per loop)
    OCR0A = 249; // 1ms per compare match

    // Set prescaler to 64 and start the timer
    TCCR0B = (1 << CS01) | (1 << CS00); // Prescaler 64

    // Wait for 100ms by looping 100 times
    for (uint16_t i = 0; i < 100; i++) 
    { 
        // 100ms total
        // Clear compare match flag
        TIFR0 |= (1 << OCF0A);

        // Wait for compare match
        while ((TIFR0 & (1 << OCF0A)) == 0);
    }

    // Stop the timer
    TCCR0B = 0x00;
    TCCR0A = 0x00;
}

/*
    Why CTC?
    CTC (Clear Timer on Compare Match) mode is used 
    because it allows the timer to reset automatically 
    when it reaches a specified value (OCR1A).  

*/

/*
Defining hardware pins and time intervals for Morse code symbols

*/

// LED for showing the morse code
#define LED_DDR  DDRB
#define LED_PORT PORTB
#define LED_PIN  PB5 // Arduino Pin 13 (On-board LED)

// Buzzer for signaling Morse code
#define BUZZER_DDR  DDRB
#define BUZZER_PORT PORTB
#define BUZZER_PIN  PB1 // Arduino Pin 9 (PB1)

// LED to show end of letter/number
#define LED_LETTER_PIN PB2 // Arduino Pin 10

// LED to show end of word
#define LED_WORD_PIN   PB3 // Arduino Pin 11

// LED to show end of sentence
#define LED_SENT_PIN   PB4 // Arduino Pin 12

// Morse code timing (in milliseconds)
// Reason for using define:
// Just by changing DOT_DURATION, we can change the timing of the entire Morse code
#define DOT_DURATION 200
#define DASH_DURATION (3 * DOT_DURATION)
#define SYMBOL_GAP_DURATION DOT_DURATION
#define LETTER_GAP_DURATION (3 * DOT_DURATION)
#define WORD_GAP_DURATION (7 * DOT_DURATION)

// This function is used to delay for a specified number of 100ms units
// Since our delay timer is set to 100ms
// we can use this function to create delays of orders of 100ms 

void delay_100ms_units(uint8_t units) 
{   
    for (uint8_t i = 0; i < units; i++) 
    {
        delay_timer0();
    }
}

/*
    A PWM FUNCTION TO START THE BUZZER

    CALCULATIONS:

    We need to set the PWM frequency to 1 kHz for the buzzer 
    using Timer1 in CTC toggle mode (COM1A0 set).
    The formula for the output frequency is:
    f_OC1A = F_CPU / (2 * N * (1 + OCR1A))
    Where:
        F_CPU = 16 MHz
        N = Prescaler (we will use 64)
        OCR1A = Compare value for Timer1
    To achieve 1 kHz:
    1 kHz = 16 MHz / (2 * 64 * (1 + OCR1A))
    Rearranging gives:
    OCR1A = (F_CPU / (2 * N * f_OC1A)) - 1
    For f_OC1A = 1000 Hz and N = 64:
    OCR1A = (16,000,000 / (2 * 64 * 1000)) - 1 = 124
    So we set OCR1A = 124 for a 1 kHz PWM frequency.
*/

void start_buzzer_pwm() 
{
    // Set PB1 as output
    DDRB |= (1 << PB1);

    // Toggle OC1A on compare match
    TCCR1A = (1 << COM1A0);

    // CTC mode, prescaler 64
    TCCR1B = (1 << WGM12) | (1 << CS11) | (1 << CS10);

    // Set OCR1A for 1 kHz: OCR1A = (F_CPU / (2 * 64 * 1000)) - 1 = 124
    OCR1A = 124;
}

/*
    FUNCTION TO STOP THE BUZZER PWM
*/

void stop_buzzer_pwm() 
{   
    // Clear TCCR1A and TCCR1B to stop PWM
    TCCR1A = 0x00;
    TCCR1B = 0x00;

    // Ensure buzzer pin is low
    BUZZER_PORT &= ~(1 << BUZZER_PIN);
}

/*
    SIGNAL_MORSE FUNCTION:

    This function takes a Morse code string and signals it using the LED and buzzer.
    It turns on the LED and starts the PWM for the buzzer for the duration of each dot or dash.
    After signaling, it turns off the LED and stops the PWM.

    NOTE:
    Input for this function is a string of Morse code symbols (e.g., ".-.. . .-.. ---").
    char* is used so that we can access the string using pointers.

*/

void signal_morse(const char* morse_string) 
{
    // i variable to iterate through the Morse code string
    int i = 0;

    // Loop through each character in the Morse code string
    // Until we reach the null terminator

    while (morse_string[i] != '\0') 
    {
        // Turn ON the Signaling LED
        LED_PORT |= (1 << LED_PIN);

        // Determine ON duration
        // This code snippet checks whether
        // the current character is a dot or a dash
        // If it is a dot, we set the duration to DOT_DURATION
        // If it is a dash, we set the duration to DASH_DURATION
        uint16_t on_duration_ms = (morse_string[i] == '.') ? DOT_DURATION : DASH_DURATION;

        // Start PWM for buzzer
        start_buzzer_pwm();

        // Wait for symbol duration using hardware timer (delay_timer0)
        // units variable is used to determine how many 100ms units we need to wait
        uint8_t units = on_duration_ms / 100;

        // Loop for the number of 100ms units
        // This will create the required delay for the dot or dash
        for (uint8_t t = 0; t < units; t++) 
        {
            delay_timer0();
        }

        // Stop the Buzzer PWM
        stop_buzzer_pwm();

        // Turn OFF LED
        LED_PORT &= ~(1 << LED_PIN);

        // Inter-symbol gap
        // This is to ensure that there is a gap between symbols
        // We only add a gap if the next character is not the null terminator
        // This prevents adding a gap after the last character
        // If the next character is not null, we add a gap
        if (morse_string[i+1] != '\0') 
        {
            delay_100ms_units(SYMBOL_GAP_DURATION / 100);
        }

        // Increment the index
        i++;
    }
}

/*
    Function to handle the gap between letters
    This function is called after signaling a letter
    It creates a delay for the specified LETTER_GAP_DURATION
*/
void letter_gap() 
{
    delay_100ms_units(LETTER_GAP_DURATION / 100);
}

/*
    Function to handle the gap between words
    This function is called after signaling a word
    It creates a delay for the specified WORD_GAP_DURATION
*/

void word_gap() 
{
    delay_100ms_units(WORD_GAP_DURATION / 100);
}


/*
    GET_MORSE_CODE FUNCTION:
        Takes a readable character (A-Z, 0-9) 
        Returns the corresponding Morse code string for the character
*/
const char* get_morse_code(char c) 
{
    // For uppercase letters (A-Z)
    if (c >= 'A' && c <= 'Z') 
    {
        return morseCodeMap[c - 'A'];
    } 

    // For lowercase letters (a-z)
    else if (c >= 'a' && c <= 'z') 
    {
        return morseCodeMap[c - 'a'];
    } 

    // For digits (0-9)
    else if (c >= '0' && c <= '9') 
    {
        return morseCodeMap[26 + (c - '0')];
    } 

    // If the character is not in the range of A-Z, a-z, or 0-9
    else 
    {
        return NULL;
    }
}


int main(void) 
{
    // Set LED and buzzer pins as output
    LED_DDR |= (1 << LED_PIN) | (1 << LED_LETTER_PIN) | (1 << LED_WORD_PIN) | (1 << LED_SENT_PIN);
    BUZZER_DDR |= (1 << BUZZER_PIN);

    // Ensure all LEDs and buzzer are off
    LED_PORT &= ~(1 << LED_PIN);
    LED_PORT &= ~(1 << LED_LETTER_PIN);
    LED_PORT &= ~(1 << LED_WORD_PIN);
    LED_PORT &= ~(1 << LED_SENT_PIN);
    BUZZER_PORT &= ~(1 << BUZZER_PIN);

    // Initialize USART
    usart_init();

    // Initialize LCD
    lcd_init(LCD_DISP_ON);
    lcd_clrscr();
    lcd_puts("Morse Encoder");
    uint8_t lcd_col = 0;

    // Buffer for input
    #define BUFFER_SIZE 128
    char buffer[BUFFER_SIZE];

    // buf_idx for tracking buffer index
    uint8_t buf_idx = 0;

    /*
        MAIN LOOP:

        - Listen to the serial communication to the Arduino on USB Serial (9600 baud).
        - While receiving characters, echo them back.
        - If Enter is pressed, process the buffer:
            - Clear the LCD screen.
            - For each character in the buffer:
                - If it is a space, signal a word gap.
                - Otherwise, get the Morse code for the character and signal it.
                - Light up LED_LETTER_PIN briefly after signaling a letter.
            - After processing the buffer, signal the end of the sentence with LED_SENT_PIN.
        - Reset the buffer index after processing.
        - Continue listening for new characters.

    */

    while (1) 
    {
        // Receive a character from USART
        char c = usart_receive();

        // Echo the received character back
        usart_send(c);

        // If Enter is pressed, process buffer
        if (c == '\n' || c == '\r') 
        {   
            // Add the null terminator to the buffer
            buffer[buf_idx] = '\0';

            // i for iterating through the buffer
            uint8_t i = 0;

            // lcd_col for tracking the current column on the LCD
            lcd_col = 0;

            // Clear the LCD screen
            lcd_clrscr();

            // Iterate through the buffer until we reach the null terminator
            while (buffer[i] != '\0') 
            {
                // If we reach a space character
                // We signal a word gap
                if (buffer[i] == ' ') 
                {
                    // Word finished
                    LED_PORT |= (1 << LED_WORD_PIN);

                    // Signal a word gap (function created above)
                    word_gap();

                    // Turn off the word LED
                    LED_PORT &= ~(1 << LED_WORD_PIN);

                    // Add space to LCD
                    lcd_putc(' ');

                    // Increment the LCD column
                    lcd_col++;
                } 

                else 
                {   
                    // If the character is not a space
                    // We get the Morse code for the character
                    // buffer[i] is the character (Eg: 'A', 'B', '1', etc.)
                    // When we do get_morse_code(buffer[i]),
                    // we get the corresponding Morse code string (e.g., ".-", "-...", etc.)
                    const char* morse = get_morse_code(buffer[i]);

                    // If the Morse code is valid (not NULL)
                    if (morse != NULL) 
                    {
                        // Now we can use the signal_morse function
                        // Which takes a Morse code string and signals it
                        signal_morse(morse);

                        // Light up LED_LETTER_PIN briefly after signaling a letter
                        LED_PORT |= (1 << LED_LETTER_PIN);

                        // Delay to indicate the end of the letter
                        delay_100ms_units(2);

                        // Turn off the LED_LETTER_PIN
                        LED_PORT &= ~(1 << LED_LETTER_PIN);

                        // Letter gap to separate letters
                        letter_gap();

                        // Clear the Screen
                        lcd_clrscr();

                        /*
                            Here, we print the Morse code string
                            On the LCD screen
                        */
                       
                        const char* morse_str = morse;

                        // Loop to iterate through the Morse code string
                        // and print each character on the LCD
                        for (uint8_t m = 0; morse_str[m] != '\0'; m++) 
                        {   
                            // Print char on LCD
                            lcd_putc(morse_str[m]);
                        }

                        // Print a space after the Morse code
                        lcd_putc(' ');

                        // Print the original character on the LCD
                        lcd_putc(buffer[i]);
                    }
                }
                
                // Increment the buffer index
                i++;
            }

            // End of sentence
            lcd_clrscr();
            lcd_puts("end of sentence");

            // Light up the LED_SENT_PIN to indicate end of sentence
            LED_PORT |= (1 << LED_SENT_PIN);

            // Delay to indicate the end of the sentence
            delay_100ms_units(10);

            // Turn off the LED_SENT_PIN
            LED_PORT &= ~(1 << LED_SENT_PIN);

            // Reset the buffer index
            buf_idx = 0;
        } 
        
        /*
            else is for handling non-printable characters
            We ignore them
        */
        else 
        {
            // Buffer printable chars (ignore others)
            // i.e. if the character is not within the printable ASCII range
            // (32 to 126 inclusive)
            if (buf_idx < BUFFER_SIZE - 1 && (c >= 32 && c <= 126)) 
            {
                // Add the character to the buffer
                buffer[buf_idx++] = c;
            }
        }
    }

    return 0;
}

