#include <avr/io.h>
#include <util/delay.h>
#include <string.h>  // Add this for strlen()
#include "lcd.h"

int main(void) {
    lcd_init(LCD_DISP_ON);
    
    while(1) {
        // Test 1: Basic display
        lcd_clrscr();
        lcd_puts("LCD Test Suite");
        lcd_gotoxy(0, 1);
        lcd_puts("Starting...");
        _delay_ms(2000);
        
        // Test 2: Character positioning animation
        lcd_clrscr();
        lcd_puts("Position Test:");
        for(uint8_t i = 0; i < 16; i++) {
            lcd_gotoxy(i, 1);
            lcd_putc('0' + (i % 10));
            lcd_gotoxy(15-i, 1);
            lcd_putc('A' + (i % 26));
            _delay_ms(200);
        }
        _delay_ms(1000);
        
        // Test 3: Scrolling text
        lcd_clrscr();
        lcd_puts("Scroll Test:");
        lcd_gotoxy(0, 1);
        char* long_text = "This text is longer than 16 characters and will scroll";
        
        for(uint8_t pos = 0; pos < strlen(long_text) - 15; pos++) {
            lcd_gotoxy(0, 1);
            for(uint8_t i = 0; i < 16; i++) {
                if(pos + i < strlen(long_text)) {
                    lcd_putc(long_text[pos + i]);
                } else {
                    lcd_putc(' ');
                }
            }
            _delay_ms(300);
        }
        
        // Test 4: Number display with countdown
        lcd_clrscr();
        lcd_puts("Countdown:");
        for(int16_t num = 999; num >= 0; num -= 111) {
            lcd_gotoxy(0, 1);
            lcd_puts("      "); // Clear line
            lcd_gotoxy(0, 1);
            
            // Display number
            if(num >= 100) lcd_putc('0' + (num / 100) % 10);
            if(num >= 10) lcd_putc('0' + (num / 10) % 10);
            lcd_putc('0' + num % 10);
            
            _delay_ms(800);
        }
        
        // Test 5: Special characters and symbols
        lcd_clrscr();
        lcd_puts("Special Chars:");
        lcd_gotoxy(0, 1);
        
        // Display some interesting characters from HD44780 character set
        uint8_t special_chars[] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 
                                   0xDF, 0xE4, 0xE5, 0xE6, 0xE7, 0xF7, 0xFF};
        
        for(uint8_t i = 0; i < 15; i++) {
            lcd_putc(special_chars[i]);
            _delay_ms(200);
        }
        _delay_ms(2000);
        
        // Test 6: Temperature display simulation
        lcd_clrscr();
        lcd_puts("Temperature:");
        for(uint8_t temp = 20; temp <= 30; temp++) {
            lcd_gotoxy(0, 1);
            lcd_puts("   "); // Clear number area
            lcd_gotoxy(0, 1);
            
            // Display temperature
            lcd_putc('0' + (temp / 10) % 10);
            lcd_putc('0' + temp % 10);
            lcd_putc(0xDF); // Degree symbol
            lcd_puts("C");
            
            _delay_ms(500);
        }
        
        // Test 7: Progress bar
        lcd_clrscr();
        lcd_puts("Loading...");
        for(uint8_t progress = 0; progress <= 16; progress++) {
            lcd_gotoxy(0, 1);
            
            // Draw progress bar
            for(uint8_t i = 0; i < 16; i++) {
                if(i < progress) {
                    lcd_putc(0xFF); // Full block character
                } else {
                    lcd_putc(' ');
                }
            }
            _delay_ms(300);
        }
        
        lcd_gotoxy(0, 0);
        lcd_puts("Complete!    ");
        _delay_ms(2000);
        
        // Test 8: Blinking display
        lcd_clrscr();
        lcd_puts("ATTENTION!");
        lcd_gotoxy(0, 1);
        lcd_puts("Important Msg");
        
        // Blink the entire display
        for(uint8_t blinks = 0; blinks < 6; blinks++) {
            lcd_command(LCD_DISP_OFF);
            _delay_ms(300);
            lcd_command(LCD_DISP_ON);
            _delay_ms(300);
        }
        
        _delay_ms(1000);
    }
    
    return 0;
}