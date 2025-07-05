#include <avr/io.h>
#include <util/delay.h>

#define F_CPU 16000000UL  // 16 MHz (Arduino Uno default)

// LED setup (optional - connect LED to PB5/Arduino D13)
#define LED_DDR  DDRB
#define LED_PORT PORTB
#define LED_PIN  PB5

// USART initialization (9600 baud, 8N1)
void USART_Init(unsigned int ubrr) {
    // Set baud rate
    UBRR0H = (unsigned char)(ubrr >> 8);
    UBRR0L = (unsigned char)ubrr;
    
    // Enable transmitter and receiver
    UCSR0B = (1 << TXEN0) | (1 << RXEN0);
    
    // 8-bit data, no parity, 1 stop bit (8N1)
    UCSR0C = (1 << UCSZ01) | (1 << UCSZ00);
}

// Send a single character
void USART_Transmit(char data) {
    // Wait for empty transmit buffer
    while (!(UCSR0A & (1 << UDRE0)));
    UDR0 = data;
}

// Receive a single character
char USART_Receive() {
    // Wait for data to be received
    while (!(UCSR0A & (1 << RXC0)));
    return UDR0;
}

int main() {
    // Initialize USART (UBRR = [F_CPU/(16*BAUD)] - 1)
    USART_Init(103);  // 9600 baud @ 16MHz
    
    // Optional: Initialize LED
    LED_DDR |= (1 << LED_PIN);
    
    while (1) {
        // Blink LED (optional)
        LED_PORT ^= (1 << LED_PIN);
        _delay_ms(500);
        
        // Echo back received characters
        if (UCSR0A & (1 << RXC0)) {
            char received = USART_Receive();
            USART_Transmit(received);  // Echo
        }
    }
}