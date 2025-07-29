// CO321 Embedded Systems
// Lab 07: EEPROM / LCD / Keypad
// AVR EEPROM programming in C language
// Exercise 2: Writing EEPROM Read/Write Functions
// Group 09

// Question:
/*

    Write a program that takes an ASCII sentence (ending with the carriage return \r)
    through the serial port, and then writes the same to the EEPROM. Then write
    another program that reads and prints all the data in the first 1024 addresses in the
    EEPROM via the serial port

*/

// Importing Necessary Libraries
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
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


// Function to write data to EEPROM

/*
    WRITING TO EEPROM

    The following procedure should be followed to write data to the EEPROM:
        1. Wait until a previous EEPROM write operation is complete.
            * i.e. till EEPE bit becomes 0
        2. Write the new EEPROM address
            * EEARL and EEARH registers are used for this purpose
        3. Write the new data to be written in the EEPROM at the address
            * EEDR register is used for this purpose
        4. Write a logic 1 to the EEMPE bit WHILE writing logic 0 to EEPE
        5. Within FOUR CLOCK cycles, write a logic 1 to EEPE

*/

// i.e. EEPROM write function takes two arguments:
//      1. address: EEPROM address to write to
//      2. data: data to be written to the EEPROM
// There is no return value for this function

void EEPROMwrite(unsigned int address, char data)
{
    // Wait until the EEPROM is ready for a new write operation
    while (EECR & (1 << EEPE));

    // Set the EEPROM address
    EEARL = address;
    EEARH = address >> 8;

    // Set the data to be written
    EEDR = data;

    // Writing logic 1 to EEMPE while EEPE is 0
    EECR |= (1 << EEMPE);

    // Within four clock cycles, write logic 1 to EEPE to start the write operation
    // We can start immediately after setting EEMPE
    EECR |= (1 << EEPE);
}


// Function to read data from EEPROM

/*
    READING FROM EEPROM

    The following procedure should be followed to read data from the EEPROM:
        1. Wait until a previous EEPROM write operation is complete.
            * i.e. till EEPE bit becomes 0
        2. Write the new EEPROM address
            * EEARL and EEARH registers are used for this purpose
        3. Write a logic 1 to EERE bit to start the read operation
        4. Read the data from the EEDR register

*/

// i.e. EEPROM read function takes one argument:
//      Address: EEPROM address to read from
// Also there is a return value for this function:
//      Data: data read from the EEPROM at the address
//      which is a character

char EEPROMread(unsigned int address)
{
    // Wait until the EEPROM is ready for a new write operation
    while (EECR & (1 << EEPE));

    // Set the EEPROM address
    EEARL = address;
    EEARH = address >> 8;

    // Start the read operation by writing logic 1 to EERE
    EECR |= (1 << EERE);

    // Return the data read from the EEPROM
    return EEDR;
}

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


// A program to write a string to EEPROM 
// That ends with a carriage return \r
// Through the serial port
// Then read it back and display on the LCD

// Now we can write the main function

int main(void)
{   
    // We can start the LCD 
    lcd_init(LCD_DISP_ON);

    // Initialize the USART
    usart_init();

    // Infinite loop to keep the program running
    while (1) 
    {
        // Message on LCD to type a sentence
        lcd_clrscr();
        lcd_puts("Type a sentence");
        lcd_gotoxy(0, 1);
        lcd_puts("& press <ENTER>");

        // EEPROM Address variable is required to check where the characters are stored
        unsigned int eeprom_addr = 0;

        // A variable for the receiving character
        char received_char;

        while (1) 
        {

            // Receive the character via USART receive
            received_char = usart_receive();

            // Echo back to serial terminal
            usart_send(received_char);

            // Receiving Message
            lcd_clrscr();
            lcd_puts("Receiving:");

            /*
                As we can see
                When we type in the characters
                They are being echoed back while being written on the EEPROM
            
            */

            // When we receive the carriage return
            // i.e. When ENTER is pressed

            if (received_char == '\r') 
            {
               
                break;
            }

            // Store in EEPROM
            EEPROMwrite(eeprom_addr, received_char);
            eeprom_addr++;

            _delay_ms(50); // Small delay for better readability
        }

        _delay_ms(1000);

        // A message showing the stored sentence
        lcd_clrscr();
        lcd_puts("Stored Sentence:");
        lcd_gotoxy(0, 1);

        usart_send('\r');
        usart_send('\n');

        // We have to start from the first address in showing back
        eeprom_addr = 0;

        // A char variable to detect whether we got \r or \o
        char c;

        unsigned int lcd_count = 0;

        int sentence_ended = 0;

        while(eeprom_addr<1024)
        {
            c = EEPROMread(eeprom_addr);

            if (c == '\r' || c == '\0') 
            {
                usart_send('.');

            }
            else
            {
                usart_send(c);
            }

            _delay_ms(50); // Small delay for better readability


            if (c >= 32 && c <= 126)
                lcd_putc(c); // Check if character is printable
            else
                lcd_putc('.'); // If not printable, display a dot
                

            eeprom_addr++;
            lcd_count++;

            if(lcd_count == 64)
            {
                usart_send('\r');
                usart_send('\n');
                _delay_ms(100); // Small delay for better readability
                lcd_clrscr();
                lcd_count = 0; // Reset the count for next line
                lcd_gotoxy(0, 0); // Move cursor to the start of the next line
            }


            // if (lcd_count != 0)
            // {
            //     usart_send('\r');
            //     usart_send('\n');
            // }

            _delay_ms(50); // Small delay for better readability
        }
    }
}
