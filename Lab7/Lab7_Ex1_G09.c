// CO321 Embedded Systems
// Lab 07: EEPROM / LCD / Keypad
// AVR EEPROM programming in C language
// Exercise 1: Writing EEPROM Read/Write Functions
// Group 09

// Question:
/*
    Write a function called EEPROMwrite() that takes the EEPROM address and the
    data as arguments and write to the EEPROM. 
    
    Write a function called EEPROMread() that takes the EEPROM address as an argument 
    and returns the data in that memory location. 
    
    (You don’t need to show this part to the instructors but 
    you need to use these functions for the next questions).

*/

// Importing Necessary Libraries
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "lcd.h"
#include <string.h>

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
//      1. address: EEPROM address to read from
// Also there is a return value for this function:
//      1. data: data read from the EEPROM at the address
//         which is a character

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

// Main function to test EEPROM read/write functions with LCD display

int main(void) 
{
    // Initialize the LCD
    lcd_init(LCD_DISP_ON);
    
    // Show startup message
    lcd_clrscr();
    lcd_puts("EEPROM Char Test");

    // Next line for group name
    lcd_gotoxy(0, 1);
    lcd_puts("CO321 Group 09");

    _delay_ms(2000);
    
    while (1) 
    {
        
        /*
            First we try to store letters A to H in the EEPROM
            Then we read them back and display them on the LCD
        */

        lcd_clrscr();
        lcd_puts("Writing A-H...");
        _delay_ms(1000);
        
        // Write letters A to H to EEPROM addresses 0x00 to 0x07
        for(unsigned int i = 0; i < 8; i++) 
        {
            char letter = 'A' + i; 
            EEPROMwrite(i, letter);
            _delay_ms(5);  // Wait for write to complete
        }
        
        // Display letters read from EEPROM
        lcd_clrscr();
        lcd_puts("Letters from EEPROM:");
        lcd_gotoxy(0, 1);
        
        // Loop to read and display letters A to H
        for(unsigned int i = 0; i < 8; i++) 
        {
            char read_letter = EEPROMread(i);
            lcd_putc(read_letter);
            _delay_ms(300);
        }

        // Wait for a while before next operation
        _delay_ms(2000);
        
        /*
            Now we try to store numbers 1 to 9 in the EEPROM
            Then we read them back and display them on the LCD
        
        */

        lcd_clrscr();
        lcd_puts("Writing 0-9...");
        _delay_ms(1000);
        
        // Write numbers 1 to 9 to EEPROM addresses 0x10 to 0x18
        for(unsigned int i = 0; i <= 9; i++) 
        {
            char number = '0' + i; 
            EEPROMwrite(0x08 + i, number);
            // Notice that we start writing from address 0x10
            _delay_ms(5); 
        }


        // Loop to read back and display numbers 0 to 9
        for(unsigned int i = 0; i <= 9; i++) 
        {
            char read_number = EEPROMread(0x08 + i);
            lcd_gotoxy(i, 1);
            lcd_putc(read_number);
            _delay_ms(300);
        }


        /*
            Now we can write a code to
            Check what is there at each address from 0x00 to 0x18
        */

        lcd_clrscr();
        lcd_puts("Char by Address");
        lcd_gotoxy(0, 1);
        // Loop through addresses 0 to 17
        for(unsigned int i = 0; i < 18; i++) 
        {
            lcd_clrscr();
            
            
            // Display address in hex format
            lcd_puts("Addr: 0x");
            
            // Convert number to hex display
            if(i < 0x10) 
            {
                lcd_putc('0');
                if(i < 10) 
                {
                    lcd_putc('0' + i);  // 0,1,2,3,4,5,6,7,8,9
                } 
                else 
                {
                    lcd_putc('A' + (i - 10));  // A,B,C,D,E,F
                }
            } 
            
            else 
            {
                lcd_putc('1');
                lcd_putc('0' + (i - 0x10));  // 10,11,12...
            }
            
            lcd_gotoxy(0, 1);

            char data = EEPROMread(i);
            lcd_puts(" Data: ");
            lcd_putc(data);
            _delay_ms(500);
        }

    }
    
    return 0;
}