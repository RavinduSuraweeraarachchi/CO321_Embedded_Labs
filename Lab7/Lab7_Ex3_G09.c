// CO321 Embedded Systems
// Lab 07: EEPROM / LCD / Keypad
// AVR EEPROM programming in C language
// Exercise 3: Caesar Cipher with EEPROM, LCD and Keypad
// Group 09

// Question:
/*

    In this exercise you have to develop an encryption system using the Caesar cipher.

    For this you have to use the LCD, keypad and the AVR MCU provided.
    
    When you run the program on the AVR, it should ask whether you want to encrypt or
    change the secret key. You should be able to make the choice using the provided
    keypad.
    
    Once the key is set, then it should ask for the plain text (for simplicity, we’ll use 10
    characters). 
    
    Also, the key should be stored in EEPROM. 
    
    The plain text should be entered using the keypad. 
    
    It should be shown on the LCD in real time. 
    
    Once the plain text is entered, it should be encrypted, and displayed on the LCD.
    
    You can fine tune the system in any manner you like. 
    (e.g.: what happens after an encryption process? you can decide).

    Also no communication should be done with the PC other than uploading the program

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
********************************************************************************
    CAESAR CIPHER CODE
*******************************************************************************
*******************************************************************************

*/

char caesar_cipher(char ch, uint8_t shift)
{
    // If the character is an uppercase letter
    if (ch >= 'A' && ch <= 'Z')
    {
        // Shift the character by the specified positions
        ch = ((ch - 'A' + shift) % 26) + 'A';
        return ch;
    }

    // If the character is a lowercase letter
    else if (ch >= 'a' && ch <= 'z')
    {
        // Shift the character by the specified positions
        ch = ((ch - 'a' + shift) % 26) + 'a';
        return ch;
    }

    // We need a condition for all other characters
    else
    {
        // Non-alphabetic characters remain unchanged
        return ch;
    }
}


/*
*******************************************************************************
********************************************************************************
    4x4 MATRIX KEYPAD CODE
*******************************************************************************
*******************************************************************************

    It initializes the keypad, scans for key presses, and returns the pressed key.
    The keypad layout is defined in a 2D array.

    The keypad uses 4 rows and 4 columns, with rows set as outputs and columns as inputs.
    When a key is pressed, it pulls the corresponding column low, allowing detection of the key.

*/

// Keypad layout
// This maps the layout of the keys on the keypad to characters.
const char keymap[4][4] = {
    {'1','2','3','A'},
    {'4','5','6','B'},
    {'7','8','9','C'},
    {'*','0','#','D'}
};

/*
Row pins are as follows:
    - Row 1 Pin: PD7 (Arduino Pin 7)
    - Row 2 Pin: PD6 (Arduino Pin 6)
    - Row 3 Pin: PB0 (Arduino Pin 8)
    - Row 4 Pin: PB1 (Arduino Pin 9)

    define is used to define the row and column pins for the keypad
    for the convenience of the code
*/

#define ROW1_PORT PORTD
#define ROW1_DDR  DDRD
#define ROW1_PIN  PD7    

#define ROW2_PORT PORTD
#define ROW2_DDR  DDRD
#define ROW2_PIN  PD6   

#define ROW3_PORT PORTB
#define ROW3_DDR  DDRB
#define ROW3_PIN  PB0    

#define ROW4_PORT PORTB
#define ROW4_DDR  DDRB
#define ROW4_PIN  PB1    

/*
Column pins are as follows:
    - Column 1 Pin: PB2 (Arduino Pin 10)
    - Column 2 Pin: PB3 (Arduino Pin 11)
    - Column 3 Pin: PB4 (Arduino Pin 12)
    - Column 4 Pin: PB5 (Arduino Pin 13)

*/
#define COL1_PIN  PB2    // Arduino 10
#define COL2_PIN  PB3    // Arduino 11
#define COL3_PIN  PB4    // Arduino 12
#define COL4_PIN  PB5    // Arduino 13

/*
Initializtion:
    To get the inputs from the keypad, we need to set the rows as outputs and columns as inputs.
    The columns will have pull-up resistors enabled to ensure they read high when no key is pressed.
    When a key is pressed, it pulls the corresponding column low, allowing detection of the key.
*/
void keypad_init(void) 
{
    // Set respective row ports as outputs
    ROW1_DDR |= (1 << ROW1_PIN);
    ROW2_DDR |= (1 << ROW2_PIN);
    ROW3_DDR |= (1 << ROW3_PIN);
    ROW4_DDR |= (1 << ROW4_PIN);

    // Set columns as inputs
    DDRB &= ~((1 << COL1_PIN) | (1 << COL2_PIN) | (1 << COL3_PIN) | (1 << COL4_PIN));

    // Enable pull-up resistors on column pins
    PORTB |= (1 << COL1_PIN) | (1 << COL2_PIN) | (1 << COL3_PIN) | (1 << COL4_PIN);
}

/*
Now we need to scan the keypad for key presses.
    The function keypad_getkey() will iterate through each row, setting it low one at a time,
    and checking the state of the columns. If a column reads low, it means a key in that row
    and column is pressed, and we return the corresponding character from the keymap.
*/

char keypad_getkey(void) 
{
    /*

    Here, we create an array of pointers to the row ports and an array of row pin numbers.
    This allows us to easily iterate through the rows and set them low one at a time.
    The row_ports array holds the addresses of the PORT registers for each row,
    and the row_pins array holds the pin numbers for each row.  

    */

    volatile uint8_t* row_ports[4] = {&ROW2_PORT, &ROW1_PORT, &ROW3_PORT, &ROW4_PORT};
    uint8_t row_pins[4] = {ROW2_PIN, ROW1_PIN, ROW3_PIN, ROW4_PIN};


    // Iterate through each row
    // We will set each row low one at a time and check the columns for a key
    // If a key is pressed, we will return the corresponding character from the keymap
    // We will use a delay to allow the row to stabilize before reading the columns

    for (uint8_t row = 0; row < 4; row++) 
    {
        // Set all rows HIGH first
        ROW1_PORT |= (1 << ROW1_PIN);
        ROW2_PORT |= (1 << ROW2_PIN);
        ROW3_PORT |= (1 << ROW3_PIN);
        ROW4_PORT |= (1 << ROW4_PIN);

        // Set current row LOW
        *(row_ports[row]) &= ~(1 << row_pins[row]);
        // Delay to allow the row to stabilize
        _delay_us(5);

        // Read columns
        // col_val will hold the state of the columns
        // We will read the state of the columns using PINB register
        // Using mask 0b00111100 to read only the relevant bits (PB2-PB5)
        uint8_t col_val = PINB & 0b00111100; // PB2-PB5

        // Now we write a loop to check each column
        // If a column reads low, it means a key in that row and column is pressed
        for (uint8_t col = 0; col < 4; col++) 
        {   
            // Check if the column is low
            if (!(col_val & (1 << (COL1_PIN + col)))) 
            {   
                _delay_ms(20); // Debounce after press

                // Wait for key release (simple debounce)
                while (!(PINB & (1 << (COL1_PIN + col))));

                _delay_ms(50); // Debounce delay after release

                // Return the corresponding key from the keymap
                // The row and column indices are used to access the keymap
                return keymap[row][col];
            }
        }
    } 
    return 0;
}

/*
*******************************************************************************
*******************************************************************************
    MAIN FUNCTION
*******************************************************************************
*******************************************************************************
*/

/*
The main function should:
    - Ask whether we want to encrypt or change the secret key.
    - Change Key: 
        - It should prompt for a new key
        - Using the Keypad
        - The new key should be stored in EEPROM
    - Encrypt Text:
        - It should prompt for the plain text
        - Using the Keypad
        - The entered text should be encrypted using the secret key
        - The encrypted text should be displayed on the LCD
*/

int main(void)
{
    // Initialize the LCD
    lcd_init(LCD_DISP_ON);

    // Initialize the keypad
    keypad_init();


    // Variable to hold the secret key
    uint8_t secret_key = 3; // Default key for Caesar cipher

    // Variable to hold the input text
    char input_text[11] = {0}; // 10 characters + null terminator
    char encrypted_text[11] = {0}; // 10 characters + null terminator

    // Store the initial secret key in EEPROM
    // At address 0
    EEPROMwrite(0, secret_key);

    // Variable to hold the choice
    char choice;

    // Main loop
    while (1)
    {
        // Read the secret key from EEPROM
        secret_key = EEPROMread(0);

        // Display menu on LCD
        lcd_clrscr();
        lcd_gotoxy(0, 0);
        lcd_puts("A:Encrypt B:Key");
        lcd_gotoxy(0, 1);
        lcd_puts("Current Key: ");
        lcd_putc(secret_key + '0');

        // Wait for user choice
        do 
        {
            choice = keypad_getkey();
        } 
        while (choice != 'A' && choice != 'B');

        if (choice == 'B') 
        {
            // Change secret key
            lcd_clrscr();
            lcd_gotoxy(0, 0);
            lcd_puts("New Key (0-9):");

            char key_char = 0;

            do 
            {
                key_char = keypad_getkey();
            } 
            while (key_char < '0' || key_char > '9');

            secret_key = key_char - '0';

            EEPROMwrite(0, secret_key);
            lcd_clrscr();
            lcd_gotoxy(0, 0);
            lcd_puts("Key Updated!");
            _delay_ms(1000);

        } 
        
        else if (choice == 'A') 
        
        {
            // Wait for key release to avoid double reading the menu key
            while (keypad_getkey());

            // Encrypt text
            lcd_clrscr();
            lcd_gotoxy(0, 0);
            lcd_puts("Enter Text:");
            lcd_gotoxy(0, 1);

            // Input text from keypad
            // We need the variable index(idx) to keep track of the number of characters entered
            uint8_t idx = 0;
            while (idx < 10) 
            {   
                // Initialize a character variable to hold the key pressed
                char ch = 0;

                // Wait for a key press
                while (!(ch = keypad_getkey()));

                // If the key is '#', break the loop to finish early
                if (ch == '#') break;

                // Character is added to input_text
                input_text[idx] = ch;

                // Display the character on the LCD
                lcd_putc(ch);

                // Increment the index
                idx++;
            }

            // Null-terminate the input text
            input_text[idx] = '\0';

            // Encrypt the text
            for (uint8_t i = 0; i < idx; i++) 
            {   
                // Use the caesar_cipher function to encrypt each character
                encrypted_text[i] = caesar_cipher(input_text[i], secret_key);
            }

            // Again, null-terminate the encrypted text
            encrypted_text[idx] = '\0';

            // Display encrypted text
            lcd_clrscr();
            lcd_gotoxy(0, 0);
            lcd_puts("Encrypted:");
            lcd_gotoxy(0, 1);
            lcd_puts(encrypted_text);
            _delay_ms(3000);
        }

        // Clear LCD for next operation
        lcd_clrscr();

    }


    return 0;
} 