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
TIMER CALCULATIONS:

XTAL = 16 MHz
i.e. 1 clock cycle = 1 / 16 microseconds
Let us use 1:256 Prescaler

Period of counter clock = 1 / (16 MHz / 256) = 16 microseconds
To toggle every 100 ms, we need to count 6250 cycles (100 ms / 16 microseconds = 6250).

Since 6250 > 256, we need to use timer overflow.
Each overflow: 256 counts * 16 us = 4096 us = 4.096 ms
Number of overflows needed: 100 ms / 4.096 ms ≈ 24.41 → 24 full overflows + partial

Full overflows: 24 * 4096 us = 98304 us
Remaining time: 100000 us - 98304 us = 1696 us
Counts for last overflow: 1696 us / 16 us = 106
Initial counter value for last overflow: 256 - 106 = 150

So:
    * Run timer for 24 overflows (start from 0)
    * On 25th overflow, start from 150 to get remaining time
    * Total delay ≈ 100 ms
*/

// 100ms delay using Timer1 in CTC mode, prescaler 64
void delay_timer()
{
    // Set Timer1 to CTC mode (Clear Timer on Compare Match)
    TCCR1A = 0x00;
    TCCR1B = (1 << WGM12); // CTC mode

    // Calculate compare value for 100ms:
    // OCR1A = (F_CPU / (Prescaler * Target Frequency)) - 1
    // For 100ms: Target Frequency = 10Hz (period = 0.1s)
    // OCR1A = (16,000,000 / (64 * 10)) - 1 = 24,999
    OCR1A = 24999;

    // Set prescaler to 64 and start the timer
    TCCR1B |= (1 << CS11) | (1 << CS10); // Prescaler 64

    // Clear the compare match flag
    TIFR1 |= (1 << OCF1A);

    // Wait for compare match
    while ((TIFR1 & (1 << OCF1A)) == 0);

    // Stop the timer
    TCCR1B = 0x00;
    // Clear the compare match flag
    TIFR1 |= (1 << OCF1A);
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
    // Loop through the number of units
    // Provided as input to the function
    for (uint8_t i = 0; i < units; i++) 
    {
        delay_timer();
    }
}

/*
    SIGNAL_MORSE FUNCTION:

    We input a Morse code string (e.g., ".-") and signal it using the LED and buzzer.
    We loop through each character in the Morse code string.
    For each character, we turn on the LED and buzzer for the duration specified by the Morse code (dot or dash).
    After signaling the character, we turn off the LED and buzzer.

*/
void signal_morse(const char* morse_string) 
{   
    // i for iterating through the Morse code string
    // We assume the string is null-terminated
    int i = 0;

    // Loop through each character in the Morse code string
    // Until we find the null terminator
    while (morse_string[i] != '\0') 
    {
        // Turn ON the Signaling LED
        LED_PORT |= (1 << LED_PIN);

        /*
            Now we need to determine the ON duration based on the character:
            - For a dot (.), the duration is DOT_DURATION
            - For a dash (-), the duration is DASH_DURATION
            as so on.

            on_duration_ms is the duration for which the LED and buzzer will be ON
        */
        uint16_t on_duration_ms = (morse_string[i] == '.') ? DOT_DURATION : DASH_DURATION;

        /*
            Now, we need to turn ON the buzzer for the same duration
            We have introduced elapsed variable to keep track of the elapsed time
        */

        uint16_t elapsed = 0;

        // Run the buzzer until elapsed time hasnt reached on_duration_ms
        while (elapsed < on_duration_ms) 
        {
            // Toggle buzzer pin for 500 Hz 
            // (1 ms period: 0.5 ms high, 0.5 ms low)
            BUZZER_PORT |= (1 << BUZZER_PIN);
            
            // Delay 0.5 ms
            for (volatile uint16_t d = 0; d < (F_CPU / 1000 / 8 / 2); d++) { asm volatile ("nop"); }
            BUZZER_PORT &= ~(1 << BUZZER_PIN); // Low
            // Delay 0.5 ms
            for (volatile uint16_t d = 0; d < (F_CPU / 1000 / 8 / 2); d++) { asm volatile ("nop"); }
            elapsed++;
        }

        // Turn OFF LED and buzzer
        LED_PORT &= ~(1 << LED_PIN);
        BUZZER_PORT &= ~(1 << BUZZER_PIN);

        // Inter-symbol gap (only if not last symbol)
        if (morse_string[i+1] != '\0') {
            delay_100ms_units(SYMBOL_GAP_DURATION / 100);
        }
        i++;
    }
}

// Function to handle the gap between letters
void letter_gap() {
    delay_100ms_units(LETTER_GAP_DURATION / 100);
}

// Function to handle the gap between words
void word_gap() {
    delay_100ms_units(WORD_GAP_DURATION / 100);
}


// Helper: Get Morse code string for a character (A-Z, 0-9)
const char* get_morse_code(char c) {
    if (c >= 'A' && c <= 'Z') {
        return morseCodeMap[c - 'A'];
    } else if (c >= 'a' && c <= 'z') {
        return morseCodeMap[c - 'a'];
    } else if (c >= '0' && c <= '9') {
        return morseCodeMap[26 + (c - '0')];
    } else {
        return NULL;
    }
}


int main(void) {
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
    lcd_puts("Morse Decoder");
    uint8_t lcd_col = 0;

    // Buffer for input
    #define BUFFER_SIZE 128
    char buffer[BUFFER_SIZE];
    uint8_t buf_idx = 0;

    while (1) {
        char c = usart_receive();
        usart_send(c); // Echo

        // If Enter is pressed, process buffer
        if (c == '\n' || c == '\r') {
            buffer[buf_idx] = '\0';
            uint8_t i = 0;
            lcd_col = 0;
            lcd_clrscr();
            while (buffer[i] != '\0') {
                if (buffer[i] == ' ') {
                    // Word finished
                    LED_PORT |= (1 << LED_WORD_PIN);
                    word_gap();
                    LED_PORT &= ~(1 << LED_WORD_PIN);
                    // Add space to LCD
                    lcd_putc(' ');
                    lcd_col++;
                } else {
                    const char* morse = get_morse_code(buffer[i]);
                    if (morse != NULL) {
                        signal_morse(morse);
                        // Light up LED_LETTER_PIN briefly after signaling a letter
                        LED_PORT |= (1 << LED_LETTER_PIN);
                        delay_100ms_units(2); // 200ms
                        LED_PORT &= ~(1 << LED_LETTER_PIN);
                        letter_gap();
                        // Show Morse code and character on LCD, clear for each character
                        lcd_clrscr();
                        const char* morse_str = morse;
                        for (uint8_t m = 0; morse_str[m] != '\0'; m++) {
                            lcd_putc(morse_str[m]);
                        }
                        lcd_putc(' ');
                        lcd_putc(buffer[i]);
                    }
                }
                i++;
            }
            // End of sentence
            lcd_clrscr();
            lcd_puts("end of sentence");
            LED_PORT |= (1 << LED_SENT_PIN);
            delay_100ms_units(10); // Light up for 1s
            LED_PORT &= ~(1 << LED_SENT_PIN);
            buf_idx = 0; // Reset buffer
        } else {
            // Buffer printable chars (ignore others)
            if (buf_idx < BUFFER_SIZE - 1 && (c >= 32 && c <= 126)) {
                buffer[buf_idx++] = c;
            }
        }
    }

    return 0;
}

