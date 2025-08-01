// CO321 Embedded Systems
// Project: Morse Communicator
// Part 1: Morse Code Encoder
// Group 09

// Question:
/*
    PART 1: Morse Code Decoder
    - Use a push button to give input
    - in terms of dots(.) and dashes(-)
    - Use appropriate time intervals for
        dot, dash, inter-symbol gap, inter-word gap
    - With each press echo LED and Buzzer
    - End of message should be recognized as AR (.-.-.) sequence
    - Decode the message and display it on the LCD
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
    UBRR0H = (uint8_t)((UBRR) >> 8); // Load upper 4 bits of UBRR
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


void usart_send_string(char* str)
{
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

const char* morseCodeMap[] = {
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


/*
CALCULATIONS:

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
void delay_timer(void)
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
Defining hardware pins and time intervals for Morse code symbols

*/

#define LED_DDR  DDRB
#define LED_PORT PORTB
#define LED_PIN  PB5 // Arduino Pin 13 (On-board LED)

#define BUZZER_DDR  DDRB
#define BUZZER_PORT PORTB
#define BUZZER_PIN  PB1 // Changed to Arduino Pin 9 (PB1)

// Morse code timing (in milliseconds)
#define DOT_DURATION 200
#define DASH_DURATION (3 * DOT_DURATION)
#define SYMBOL_GAP_DURATION DOT_DURATION
#define LETTER_GAP_DURATION (3 * DOT_DURATION)
#define WORD_GAP_DURATION (7 * DOT_DURATION)


// --- Decoder-specific definitions ---
#define BUTTON_DDR  DDRD
#define BUTTON_PORT PORTD
#define BUTTON_PIN  PD7
#define BUTTON_PINREG  PIND

#define MAX_MORSE_LEN 8
#define MAX_MSG_LEN 32

// Morse code lookup table for decoding
typedef struct {
    const char* code;
    char letter;
} MorseEntry;

const MorseEntry morseDecodeTable[] = {
    { ".-", 'A' }, { "-...", 'B' }, { "-.-.", 'C' }, { "-..", 'D' }, { ".", 'E' },
    { "..-.", 'F' }, { "--.", 'G' }, { "....", 'H' }, { "..", 'I' }, { ".---", 'J' },
    { "-.-", 'K' }, { ".-..", 'L' }, { "--", 'M' }, { "-.", 'N' }, { "---", 'O' },
    { ".--.", 'P' }, { "--.-", 'Q' }, { ".-.", 'R' }, { "...", 'S' }, { "-", 'T' },
    { "..-", 'U' }, { "...-", 'V' }, { ".--", 'W' }, { "-..-", 'X' }, { "-.--", 'Y' },
    { "--..", 'Z' },
    { "-----", '0' }, { ".----", '1' }, { "..---", '2' }, { "...--", '3' }, { "....-", '4' },
    { ".....", '5' }, { "-....", '6' }, { "--...", '7' }, { "---..", '8' }, { "----.", '9' },
    { NULL, 0 }
};

// Helper: decode Morse string to char
char decode_morse(const char* code) {
    for (int i = 0; morseDecodeTable[i].code != NULL; i++) {
        if (strcmp(morseDecodeTable[i].code, code) == 0) return morseDecodeTable[i].letter;
    }
    return '?';
}

// Helper: check for AR (.-.-.)
uint8_t is_AR(const char* code) {
    return strcmp(code, ".-.-.") == 0;
}

// Simple delay in ms (blocking, for echo)
void delay_ms(uint16_t ms) {
    while (ms--) {
        for (volatile uint16_t d = 0; d < (F_CPU / 1000 / 8); d++) { asm volatile ("nop"); }
    }
}

int main(void) {
    // Set LED and buzzer pins as output
    LED_DDR |= (1 << LED_PIN);
    BUZZER_DDR |= (1 << BUZZER_PIN);
    // Set button as input with pull-up
    BUTTON_DDR &= ~(1 << BUTTON_PIN);
    BUTTON_PORT |= (1 << BUTTON_PIN);

    // Initialize LCD
    lcd_init(LCD_DISP_ON);
    lcd_clrscr();
    lcd_gotoxy(0,0);
    lcd_puts("Morse Decoder");

    char morse_buf[MAX_MORSE_LEN+1] = {0};
    char msg_buf[MAX_MSG_LEN+1] = {0};
    uint8_t morse_idx = 0, msg_idx = 0;
    uint8_t last_btn = 1, btn;
    uint32_t press_time = 0, gap_time = 0;

    // Timing thresholds (ms)
    const uint16_t DOT_THRESH = 200;      // <200ms = dot
    const uint16_t LETTER_GAP = 600;      // >=600ms = letter gap
    const uint16_t WORD_GAP = 1400;       // >=1400ms = word gap

    // Main loop
    while (1) {
        btn = (BUTTON_PINREG & (1 << BUTTON_PIN)) ? 1 : 0;
        if (!btn && last_btn) { // Button pressed
            // Echo LED/buzzer
            LED_PORT |= (1 << LED_PIN);
            BUZZER_PORT |= (1 << BUZZER_PIN);
            // Wait for release and measure duration
            uint16_t t = 0;
            while (!(BUTTON_PINREG & (1 << BUTTON_PIN))) {
                delay_ms(1);
                t++;
            }
            press_time = t;
            // End echo
            LED_PORT &= ~(1 << LED_PIN);
            BUZZER_PORT &= ~(1 << BUZZER_PIN);

            // Dot or dash
            if (press_time < DOT_THRESH) {
                morse_buf[morse_idx++] = '.';
            } else {
                morse_buf[morse_idx++] = '-';
            }
            morse_buf[morse_idx] = '\0';
            gap_time = 0;
        } else if (btn && !last_btn) { // Button released
            // Start gap timing
            gap_time = 0;
            while ((BUTTON_PINREG & (1 << BUTTON_PIN)) && gap_time < WORD_GAP) {
                delay_ms(1);
                gap_time++;
                if (!(BUTTON_PINREG & (1 << BUTTON_PIN))) break;
            }
            // If gap is long enough, treat as letter/word
            if (gap_time >= WORD_GAP) {
                if (morse_idx > 0) {
                    char decoded = decode_morse(morse_buf);
                    msg_buf[msg_idx++] = decoded;
                    morse_idx = 0;
                    morse_buf[0] = '\0';
                }
                msg_buf[msg_idx++] = ' ';
                msg_buf[msg_idx] = '\0';
            } else if (gap_time >= LETTER_GAP) {
                if (morse_idx > 0) {
                    char decoded = decode_morse(morse_buf);
                    msg_buf[msg_idx++] = decoded;
                    morse_idx = 0;
                    morse_buf[0] = '\0';
                }
                msg_buf[msg_idx] = '\0';
            }
            // Check for AR (.-.-.)
            if (is_AR(morse_buf)) {
                lcd_clrscr();
                lcd_gotoxy(0,0);
                lcd_puts("Decoded:");
                lcd_gotoxy(1,0);
                lcd_puts(msg_buf);
                morse_idx = 0; msg_idx = 0;
                morse_buf[0] = '\0'; msg_buf[0] = '\0';
                delay_ms(2000);
                lcd_clrscr();
                lcd_gotoxy(0,0);
                lcd_puts("Morse Decoder");
            }
        }
        last_btn = btn;
    }
    return 0;
}

