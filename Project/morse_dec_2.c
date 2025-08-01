// Hardware pins and timing macros (must be defined before use)
#define LED_DDR  DDRB
#define LED_PORT PORTB
#define LED_PIN  PB5 // Arduino Pin 13 (On-board LED)
#define LED_DOT_PIN    PB2 // Arduino Pin 10
#define LED_DASH_PIN   PB3 // Arduino Pin 11
#define LED_WORD_PIN   PB4 // Arduino Pin 12

#define BUZZER_DDR  DDRB
#define BUZZER_PORT PORTB
#define BUZZER_PIN  PB1 // Arduino Pin 9 (PB1)

#define DOT_DURATION 200
#define DASH_DURATION (3 * DOT_DURATION)
#define SYMBOL_GAP_DURATION DOT_DURATION
#define LETTER_GAP_DURATION (3 * DOT_DURATION)
#define WORD_GAP_DURATION (7 * DOT_DURATION)

#define BUTTON_DDR  DDRD
#define BUTTON_PORT PORTD
#define BUTTON_PIN  PD7
#define BUTTON_PINREG  PIND

// Timer2 interrupt for blinking LED_WORD_PIN
#include <avr/interrupt.h>

volatile uint8_t blink_state = 0;

// Set up Timer2 for CTC interrupt every DOT_DURATION ms
void setup_timer2_blink(void) {
    // 8-bit timer, prescaler 64, CTC mode
    TCCR2A = (1 << WGM21); // CTC mode
    TCCR2B = (1 << CS22);  // Prescaler 64
    // 16MHz / 64 = 250kHz, 1 count = 4us
    // DOT_DURATION ms = DOT_DURATION * 1000us / 4us = DOT_DURATION * 250 counts
    // For 200ms: 200 * 250 = 50000 counts, but OCR2A max is 255, so use ISR to count
    OCR2A = 249; // 1ms per compare match
    TIMSK2 = (1 << OCIE2A); // Enable CTC interrupt
}

volatile uint16_t blink_counter = 0;

ISR(TIMER2_COMPA_vect) {
    blink_counter++;
    if (blink_counter == DOT_DURATION) {
        blink_counter = 0;
        blink_state = !blink_state;
        if (blink_state) {
            LED_PORT |= (1 << LED_WORD_PIN);
        } else {
            LED_PORT &= ~(1 << LED_WORD_PIN);
        }
    }
}
// CO321 Embedded Systems
// Project: Morse Communicator
// Part 2: Morse Code Decoder
// Group 09

// Question:
/*
    PART 2: Morse Code Decoder
    - Use a push button to give input in terms of dots (.) and dashes (-)
    - Use appropriate time intervals for dot, dash, inter-symbol gap, and inter-word gap
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
// Generalized delay using Timer1 in CTC mode, prescaler 64
void delay_timer(uint16_t ms) {
    // Each cycle: 16MHz / 64 = 250kHz, 1 count = 4us
    // For up to 262ms: OCR1A max = 65535, so we can handle up to ~262ms in one go
    while (ms > 0) {
        uint16_t this_delay = (ms > 250) ? 250 : ms; // max 250ms per loop
        uint32_t counts = (F_CPU / 64) * this_delay / 1000;
        if (counts > 65535) counts = 65535;
        TCCR1A = 0x00;
        TCCR1B = (1 << WGM12); // CTC mode
        OCR1A = (uint16_t)(counts - 1);
        TCCR1B |= (1 << CS11) | (1 << CS10); // Prescaler 64
        TIFR1 |= (1 << OCF1A);
        while ((TIFR1 & (1 << OCF1A)) == 0);
        TCCR1B = 0x00;
        TIFR1 |= (1 << OCF1A);
        ms -= this_delay;
    }
}

/*
Defining hardware pins and time intervals for Morse code symbols

*/

// Main Morse LED
#define LED_DDR  DDRB
#define LED_PORT PORTB
#define LED_PIN  PB5 // Arduino Pin 13 (On-board LED)

// Debug LEDs
#define LED_DOT_PIN    PB2 // Arduino Pin 10
#define LED_DASH_PIN   PB3 // Arduino Pin 11
#define LED_WORD_PIN   PB4 // Arduino Pin 12

#define BUZZER_DDR  DDRB
#define BUZZER_PORT PORTB
#define BUZZER_PIN  PB1 // Arduino Pin 9 (PB1)

// Morse code timing (in milliseconds)
#define DOT_DURATION 200
#define DASH_DURATION (3 * DOT_DURATION)
#define SYMBOL_GAP_DURATION DOT_DURATION
#define LETTER_GAP_DURATION (3 * DOT_DURATION)
#define WORD_GAP_DURATION (7 * DOT_DURATION)

// Button definitions
#define BUTTON_DDR  DDRD
#define BUTTON_PORT PORTD
#define BUTTON_PIN  PD7
#define BUTTON_PINREG  PIND


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
// Use delay_timer for all ms delays
#define delay_ms(ms) delay_timer(ms)

int main(void) {
    // Complete system initialization
    
    // Set LED and buzzer pins as output
    LED_DDR |= (1 << LED_PIN) | (1 << LED_DOT_PIN) | (1 << LED_DASH_PIN) | (1 << LED_WORD_PIN);
    BUZZER_DDR |= (1 << BUZZER_PIN);
    // Ensure all debug LEDs are off
    LED_PORT &= ~(1 << LED_DOT_PIN);
    LED_PORT &= ~(1 << LED_DASH_PIN);
    LED_PORT &= ~(1 << LED_WORD_PIN);
    
    // Explicitly configure LCD pins as outputs (should be done by lcd_init, but let's be sure)
    DDRD |= (1 << PD2) | (1 << PD3) | (1 << PD4) | (1 << PD5);  // LCD data pins
    DDRC |= (1 << PC0) | (1 << PC1) | (1 << PC2);               // LCD control pins (RS, RW, E)
    
    // Set button as input with pull-up
    BUTTON_DDR &= ~(1 << BUTTON_PIN);
    BUTTON_PORT |= (1 << BUTTON_PIN);

    // Initialize LCD with extra delays
    delay_ms(50);  // Power-on delay
    lcd_init(LCD_DISP_ON);
    delay_ms(200);  // Give LCD more time to initialize
    lcd_clrscr();
    delay_ms(50);
    
    // Test LCD display immediately with simple message
    lcd_puts("MORSE DECODER");
    delay_ms(2000);  // Show test message for 2 seconds
    lcd_clrscr();
    delay_ms(50);
    
    // Show ready status for decoding
    lcd_puts("READY:");
    lcd_gotoxy(1, 0);  // Position cursor on second line for decoded text

    // Setup Timer2 for blink
    setup_timer2_blink();
    sei(); // Enable global interrupts

    // Declare buffers as static to ensure proper initialization
    static char morse_buf[16];
    static char msg_buf[128];
    uint8_t morse_idx = 0, msg_idx = 0;
    delay_timer(50);  // Power-on delay
    uint32_t press_time = 0, gap_time = 0;
    uint8_t lcd_col = 0;
    
    // Triple initialization - be absolutely sure buffers are clean
    delay_timer(200);  // Give LCD more time to initialize
    for (int i = 0; i < 16; i++) morse_buf[i] = 0;
    uint8_t btn = 1, last_btn = 1; // Declare btn and last_btn at function scope
    for (int i = 0; i < 16; i++) morse_buf[i] = '\0';
    for (int i = 0; i < 128; i++) msg_buf[i] = '\0';

    delay_timer(2000);  // Show test message for 2 seconds
    const uint16_t DOT_THRESH = DOT_DURATION;      // <200ms = dot (for button press timing)
    const uint16_t LETTER_GAP = LETTER_GAP_DURATION / 10;  // 600ms / 10ms = 60 increments
    const uint16_t WORD_GAP = WORD_GAP_DURATION / 10;      // 1400ms / 10ms = 140 increments

    // Main loop
    uint8_t gap_decoded = 0;
    while (1) {
        btn = (BUTTON_PINREG & (1 << BUTTON_PIN)) ? 1 : 0;
        if (!btn && last_btn) { // Button pressed
            // Reset gap timing and decoding flag when starting new input
            gap_time = 0;
            gap_decoded = 0;
            
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

            // Dot or dash (with buffer overflow protection)
            if (morse_idx < 15) { // Leave space for null terminator
                if (press_time < DOT_THRESH) {
                    morse_buf[morse_idx++] = '.';
                    // Light up DOT LED and show on LCD immediately
                    LED_PORT |= (1 << LED_DOT_PIN);
                    lcd_gotoxy(0, 0);
                    lcd_puts("DOT             ");  // Clear and show DOT
                    delay_ms(200);
                    LED_PORT &= ~(1 << LED_DOT_PIN);
                } else {
                    morse_buf[morse_idx++] = '-';
                    // Light up DASH LED and show on LCD immediately
                    LED_PORT |= (1 << LED_DASH_PIN);
                    lcd_gotoxy(0, 0);
                    lcd_puts("DASH            ");  // Clear and show DASH
                    delay_ms(200);
                    LED_PORT &= ~(1 << LED_DASH_PIN);
                }
                morse_buf[morse_idx] = '\0';
                
                // Show current morse buffer
                lcd_gotoxy(0, 5);
                lcd_puts(morse_buf);
                lcd_puts("        ");  // Clear remaining characters
            }
        }
        
        // Always increment gap_time when button is not pressed, regardless of previous state
        if (btn == 1) {  // Button not pressed (pull-up makes it 1 when not pressed)
            gap_time++;
            
            // Check for letter gap (immediate feedback)
            if (!gap_decoded && gap_time == LETTER_GAP && morse_idx > 0 && morse_buf[0] != 0) {
                gap_decoded = 1;
                
                if (is_AR(morse_buf)) {
                    // AR sequence detected - show the accumulated message
                    lcd_clrscr();
                    lcd_gotoxy(1, 0);  // Move to second line, first column
                    lcd_puts(msg_buf);  // Second line shows the message
                    
                    // Reset everything
                    morse_idx = 0; msg_idx = 0;
                    for (int i = 0; i < 16; i++) morse_buf[i] = 0;
                    for (int i = 0; i < 128; i++) msg_buf[i] = 0;
                    lcd_col = 0;
                    delay_ms(5000);  // Show final message for 5 seconds
                    
                    // Reset to ready state
                    lcd_clrscr();
                    lcd_puts("READY:");
                    lcd_gotoxy(1, 0);
                } else {
                    char decoded = decode_morse(morse_buf);
                    
                    // Only add valid decoded characters to buffer (don't display yet)
                    if (decoded != '?' && decoded != 0 && msg_idx < 126) {
                        msg_buf[msg_idx++] = decoded;
                        msg_buf[msg_idx] = '\0';
                        
                        // Show "Letter Gap" message immediately
                        lcd_gotoxy(0, 0);
                        lcd_puts("Letter Gap      ");
                        
                        // Clear morse buffer
                        morse_idx = 0;
                        for (int i = 0; i < 16; i++) morse_buf[i] = 0;
                    }
                }
            }
            
            // Check for word gap (add space and show message)
            if (gap_decoded && gap_time == WORD_GAP && msg_idx > 0) {
                // Add space for word gap
                if (msg_idx < 126) {
                    msg_buf[msg_idx++] = ' ';
                    msg_buf[msg_idx] = '\0';
                }
                
                // Show "Word Gap" message immediately
                lcd_gotoxy(0, 0);
                lcd_puts("Word Gap        ");
            }
        } else {
            // Reset gap timing when button is pressed
            gap_time = 0;
            gap_decoded = 0;
        }
        
        // Add a small delay to make gap timing work properly
        delay_ms(10);  // 10ms delay for proper gap timing
        
        last_btn = btn;
    }
    return 0;
}

