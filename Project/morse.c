// CO321 Embedded Systems
// Project: Morse Communicator
// Combined Encoder and Decoder
// Group 09

// Question:
/*
    MORSE CODE COMMUNICATOR - COMBINED SYSTEM
    
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
    
    PART 2: Morse Code Decoder
    - Use a push button to give input in terms of dots (.) and dashes (-)
    - Use appropriate time intervals for dot, dash, inter-symbol gap, and inter-word gap
    - With each press echo LED and Buzzer
    - End of message should be recognized as AR (.-.-.) sequence
    - Decode the message and display it on the LCD
    
    COMBINED SYSTEM FLOW:
    - Start with encoding stage
    - After processing encoder input, switch to decoder stage
    - After decoder completes (AR sequence), switch back to encoder
    - Continue alternating between modes
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

/*
*******************************************************************************
*******************************************************************************
    HARDWARE PIN DEFINITIONS AND TIMING CONSTANTS
*******************************************************************************
*******************************************************************************
*/

// Main Morse LED (used by both encoder and decoder)
#define LED_DDR  DDRB
#define LED_PORT PORTB
#define LED_PIN  PB5 // Arduino Pin 13 (On-board LED)

// Debug LEDs for decoder

/*
    In Decoder mode:
    - LED_DOT_PIN is used for DOT
    - LED_DASH_PIN is used for DASH
    - LED_WORD_PIN is used for WORD (space between words)
*/

#define LED_DOT_PIN    PB2 // Arduino Pin 10
#define LED_DASH_PIN   PB3 // Arduino Pin 11
#define LED_WORD_PIN   PB4 // Arduino Pin 12

// Additional LEDs for encoder

/*
    In Encoder mode:
    - LED_LETTER_PIN is used to show the end of a letter/number
    - LED_SENT_PIN is used to show the end of a sentence
*/

#define LED_LETTER_PIN PB2 // Arduino Pin 10 (same as DOT for shared usage)
#define LED_SENT_PIN   PB4 // Arduino Pin 12 (same as WORD for shared usage)

// Buzzer (used by both modes)
#define BUZZER_DDR  DDRB
#define BUZZER_PORT PORTB
#define BUZZER_PIN  PB1 // Arduino Pin 9 (PB1)

// Push Button for decoder
// Used to input Morse code via button presses
// The button is connected to PD7 (Arduino Pin 7)
#define BUTTON_DDR  DDRD
#define BUTTON_PORT PORTD
#define BUTTON_PIN  PD7
#define BUTTON_PINREG  PIND

// Morse code timing (in milliseconds)
// Reason for using define:
// Just by changing DOT_DURATION, we can change the timing of the entire Morse code
#define DOT_DURATION 200
#define DASH_DURATION (3 * DOT_DURATION)
#define SYMBOL_GAP_DURATION DOT_DURATION
#define LETTER_GAP_DURATION (3 * DOT_DURATION)
#define WORD_GAP_DURATION (7 * DOT_DURATION)

/*
*******************************************************************************
*******************************************************************************
    TIMER FUNCTIONS FOR MORSE CODE TIMING
    
    We need different timer configurations for encoder and decoder:
    - Timer0: For encoder delays (CTC mode, precise 100ms delays)
    - Timer1: For encoder PWM buzzer (1kHz frequency generation)
    - Timer2: For decoder LED blinking (interrupt-based)
*******************************************************************************
*******************************************************************************
*/

/*
TIMER CALCULATIONS FOR TIMER0 CTC MODE (ENCODER):

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

// 100ms delay using Timer0 in CTC mode, prescaler 64 (like your reference encoder)
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

// Simple delay in ms
/*
    This is used to create a delay of approximately a number of milliseconds.
    Outer loop runs for the number of milliseconds we want to delay.
    Inner loop runs for a number of counts based on the CPU frequency.
    The inner loop is calibrated to take approximately 1 ms per iteration.
*/
void delay_ms(uint16_t ms) 
{
    while (ms--) 
    {
        /*
            Calculation:
            F_CPU = 16 MHz
            F_CPU/1000/8 = 2,000 counts per ms
        */
        for (volatile uint16_t d = 0; d < (F_CPU / 1000 / 8); d++) 
        { 
            //NOP: No operation instruction
            // ASM means assembly code 
            // volatile means this line is not optimized out by the compiler
            asm volatile ("nop"); 
        }
    }
}

/*
    A PWM FUNCTION TO START THE BUZZER (ENCODER)

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

void start_buzzer_pwm(void) 
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
    FUNCTION TO STOP THE BUZZER PWM (ENCODER)
*/
void stop_buzzer_pwm(void) 
{   
    // Clear TCCR1A and TCCR1B to stop PWM
    TCCR1A = 0x00;
    TCCR1B = 0x00;

    // Ensure buzzer pin is low
    BUZZER_PORT &= ~(1 << BUZZER_PIN);
}

/*
    TIMER2 SETUP FOR DECODER LED BLINKING
    
    Timer2 interrupt for blinking LED_WORD_PIN during decoder mode
    This helps us time our button presses for dots and dashes.
*/

// blink_state is used to toggle the LED_WORD_PIN
// It is volatile because it is modified in the ISR
volatile uint8_t blink_state = 0;

// Set up Timer2 for CTC interrupt every DOT_DURATION ms
void setup_timer2_blink(void) 
{
    // 8-bit timer, prescaler 64, CTC mode
    TCCR2A = (1 << WGM21); // CTC mode
    TCCR2B = (1 << CS22);  // Prescaler 64

    // 16MHz / 64 = 250kHz, 1 count = 4us
    // DOT_DURATION ms = DOT_DURATION * 1000us / 4us = DOT_DURATION * 250 counts
    // For 200ms: 200 * 250 = 50000 counts, but OCR2A max is 255, so use ISR to count

    OCR2A = 249; // 1ms per compare match
    TIMSK2 = (1 << OCIE2A); // Enable CTC interrupt
}

// blink_counter is used to count the number of compare matches
volatile uint16_t blink_counter = 0;

// Interrupt Service Routine for Timer2 Compare Match
// This ISR toggles the LED_WORD_PIN at DOT_DURATION intervals
// It increments the blink_counter and toggles the LED_WORD_PIN when it reaches DOT_DURATION
ISR(TIMER2_COMPA_vect) 
{
    // Increment the blink counter
    blink_counter++;

    // Check if the blink counter has reached DOT_DURATION
    if (blink_counter == DOT_DURATION) 
    {
        // Reset the blink counter
        blink_counter = 0;

        // Toggle the LED_WORD_PIN
        blink_state = !blink_state;

        // Set or clear the LED_WORD_PIN based on blink_state
        if (blink_state) 
        {
            // if true, turn on the LED_WORD_PIN
            LED_PORT |= (1 << LED_WORD_PIN);
        } 
        else 
        {
            // if false, turn off the LED_WORD_PIN
            LED_PORT &= ~(1 << LED_WORD_PIN);
        }
    }
}

/*
    FUNCTION TO STOP TIMER2 BLINKING (WHEN SWITCHING TO ENCODER)

    A simple timer2 disabling function
*/
void stop_timer2_blink(void) 
{
    // Disable Timer2 interrupt
    TIMSK2 = 0x00;

    // Stop Timer2
    TCCR2A = 0x00;
    TCCR2B = 0x00;

    // Turn off LED
    LED_PORT &= ~(1 << LED_WORD_PIN);
}

/*
*******************************************************************************
*******************************************************************************
    ENCODER FUNCTIONS
*******************************************************************************
*******************************************************************************
*/

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

        // Wait for symbol duration using hardware timer (like reference encoder)
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
void letter_gap(void) 
{
    delay_100ms_units(LETTER_GAP_DURATION / 100);
}

/*
    Function to handle the gap between words
    This function is called after signaling a word
    It creates a delay for the specified WORD_GAP_DURATION
*/
void word_gap(void) 
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

/*
*******************************************************************************
*******************************************************************************
    DECODER FUNCTIONS
*******************************************************************************
*******************************************************************************
*/

// MORSE_ENTRY: Morse code lookup table for decoding

/*

    A LUT (Look-Up Table) is used to decode Morse code strings back to characters.
    Each entry in the table contains a Morse code string and its corresponding character.
    The table is terminated with a NULL entry to indicate the end of the table.

    How it works:
    - Each entry in the table is a struct 
    - containing a Morse code string and its corresponding character
    - The decode_morse function iterates through the table
    - It compares the input Morse code string with each entry's code
    - If a match is found, it returns the corresponding character
    - If no match is found, it returns a '?' character to indicate an unknown code
    - The is_AR function checks for the AR (.-.-.) sequence to indicate the end of a message

*/
typedef struct 
{
    // Morse code string and its corresponding character
    const char* code;
    char letter;
} MorseEntry;

const MorseEntry morseDecodeTable[] = 
{
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

/*
    DECODE_MORSE FUNCTION:
        Takes a Morse code string and returns the corresponding character
        If the code is not found, it returns '?'
*/
char decode_morse(const char* code) 
{
    // Iterate through the morseDecodeTable to find the matching code
    if (code == NULL) return '?'; // Handle NULL input
    for (int i = 0; morseDecodeTable[i].code != NULL; i++) 
    {
        // Compare the input code with the Morse code in the table
        // If a match is found, return the corresponding letter
        if (strcmp(morseDecodeTable[i].code, code) == 0) return morseDecodeTable[i].letter;
    }

    // if not found, return '?'
    return '?';
}

/*
    IS_AR FUNCTION:
        Checks if the input Morse code string is the AR sequence (.-.-.)
        Returns 1 if it is AR, 0 otherwise
*/
uint8_t is_AR(const char* code) 
{
    // Check if the input code matches the AR sequence
    return strcmp(code, ".-.-.") == 0;
}

/*
*******************************************************************************
*******************************************************************************
    MAIN PROGRAM - COMBINED ENCODER/DECODER SYSTEM
*******************************************************************************
*******************************************************************************
*/

/*
    This works as a State Machine for the combined encoder/decoder system.
    There are two modes:
    - Encoder Mode: Waits for serial input, processes text to Morse code
    - Decoder Mode: Waits for button input, processes Morse code to text
    The system starts in Encoder Mode, processes input, and switches to Decoder Mode.
    After processing in Decoder Mode, it switches back to Encoder Mode.

*/

// Define the modes for the system
#define MODE_ENCODER 0
#define MODE_DECODER 1

// Main function
int main(void) 
{
    /*
    *************************************************************************
        HARDWARE INITIALIZATION
    *************************************************************************
    */
    
    // Set LED and buzzer pins as output
    LED_DDR |= (1 << LED_PIN) | (1 << LED_LETTER_PIN) | (1 << LED_WORD_PIN) | (1 << LED_SENT_PIN);
    LED_DDR |= (1 << LED_DOT_PIN) | (1 << LED_DASH_PIN);
    BUZZER_DDR |= (1 << BUZZER_PIN);

    // Switch all LEDs and buzzer off initially
    LED_PORT &= ~(1 << LED_PIN);
    LED_PORT &= ~(1 << LED_LETTER_PIN);
    LED_PORT &= ~(1 << LED_WORD_PIN);
    LED_PORT &= ~(1 << LED_SENT_PIN);
    LED_PORT &= ~(1 << LED_DOT_PIN);
    LED_PORT &= ~(1 << LED_DASH_PIN);
    BUZZER_PORT &= ~(1 << BUZZER_PIN);

    // Set push button as input with pull-up (for decoder)
    BUTTON_DDR &= ~(1 << BUTTON_PIN);
    BUTTON_PORT |= (1 << BUTTON_PIN);

    // Initialize USART
    usart_init();

    // Initialize LCD
    lcd_init(LCD_DISP_ON);
    lcd_clrscr();
    lcd_gotoxy(0, 0); 

    /*
    *************************************************************************
        SYSTEM STATE VARIABLES
    *************************************************************************
    */
    
    // current_mode is used to track the current mode of the system
    // We start in encoder mode
    uint8_t current_mode = MODE_ENCODER; 
    
    /*
        ENCODER VARIABLES:
        - encoder_buffer: Buffer to store the input message from serial
        - encoder_buf_idx: Index to track the current position in the buffer
        - BUFFER_SIZE: Size of the encoder buffer (128 characters)
    */
    #define BUFFER_SIZE 128
    char encoder_buffer[BUFFER_SIZE];
    uint8_t encoder_buf_idx = 0;
    
    /*
        DECODER VARIABLES:
        - morse_buf: Buffer to store the Morse code input from button presses
        - morse_idx: Index for the Morse code buffer

        - msg_buf: Buffer to store the decoded message
        - msg_idx: Index for the decoded message buffer

        - last_btn: Last button state (to detect press/release)
        - btn: Current button state (to read button input)

        - press_time: Time when the button was pressed
        - gap_time: Time since the last button press

        - gap_decoded: Flag to indicate if a gap has been decoded
    */
    static char morse_buf[16];
    static char msg_buf[128];
    uint8_t morse_idx = 0, msg_idx = 0;
    uint8_t last_btn = 1, btn;
    uint32_t press_time = 0, gap_time = 0;
    uint8_t gap_decoded = 0;
    
    // Timing thresholds for decoder
    // These times are not strict limits but rather thresholds
    const uint16_t DOT_THRESH = DOT_DURATION;      // <200ms = dot (for button press timing)
    const uint16_t LETTER_GAP = LETTER_GAP_DURATION / 10;  // 600ms / 10ms = 60 increments
    const uint16_t WORD_GAP = WORD_GAP_DURATION / 10;      // 1400ms / 10ms = 140 increments
    
    // Initialize decoder buffers to ensure proper initialization
    // The reason for this is to ensure that the buffers are cleared
    // before we start using them in the decoder mode
    for (int i = 0; i < 16; i++) morse_buf[i] = 0;
    for (int i = 0; i < 128; i++) msg_buf[i] = 0;
    for (int i = 0; i < 16; i++) morse_buf[i] = '\0';
    for (int i = 0; i < 128; i++) msg_buf[i] = '\0';

    /*
    *************************************************************************
        MAIN SYSTEM LOOP - ALTERNATING BETWEEN ENCODER AND DECODER
    *************************************************************************
    */
    
    // A while loop to keep the system running indefinitely
    while (1) 
    {
        /*
        ***********************************************************************
            ENCODER MODE - SERIAL INPUT TO MORSE OUTPUT
        ***********************************************************************
        */

        // If we are in encoder mode
        if (current_mode == MODE_ENCODER) 
        {
            // Stop decoder timer if running
            stop_timer2_blink();
            
            // Display encoder mode status
            lcd_clrscr();
            lcd_gotoxy(0, 0); 
            lcd_puts("ENCODER MODE");
            lcd_clrscr();
            lcd_puts("Enter message");

            
            // Send mode info to serial
            usart_send_string("\r\n=== ENCODER MODE ===\r\n");
            usart_send_string("Type a message and press Enter:\r\n");

            /*
                ENCODER MAIN LOOP:

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
                - Switch to decoder mode.
            */
            
            
            while (current_mode == MODE_ENCODER) 
            {
                // Receive a character from USART
                char c = usart_receive();

                // Echo the received character back
                usart_send(c);

                // If Enter is pressed, process buffer
                if (c == '\n' || c == '\r') 
                {   
                    // Add the null terminator to the buffer
                    encoder_buffer[encoder_buf_idx] = '\0';

                    // i for iterating through the buffer
                    uint8_t i = 0;

                    // Clear the LCD screen
                    lcd_clrscr();
                    lcd_gotoxy(0, 0);  // Ensure cursor is at home position
                    lcd_puts("ENCODING...");

                    // Iterate through the buffer until we reach the null terminator
                    while (encoder_buffer[i] != '\0') 
                    {
                        // If we reach a space character
                        // We signal a word gap
                        if (encoder_buffer[i] == ' ') 
                        {
                            // Word finished
                            LED_PORT |= (1 << LED_WORD_PIN);

                            // Signal a word gap (function created above)
                            word_gap();

                            // Turn off the word LED
                            LED_PORT &= ~(1 << LED_WORD_PIN);

                            // Update LCD
                            lcd_clrscr();
                            lcd_gotoxy(0, 0);  // Ensure cursor is at home position
                            lcd_puts("WORD GAP");
                        } 
                        else 
                        {   
                            // If the character is not a space
                            // We get the Morse code for the character
                            // encoder_buffer[i] is the character (Eg: 'A', 'B', '1', etc.)
                            // When we do get_morse_code(encoder_buffer[i]),
                            // we get the corresponding Morse code string (e.g., ".-", "-...", etc.)
                            const char* morse = get_morse_code(encoder_buffer[i]);

                            // If the Morse code is valid (not NULL)
                            if (morse != NULL) 
                            {
                                // Clear the Screen
                                lcd_clrscr();
                                lcd_gotoxy(0, 0);  // Ensure cursor is at home position

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
                                lcd_putc(encoder_buffer[i]);

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
                            }
                        }
                        
                        // Increment the buffer index
                        i++;
                    }

                    // End of sentence
                    lcd_clrscr();
                    lcd_gotoxy(0, 0); 
                    lcd_puts("ENCODING DONE");
                    
                    // Send completion message to serial
                    usart_send_string("\r\nEncoding complete!\r\n");

                    // Light up the LED_SENT_PIN to indicate end of sentence
                    LED_PORT |= (1 << LED_SENT_PIN);

                    // Delay to indicate the end of the sentence
                    delay_100ms_units(10);

                    // Turn off the LED_SENT_PIN
                    LED_PORT &= ~(1 << LED_SENT_PIN);

                    // Reset the encoder buffer index
                    encoder_buf_idx = 0;
                    
                    // Switch to decoder mode
                    current_mode = MODE_DECODER;
                    
                    // Brief delay before mode switch
                    delay_100ms_units(20);
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
                    if (encoder_buf_idx < BUFFER_SIZE - 1 && (c >= 32 && c <= 126)) 
                    {
                        // Add the character to the buffer
                        encoder_buffer[encoder_buf_idx++] = c;
                    }
                }
            }
        }
        
        /*
        ***********************************************************************
            DECODER MODE - BUTTON INPUT TO TEXT OUTPUT
        ***********************************************************************
        */

        // If we are in decoder mode
        else if (current_mode == MODE_DECODER) 
        {
            // Start decoder timer for LED blinking
            setup_timer2_blink();

            // Enable global interrupts
            sei(); 
            
            // Display decoder mode status
            lcd_clrscr();
            lcd_gotoxy(0, 0);  // Ensure cursor is at home position
            lcd_puts("DECODER MODE");

            // Use the created delay function to wait before showing ready message
            delay_ms(1000);

            // Clear the LCD and show ready message 
            lcd_clrscr();
            lcd_gotoxy(0, 0);  
            lcd_puts("READY:");
            lcd_gotoxy(1, 0);  

            // Send mode info to serial
            usart_send_string("\r\n=== DECODER MODE ===\r\n");
            usart_send_string("Use button to input Morse code\r\n");
            usart_send_string("Send AR (.-.-.] to finish\r\n");
            
            // Reset decoder variables
            // last_btn is set to 1 (not pressed) because we are waiting for a press
            // as the button is pulled up
            morse_idx = 0;
            msg_idx = 0;
            gap_time = 0;
            gap_decoded = 0;
            last_btn = 1;
            
            // Clear decoder buffers
            for (int i = 0; i < 16; i++) morse_buf[i] = 0;
            for (int i = 0; i < 128; i++) msg_buf[i] = 0;

            /*
                DECODER MAIN LOOP:

                - Use a push button to give input in terms of dots (.) and dashes (-)
                - Use appropriate time intervals for dot, dash, inter-symbol gap, and inter-word gap
                - With each press echo LED and Buzzer
                - Show immediate feedback for letter gaps and word gaps
                - End of message should be recognized as AR (.-.-.) sequence
                - Decode the message and display it on the LCD
                - When AR is received, switch back to encoder mode
            */
            
            while (current_mode == MODE_DECODER) 
            {
                // Read the button state
                // The button is pulled up, so when pressed it reads 0
                // We use BUTTON_PINREG to read the current state of the button
                btn = (BUTTON_PINREG & (1 << BUTTON_PIN)) ? 1 : 0;
                
                // Check if the button state has changed
                // We only process the button state when it changes

                // IF the button is pressed (btn == 0) and last_btn was released (last_btn == 1)
                if (!btn && last_btn) 
                { 
                    // Reset gap timing and decoding flag when starting new input
                    gap_time = 0;
                    gap_decoded = 0;
                    
                    // Echo LED/buzzer
                    LED_PORT |= (1 << LED_PIN);
                    BUZZER_PORT |= (1 << BUZZER_PIN);
                    
                    // Wait for release and measure duration
                    // t is used to count the time in milliseconds
                    uint16_t t = 0;

                    // while the button is pressed (BUTTON_PINREG reads 0)
                    while (!(BUTTON_PINREG & (1 << BUTTON_PIN))) 
                    {
                        // Increment t for each millisecond
                        delay_ms(1);

                        // Increment the time counter
                        t++;
                    }

                    // Here we measure the time the button was pressed
                    press_time = t;
                    
                    // End echo
                    LED_PORT &= ~(1 << LED_PIN);
                    BUZZER_PORT &= ~(1 << BUZZER_PIN);

                    // Dot or dash (with buffer overflow protection)
                    // Here we check if the press is a dot or a dash
                    // We check if morse_idx is less than 15 to avoid buffer overflow
                    if (morse_idx < 15) 
                    { 
                        // Check if the press time is less than the threshold for a dot
                        if (press_time < DOT_THRESH) 
                        {
                            // It's a dot
                            // Add dot to morse_buf and light up DOT LED
                            morse_buf[morse_idx++] = '.';

                            // Light up DOT LED and show on LCD immediately
                            LED_PORT |= (1 << LED_DOT_PIN);
                            lcd_gotoxy(0, 0);

                            // Clear and show that we have a dot
                            lcd_puts("DOT             ");  
                            delay_ms(200); 

                            // Stop the DOT LED after 200ms
                            LED_PORT &= ~(1 << LED_DOT_PIN);
                        } 
                        
                        // If the press time is greater than or equal to the threshold for a dot
                        // It is a dash
                        else 
                        {
                            
                            // Add dash to morse_buf and light up DASH LED
                            morse_buf[morse_idx++] = '-';

                            // Light up DASH LED and show on LCD immediately
                            LED_PORT |= (1 << LED_DASH_PIN);
                            lcd_gotoxy(0, 0);

                            // Clear and show that we have a dash
                            lcd_puts("DASH            ");  
                            delay_ms(200);

                            // Stop the DASH LED after 200ms
                            LED_PORT &= ~(1 << LED_DASH_PIN);
                        }

                        // After that, we need to null-terminate the morse_buf
                        // This is to ensure that we can safely print it on the LCD
                        morse_buf[morse_idx] = '\0';
                        
                        // Show current morse buffer
                        lcd_gotoxy(0, 5);
                        lcd_puts(morse_buf);
                        lcd_puts("        "); 
                    }
                }
                
                // Always increment gap_time when button is not pressed, 
                // regardless of previous state
                // This is to track the time since the last button press
                // If the button is not pressed, we increment gap_time

                // if the button is not pressed (btn == 1)
                if (btn == 1) 
                {  
                    // Keep incrementing gap_time
                    gap_time++;
                    
                    // Check for letter gap (immediate feedback)
                    /*
                        if (!gap_decoded && gap_time == LETTER_GAP && morse_idx > 0 && morse_buf[0] != 0)
                        means:
                        - We haven't decoded a gap yet (gap_decoded == 0)
                        - The gap time has reached the LETTER_GAP threshold
                        - We have at least one Morse symbol in the buffer (morse_idx > 0)
                        - The first character in morse_buf is not null (morse_buf[0] != 0)
                        This indicates that we have a complete Morse letter to decode.
                        If all these conditions are true, we decode the letter.
                    
                    */ 
                    if (!gap_decoded && gap_time == LETTER_GAP && morse_idx > 0 && morse_buf[0] != 0) 
                    {
                        // Set gap_decoded to 1 to indicate we have processed a gap
                        gap_decoded = 1;
                        
                        // Check if the morse_buf contains a valid AR sequence
                        if (is_AR(morse_buf)) 
                        {
                            // AR sequence detected - show the accumulated message
                            lcd_clrscr();
                            lcd_puts(msg_buf); 
                            
                            // Send final message to serial
                            usart_send_string("\r\nDecoded message: ");
                            usart_send_string(msg_buf);
                            usart_send_string("\r\nDecoding complete!\r\n");
                            
                            // Show message for 5 seconds using simplified delay
                            delay_ms(5000);
                            
                            // Switch back to encoder mode
                            current_mode = MODE_ENCODER;
                            
                            // Reset decoder variables
                            morse_idx = 0; 
                            msg_idx = 0;
                            for (int i = 0; i < 16; i++) morse_buf[i] = 0;
                            for (int i = 0; i < 128; i++) msg_buf[i] = 0;
                        } 
                        
                        // else is for when we have a valid Morse letter
                        // We decode the Morse code in morse_buf
                        // and add it to the msg_buf
                        else 
                        {   
                            // decoded is the character decoded from morse_buf
                            char decoded = decode_morse(morse_buf);
                            
                            // Only add valid decoded characters to buffer (don't display yet)
                            // We check if decoded is not '?' (unknown) and not 0 (null character)
                            // and if msg_idx is less than 126 to avoid buffer overflow
                            if (decoded != '?' && decoded != 0 && msg_idx < 126) 
                            {
                                // Add the decoded character to msg_buf
                                msg_buf[msg_idx++] = decoded;

                                // Null-terminate the msg_buf
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
                    
                    /*
                        if (gap_decoded && gap_time == WORD_GAP && msg_idx > 0)
                        means:
                        - We have already decoded a gap (gap_decoded == 1)
                        - The gap time has reached the WORD_GAP threshold
                        - We have at least one character in the msg_buf (msg_idx > 0)
                        This indicates that we have a complete Morse word to decode.
                        If all these conditions are true, we add a space to msg_buf
                        and show the "Word Gap" message on the LCD.
                    */ 

                    if (gap_decoded && gap_time == WORD_GAP && msg_idx > 0) 
                    {
                        // Add space for word gap
                        if (msg_idx < 126) 
                        {
                            // Add a space to msg_buf
                            msg_buf[msg_idx++] = ' ';

                            // Null-terminate the msg_buf
                            msg_buf[msg_idx] = '\0';
                        }
                        
                        // Show "Word Gap" message immediately
                        lcd_gotoxy(0, 0);
                        lcd_puts("Word Gap        ");
                    }
                } 
                
                // This else is for when the button is pressed
                // We reset the gap timing and gap_decoded flag
                else 
                {
                    // Reset gap timing when button is pressed
                    gap_time = 0;
                    gap_decoded = 0;
                }
                
                // Add proper timing for gap detection
                delay_ms(10); 
                
                // Now we need to update the last_btn state
                // So, we make last_btn equal to btn
                last_btn = btn;
            }
        }
    }

    return 0;
}
