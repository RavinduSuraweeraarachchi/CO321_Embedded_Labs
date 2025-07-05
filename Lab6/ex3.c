// CO321 Embedded Systems
// Lab 06: Serial Communication
// AVR Serial Port Programming in C Language
// Exercise 1: Writing USART Initialization, Sending and Receiving Functions
// Group 09

// Question:
/*
    Write a program that repeatedly does the following
    a. Receives a sentence only having ASCII characters from the PC. You can use
        the carriage return character to find the end of the sentence.
    b. Apply Caesar cipher (key is 3) to the sentence on the microcontroller. Only
        encrypt alphabetic characters (both upper and lower case). Keep all other
        characters unchanged.
    c. Transmit the encrypted sentence back to the PC.
*/

// Importing Necessary Libraries
#include <avr/io.h>
#include <util/delay.h>

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
Following Steps are required to initialize USART:
    * Set the baud rate by loading the UBRR register
    * Set to Asynchronous mode
    * Set the 8 data bits, no parity, and 1 stop bit
    * Enable the transmitter and receiver
*/

void usart_init()
{

    /*
    Enabling the Transmitter
        * We use the UCSR0B (USART Control and Status Register B)
        * TXEN0 bit should be set to 1 to enable the transmitter (bit 3)
    */
    UCSR0B |= (1 << TXEN0); // Enable transmitter

    /*
    Enabling the Receiver
        * We use the UCSR0B (USART Control and Status Register B)
        * RXEN0 bit should be set to 1 to enable the receiver (bit 4)
    */
    UCSR0B |= (1 << RXEN0); // Enable receiver

    /*
    Setting the Baud Rate
        * We use the UBRR0H and UBRR0L registers to set the baud rate.
        * 12 bits are used for this
        * All 8 bits of UBRR0L and 4 bits of UBRR0H are used.
        * First 8 bits of UBRR should be written to UBBR0L
        * Next 4 bits of UBRR should be written to UBBR0H
    */
    UBRR0L = (uint8_t)(UBRR); // Load lower 8 bits of UBRR
    UBRR0H = (uint8_t)(UBRR >> 8); // Load upper 4 bits of UBRR
    // It is alright to do this as last 4 bits of UBRR0H are reserved

    /*
    Setting to Asynchronous Mode
        * We use UCSR0C (USART Control and Status Register C)
        * In there, UMSEL01 and UMSEL00 bits are used to set the mode (bits 7 and 6)
        * When both are 0, it is set to Asynchronous mode
    */
    UCSR0C &= ~(1<<UMSEL01);
    UCSR0C &= ~(1<<UMSEL00);

    /*
    Setting 8-bit data mode
        * We use two registers
        * UCSR0B and UCSR0C
        * The UCSZn1:0 bits combined with the UCSZn2 bit in UCSRnB sets the Character Size
        * For 8-bit data:
        * UCSZ01 = 1
        * UCSZ00 = 1
        * UCSZ02 = 0
    */
    UCSR0B &= ~(1 << UCSZ02); // Clear UCSZ02
    UCSR0C |= (1 << UCSZ01) | (1 << UCSZ00); // Set UCSZ01 and UCSZ00

    /*
    Setting the Parity Mode
        * We use the UCSR0C (USART Control and Status Register C)
        * The UPM00 and UPM01 bits are used to set the parity mode (bits 5 and 4)
        * For no parity, both bits should be cleared    
    */
    
    UCSR0C &= ~(1<<UPM00);
    UCSR0C &= ~(1<<UPM01);

    /*    Setting the Stop Bit
        * We use the UCSR0C (USART Control and Status Register C)
        * There is the USBS0 bit (bit 3) which selects either 1 or 2 stop bits
        * For 1-bit stop bit, we clear the USBS0 bit
    */
    UCSR0C &= ~(1 << USBS0); 

}   


/*
Writing a function to transmit a character (given as an argument)
    * Character to be transmitted is given as an argument
    * That character should be written to the UDR0 register
    * Then we monitor the UDRE0 bit in UCSR0A (USART Control and Status Register A)
    * If UDRE0 is one, the buffer is empty and ready to accept the character
    * We can then write the character to UDR0
*/

void usart_send(char send_char)
{
    // We can wait until the transmit buffer is empty
    // i.e. it waits as long as the UDRE0 bit is not set (0)
    while (!(UCSR0A & (1 << UDRE0)));

    // Load the character into the transmit buffer
    UDR0 = send_char;   
}

/*
Writing a function to receive a character
    * The RXC0 flag bit in UCSR0A (USART Control and Status Register A)
    * It is monitored for a HIGH to see if an entire character has been received yet
    * When RXC0 is set, it means that the UDR0 register contains a valid character
*/

char usart_receive()
{
    // Wait until a character is received
    while (!(UCSR0A & (1 << RXC0)));

    // Return the received character from the data register
    return UDR0;
}

/*
A Function to cipher a character using Caesar Cipher with key 3
    - Only alphabetic characters are encrypted (both upper and lower case)
    - Non-alphabetic characters remain unchanged
*/

char caesar_cipher(char ch)
{
    // If the character is an uppercase letter
    if (ch >= 'A' && ch <= 'Z')
    {
        // Shift the character by 3 positions
        ch = ((ch - 'A' + 3) % 26) + 'A';
        return ch;
    }

    // If the character is a lowercase letter
    else if (ch >= 'a' && ch <= 'z')
    {
        // Shift the character by 3 positions
        ch = ((ch - 'a' + 3) % 26) + 'a';
        return ch;
    }

    // We need a condition for all other characters
    else
    {
        // Non-alphabetic characters remain unchanged
        return ch;
    }
}

void usart_send_string(char* str)
{
    while (*str != '\0')
    {
        usart_send(*str);
        str++;
    }
}

int main(void)
{

    /*
        The idea now is
        * Collect all the characters received from the PC
        * In a buffer until a carriage return or newline is received
        * When the carriage return or newline is received
        * Apply the Caesar cipher to the collected sentence (in a loop)
        * We can save the encrypted characters in another buffer
        * Finally, we send the encrypted buffer back to the PC
    */
    _delay_ms(5000); // Initial delay for stability

    // Initialize USART
    usart_init();


    usart_send_string("Enter the sentence and press <ENTER>:\r\n");
    _delay_ms(1000); // Delay for a second

    // Starting the main loop
    while(1)
    {
        char received_char;
        char encrypted_buffer[100]; // Buffer to store the encrypted sentence
        int index = 0; // Index for the encrypted buffer

        // Clear the encrypted buffer
        for (int i = 0; i < 100; i++) {
            encrypted_buffer[i] = '\0';
        }

        // Receive characters until a carriage return or newline is detected
        while (1) {
            received_char = usart_receive(); // Receive a character

            // Check for carriage return or newline to find end of sentence
            if (received_char == '\r' || received_char == '\n') {
                break; // End of sentence detected
            }
            usart_send(received_char); // Echo the received character back to the PC

            // Apply Caesar cipher to the received character
            char encrypted_char = caesar_cipher(received_char);

            // Store the encrypted character in the buffer
            encrypted_buffer[index++] = encrypted_char;
        }

        // Send the encrypted sentence back to the PC
        usart_send_string("\r\nEncrypted: ");
        usart_send_string(encrypted_buffer);
        usart_send_string("\r\n\r\nEnter next sentence:\r\n");

        
    }


    return 0;
}
