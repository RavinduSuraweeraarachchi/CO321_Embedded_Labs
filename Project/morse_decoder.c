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