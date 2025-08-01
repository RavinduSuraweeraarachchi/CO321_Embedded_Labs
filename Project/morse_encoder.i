# 1 "morse_encoder.c"
# 1 "/media/ravindu/Documents/University/CO321/Repo/CO321_Embedded_Labs/Project//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "morse_encoder.c"
# 19 "morse_encoder.c"
# 1 "/usr/lib/avr/include/avr/io.h" 1 3
# 99 "/usr/lib/avr/include/avr/io.h" 3
# 1 "/usr/lib/avr/include/avr/sfr_defs.h" 1 3
# 126 "/usr/lib/avr/include/avr/sfr_defs.h" 3
# 1 "/usr/lib/avr/include/inttypes.h" 1 3
# 37 "/usr/lib/avr/include/inttypes.h" 3
# 1 "/usr/lib/gcc/avr/7.3.0/include/stdint.h" 1 3 4
# 9 "/usr/lib/gcc/avr/7.3.0/include/stdint.h" 3 4
# 1 "/usr/lib/avr/include/stdint.h" 1 3 4
# 125 "/usr/lib/avr/include/stdint.h" 3 4

# 125 "/usr/lib/avr/include/stdint.h" 3 4
typedef signed int int8_t __attribute__((__mode__(__QI__)));
typedef unsigned int uint8_t __attribute__((__mode__(__QI__)));
typedef signed int int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int uint16_t __attribute__ ((__mode__ (__HI__)));
typedef signed int int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int uint32_t __attribute__ ((__mode__ (__SI__)));

typedef signed int int64_t __attribute__((__mode__(__DI__)));
typedef unsigned int uint64_t __attribute__((__mode__(__DI__)));
# 146 "/usr/lib/avr/include/stdint.h" 3 4
typedef int16_t intptr_t;




typedef uint16_t uintptr_t;
# 163 "/usr/lib/avr/include/stdint.h" 3 4
typedef int8_t int_least8_t;




typedef uint8_t uint_least8_t;




typedef int16_t int_least16_t;




typedef uint16_t uint_least16_t;




typedef int32_t int_least32_t;




typedef uint32_t uint_least32_t;







typedef int64_t int_least64_t;






typedef uint64_t uint_least64_t;
# 217 "/usr/lib/avr/include/stdint.h" 3 4
typedef int8_t int_fast8_t;




typedef uint8_t uint_fast8_t;




typedef int16_t int_fast16_t;




typedef uint16_t uint_fast16_t;




typedef int32_t int_fast32_t;




typedef uint32_t uint_fast32_t;







typedef int64_t int_fast64_t;






typedef uint64_t uint_fast64_t;
# 277 "/usr/lib/avr/include/stdint.h" 3 4
typedef int64_t intmax_t;




typedef uint64_t uintmax_t;
# 10 "/usr/lib/gcc/avr/7.3.0/include/stdint.h" 2 3 4
# 38 "/usr/lib/avr/include/inttypes.h" 2 3
# 77 "/usr/lib/avr/include/inttypes.h" 3
typedef int32_t int_farptr_t;



typedef uint32_t uint_farptr_t;
# 127 "/usr/lib/avr/include/avr/sfr_defs.h" 2 3
# 100 "/usr/lib/avr/include/avr/io.h" 2 3
# 272 "/usr/lib/avr/include/avr/io.h" 3
# 1 "/usr/lib/avr/include/avr/iom328p.h" 1 3
# 273 "/usr/lib/avr/include/avr/io.h" 2 3
# 627 "/usr/lib/avr/include/avr/io.h" 3
# 1 "/usr/lib/avr/include/avr/portpins.h" 1 3
# 628 "/usr/lib/avr/include/avr/io.h" 2 3

# 1 "/usr/lib/avr/include/avr/common.h" 1 3
# 630 "/usr/lib/avr/include/avr/io.h" 2 3

# 1 "/usr/lib/avr/include/avr/version.h" 1 3
# 632 "/usr/lib/avr/include/avr/io.h" 2 3






# 1 "/usr/lib/avr/include/avr/fuse.h" 1 3
# 239 "/usr/lib/avr/include/avr/fuse.h" 3
typedef struct
{
    unsigned char low;
    unsigned char high;
    unsigned char extended;
} __fuse_t;
# 639 "/usr/lib/avr/include/avr/io.h" 2 3


# 1 "/usr/lib/avr/include/avr/lock.h" 1 3
# 642 "/usr/lib/avr/include/avr/io.h" 2 3
# 20 "morse_encoder.c" 2
# 1 "/usr/lib/avr/include/avr/interrupt.h" 1 3
# 21 "morse_encoder.c" 2
# 1 "lcd.h" 1
# 46 "lcd.h"
# 1 "/usr/lib/avr/include/avr/pgmspace.h" 1 3
# 89 "/usr/lib/avr/include/avr/pgmspace.h" 3
# 1 "/usr/lib/gcc/avr/7.3.0/include/stddef.h" 1 3 4
# 216 "/usr/lib/gcc/avr/7.3.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 90 "/usr/lib/avr/include/avr/pgmspace.h" 2 3
# 1158 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern const void * memchr_P(const void *, int __val, size_t __len) __attribute__((__const__));
# 1172 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern int memcmp_P(const void *, const void *, size_t) __attribute__((__pure__));






extern void *memccpy_P(void *, const void *, int __val, size_t);
# 1188 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern void *memcpy_P(void *, const void *, size_t);






extern void *memmem_P(const void *, size_t, const void *, size_t) __attribute__((__pure__));
# 1207 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern const void * memrchr_P(const void *, int __val, size_t __len) __attribute__((__const__));
# 1217 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern char *strcat_P(char *, const char *);
# 1233 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern const char * strchr_P(const char *, int __val) __attribute__((__const__));
# 1245 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern const char * strchrnul_P(const char *, int __val) __attribute__((__const__));
# 1258 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern int strcmp_P(const char *, const char *) __attribute__((__pure__));
# 1268 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern char *strcpy_P(char *, const char *);
# 1285 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern int strcasecmp_P(const char *, const char *) __attribute__((__pure__));






extern char *strcasestr_P(const char *, const char *) __attribute__((__pure__));
# 1305 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern size_t strcspn_P(const char *__s, const char * __reject) __attribute__((__pure__));
# 1321 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern size_t strlcat_P (char *, const char *, size_t );
# 1334 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern size_t strlcpy_P (char *, const char *, size_t );
# 1346 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern size_t strnlen_P(const char *, size_t) __attribute__((__const__));
# 1357 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern int strncmp_P(const char *, const char *, size_t) __attribute__((__pure__));
# 1376 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern int strncasecmp_P(const char *, const char *, size_t) __attribute__((__pure__));
# 1387 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern char *strncat_P(char *, const char *, size_t);
# 1401 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern char *strncpy_P(char *, const char *, size_t);
# 1416 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern char *strpbrk_P(const char *__s, const char * __accept) __attribute__((__pure__));
# 1427 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern const char * strrchr_P(const char *, int __val) __attribute__((__const__));
# 1447 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern char *strsep_P(char **__sp, const char * __delim);
# 1460 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern size_t strspn_P(const char *__s, const char * __accept) __attribute__((__pure__));
# 1474 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern char *strstr_P(const char *, const char *) __attribute__((__pure__));
# 1496 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern char *strtok_P(char *__s, const char * __delim);
# 1516 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern char *strtok_rP(char *__s, const char * __delim, char **__last);
# 1529 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern size_t strlen_PF(uint_farptr_t src) __attribute__((__const__));
# 1545 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern size_t strnlen_PF(uint_farptr_t src, size_t len) __attribute__((__const__));
# 1560 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern void *memcpy_PF(void *dest, uint_farptr_t src, size_t len);
# 1575 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern char *strcpy_PF(char *dest, uint_farptr_t src);
# 1595 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern char *strncpy_PF(char *dest, uint_farptr_t src, size_t len);
# 1611 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern char *strcat_PF(char *dest, uint_farptr_t src);
# 1632 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern size_t strlcat_PF(char *dst, uint_farptr_t src, size_t siz);
# 1649 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern char *strncat_PF(char *dest, uint_farptr_t src, size_t len);
# 1665 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern int strcmp_PF(const char *s1, uint_farptr_t s2) __attribute__((__pure__));
# 1682 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern int strncmp_PF(const char *s1, uint_farptr_t s2, size_t n) __attribute__((__pure__));
# 1698 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern int strcasecmp_PF(const char *s1, uint_farptr_t s2) __attribute__((__pure__));
# 1716 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern int strncasecmp_PF(const char *s1, uint_farptr_t s2, size_t n) __attribute__((__pure__));
# 1732 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern char *strstr_PF(const char *s1, uint_farptr_t s2);
# 1744 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern size_t strlcpy_PF(char *dst, uint_farptr_t src, size_t siz);
# 1760 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern int memcmp_PF(const void *, uint_farptr_t, size_t) __attribute__((__pure__));
# 1779 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern size_t __strlen_P(const char *) __attribute__((__const__));
__attribute__((__always_inline__)) static __inline__ size_t strlen_P(const char * s);
static __inline__ size_t strlen_P(const char *s) {
  return __builtin_constant_p(__builtin_strlen(s))
     ? __builtin_strlen(s) : __strlen_P(s);
}
# 47 "lcd.h" 2
# 297 "lcd.h"

# 297 "lcd.h"
extern void lcd_init(uint8_t dispAttr);






extern void lcd_clrscr(void);






extern void lcd_home(void);
# 321 "lcd.h"
extern void lcd_gotoxy(uint8_t x, uint8_t y);







extern void lcd_putc(char c);







extern void lcd_puts(const char *s);
# 346 "lcd.h"
extern void lcd_puts_p(const char *progmem_s);







extern void lcd_command(uint8_t cmd);
# 364 "lcd.h"
extern void lcd_data(uint8_t data);
# 22 "morse_encoder.c" 2
# 1 "/usr/lib/avr/include/string.h" 1 3
# 46 "/usr/lib/avr/include/string.h" 3
# 1 "/usr/lib/gcc/avr/7.3.0/include/stddef.h" 1 3 4
# 47 "/usr/lib/avr/include/string.h" 2 3
# 125 "/usr/lib/avr/include/string.h" 3

# 125 "/usr/lib/avr/include/string.h" 3
extern int ffs(int __val) __attribute__((__const__));





extern int ffsl(long __val) __attribute__((__const__));





__extension__ extern int ffsll(long long __val) __attribute__((__const__));
# 150 "/usr/lib/avr/include/string.h" 3
extern void *memccpy(void *, const void *, int, size_t);
# 162 "/usr/lib/avr/include/string.h" 3
extern void *memchr(const void *, int, size_t) __attribute__((__pure__));
# 180 "/usr/lib/avr/include/string.h" 3
extern int memcmp(const void *, const void *, size_t) __attribute__((__pure__));
# 191 "/usr/lib/avr/include/string.h" 3
extern void *memcpy(void *, const void *, size_t);
# 203 "/usr/lib/avr/include/string.h" 3
extern void *memmem(const void *, size_t, const void *, size_t) __attribute__((__pure__));
# 213 "/usr/lib/avr/include/string.h" 3
extern void *memmove(void *, const void *, size_t);
# 225 "/usr/lib/avr/include/string.h" 3
extern void *memrchr(const void *, int, size_t) __attribute__((__pure__));
# 235 "/usr/lib/avr/include/string.h" 3
extern void *memset(void *, int, size_t);
# 248 "/usr/lib/avr/include/string.h" 3
extern char *strcat(char *, const char *);
# 262 "/usr/lib/avr/include/string.h" 3
extern char *strchr(const char *, int) __attribute__((__pure__));
# 274 "/usr/lib/avr/include/string.h" 3
extern char *strchrnul(const char *, int) __attribute__((__pure__));
# 287 "/usr/lib/avr/include/string.h" 3
extern int strcmp(const char *, const char *) __attribute__((__pure__));
# 305 "/usr/lib/avr/include/string.h" 3
extern char *strcpy(char *, const char *);
# 320 "/usr/lib/avr/include/string.h" 3
extern int strcasecmp(const char *, const char *) __attribute__((__pure__));
# 333 "/usr/lib/avr/include/string.h" 3
extern char *strcasestr(const char *, const char *) __attribute__((__pure__));
# 344 "/usr/lib/avr/include/string.h" 3
extern size_t strcspn(const char *__s, const char *__reject) __attribute__((__pure__));
# 364 "/usr/lib/avr/include/string.h" 3
extern char *strdup(const char *s1);
# 377 "/usr/lib/avr/include/string.h" 3
extern size_t strlcat(char *, const char *, size_t);
# 388 "/usr/lib/avr/include/string.h" 3
extern size_t strlcpy(char *, const char *, size_t);
# 399 "/usr/lib/avr/include/string.h" 3
extern size_t strlen(const char *) __attribute__((__pure__));
# 411 "/usr/lib/avr/include/string.h" 3
extern char *strlwr(char *);
# 422 "/usr/lib/avr/include/string.h" 3
extern char *strncat(char *, const char *, size_t);
# 434 "/usr/lib/avr/include/string.h" 3
extern int strncmp(const char *, const char *, size_t) __attribute__((__pure__));
# 449 "/usr/lib/avr/include/string.h" 3
extern char *strncpy(char *, const char *, size_t);
# 464 "/usr/lib/avr/include/string.h" 3
extern int strncasecmp(const char *, const char *, size_t) __attribute__((__pure__));
# 478 "/usr/lib/avr/include/string.h" 3
extern size_t strnlen(const char *, size_t) __attribute__((__pure__));
# 491 "/usr/lib/avr/include/string.h" 3
extern char *strpbrk(const char *__s, const char *__accept) __attribute__((__pure__));
# 505 "/usr/lib/avr/include/string.h" 3
extern char *strrchr(const char *, int) __attribute__((__pure__));
# 515 "/usr/lib/avr/include/string.h" 3
extern char *strrev(char *);
# 533 "/usr/lib/avr/include/string.h" 3
extern char *strsep(char **, const char *);
# 544 "/usr/lib/avr/include/string.h" 3
extern size_t strspn(const char *__s, const char *__accept) __attribute__((__pure__));
# 557 "/usr/lib/avr/include/string.h" 3
extern char *strstr(const char *, const char *) __attribute__((__pure__));
# 576 "/usr/lib/avr/include/string.h" 3
extern char *strtok(char *, const char *);
# 593 "/usr/lib/avr/include/string.h" 3
extern char *strtok_r(char *, const char *, char **);
# 606 "/usr/lib/avr/include/string.h" 3
extern char *strupr(char *);



extern int strcoll(const char *s1, const char *s2);
extern char *strerror(int errnum);
extern size_t strxfrm(char *dest, const char *src, size_t n);
# 23 "morse_encoder.c" 2
# 54 "morse_encoder.c"

# 54 "morse_encoder.c"
void usart_init(void)
{




    
# 60 "morse_encoder.c" 3
   (*(volatile uint8_t *)(0xC1)) 
# 60 "morse_encoder.c"
          |= (1 << 
# 60 "morse_encoder.c" 3
                   3
# 60 "morse_encoder.c"
                        );




    
# 65 "morse_encoder.c" 3
   (*(volatile uint8_t *)(0xC1)) 
# 65 "morse_encoder.c"
          |= (1 << 
# 65 "morse_encoder.c" 3
                   4
# 65 "morse_encoder.c"
                        );




    
# 70 "morse_encoder.c" 3
   (*(volatile uint8_t *)(0xC4)) 
# 70 "morse_encoder.c"
          = (uint8_t)((16000000UL/16/9600)-1);
    
# 71 "morse_encoder.c" 3
   (*(volatile uint8_t *)(0xC5)) 
# 71 "morse_encoder.c"
          = (uint8_t)(((16000000UL/16/9600)-1) >> 8);





    
# 77 "morse_encoder.c" 3
   (*(volatile uint8_t *)(0xC2)) 
# 77 "morse_encoder.c"
          &= ~(1<<
# 77 "morse_encoder.c" 3
                  7
# 77 "morse_encoder.c"
                         );
    
# 78 "morse_encoder.c" 3
   (*(volatile uint8_t *)(0xC2)) 
# 78 "morse_encoder.c"
          &= ~(1<<
# 78 "morse_encoder.c" 3
                  6
# 78 "morse_encoder.c"
                         );




    
# 83 "morse_encoder.c" 3
   (*(volatile uint8_t *)(0xC1)) 
# 83 "morse_encoder.c"
          &= ~(1 << 
# 83 "morse_encoder.c" 3
                    2
# 83 "morse_encoder.c"
                          );
    
# 84 "morse_encoder.c" 3
   (*(volatile uint8_t *)(0xC2)) 
# 84 "morse_encoder.c"
          |= (1 << 
# 84 "morse_encoder.c" 3
                   2
# 84 "morse_encoder.c"
                         ) | (1 << 
# 84 "morse_encoder.c" 3
                                   1
# 84 "morse_encoder.c"
                                         );





    
# 90 "morse_encoder.c" 3
   (*(volatile uint8_t *)(0xC2)) 
# 90 "morse_encoder.c"
          &= ~(1<<
# 90 "morse_encoder.c" 3
                  4
# 90 "morse_encoder.c"
                       );
    
# 91 "morse_encoder.c" 3
   (*(volatile uint8_t *)(0xC2)) 
# 91 "morse_encoder.c"
          &= ~(1<<
# 91 "morse_encoder.c" 3
                  5
# 91 "morse_encoder.c"
                       );



    
# 95 "morse_encoder.c" 3
   (*(volatile uint8_t *)(0xC2)) 
# 95 "morse_encoder.c"
          &= ~(1 << 
# 95 "morse_encoder.c" 3
                    3
# 95 "morse_encoder.c"
                         );

}

void usart_send(char send_char)
{


    while (!(
# 103 "morse_encoder.c" 3
            (*(volatile uint8_t *)(0xC0)) 
# 103 "morse_encoder.c"
                   & (1 << 
# 103 "morse_encoder.c" 3
                           5
# 103 "morse_encoder.c"
                                )));


    
# 106 "morse_encoder.c" 3
   (*(volatile uint8_t *)(0xC6)) 
# 106 "morse_encoder.c"
        = send_char;
}

char usart_receive(void)
{

    while (!(
# 112 "morse_encoder.c" 3
            (*(volatile uint8_t *)(0xC0)) 
# 112 "morse_encoder.c"
                   & (1 << 
# 112 "morse_encoder.c" 3
                           7
# 112 "morse_encoder.c"
                               )));


    return 
# 115 "morse_encoder.c" 3
          (*(volatile uint8_t *)(0xC6))
# 115 "morse_encoder.c"
              ;
}


void usart_send_string(char* str)
{
    while (*str != '\0')
    {
        usart_send(*str);
        str++;
    }
}






const char* morseCodeMap[] = {
    ".-",
    "-...",
    "-.-.",
    "-..",
    ".",
    "..-.",
    "--.",
    "....",
    "..",
    ".---",
    "-.-",
    ".-..",
    "--",
    "-.",
    "---",
    ".--.",
    "--.-",
    ".-.",
    "...",
    "-",
    "..-",
    "...-",
    ".--",
    "-..-",
    "-.--",
    "--..",
    "-----",
    ".----",
    "..---",
    "...--",
    "....-",
    ".....",
    "-....",
    "--...",
    "---..",
    "----."
};
# 199 "morse_encoder.c"
void delay_timer(void)
{

    
# 202 "morse_encoder.c" 3
   (*(volatile uint8_t *)(0x80)) 
# 202 "morse_encoder.c"
          = 0x00;
    
# 203 "morse_encoder.c" 3
   (*(volatile uint8_t *)(0x81)) 
# 203 "morse_encoder.c"
          = (1 << 
# 203 "morse_encoder.c" 3
                  3
# 203 "morse_encoder.c"
                       );





    
# 209 "morse_encoder.c" 3
   (*(volatile uint16_t *)(0x88)) 
# 209 "morse_encoder.c"
         = 24999;


    
# 212 "morse_encoder.c" 3
   (*(volatile uint8_t *)(0x81)) 
# 212 "morse_encoder.c"
          |= (1 << 
# 212 "morse_encoder.c" 3
                   1
# 212 "morse_encoder.c"
                       ) | (1 << 
# 212 "morse_encoder.c" 3
                                 0
# 212 "morse_encoder.c"
                                     );


    
# 215 "morse_encoder.c" 3
   (*(volatile uint8_t *)((0x16) + 0x20)) 
# 215 "morse_encoder.c"
         |= (1 << 
# 215 "morse_encoder.c" 3
                  1
# 215 "morse_encoder.c"
                       );


    while ((
# 218 "morse_encoder.c" 3
           (*(volatile uint8_t *)((0x16) + 0x20)) 
# 218 "morse_encoder.c"
                 & (1 << 
# 218 "morse_encoder.c" 3
                         1
# 218 "morse_encoder.c"
                              )) == 0);


    
# 221 "morse_encoder.c" 3
   (*(volatile uint8_t *)(0x81)) 
# 221 "morse_encoder.c"
          = 0x00;

    
# 223 "morse_encoder.c" 3
   (*(volatile uint8_t *)((0x16) + 0x20)) 
# 223 "morse_encoder.c"
         |= (1 << 
# 223 "morse_encoder.c" 3
                  1
# 223 "morse_encoder.c"
                       );
}
# 257 "morse_encoder.c"
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
    { 
# 271 "morse_encoder.c" 3 4
     ((void *)0)
# 271 "morse_encoder.c"
         , 0 }
};


char decode_morse(const char* code) {
    for (int i = 0; morseDecodeTable[i].code != 
# 276 "morse_encoder.c" 3 4
                                               ((void *)0)
# 276 "morse_encoder.c"
                                                   ; i++) {
        if (strcmp(morseDecodeTable[i].code, code) == 0) return morseDecodeTable[i].letter;
    }
    return '?';
}


uint8_t is_AR(const char* code) {
    return strcmp(code, ".-.-.") == 0;
}


void delay_ms(uint16_t ms) {
    while (ms--) {
        for (volatile uint16_t d = 0; d < (16000000UL / 1000 / 8); d++) { asm volatile ("nop"); }
    }
}

int main(void) {

    
# 296 "morse_encoder.c" 3
   (*(volatile uint8_t *)((0x04) + 0x20)) 
# 296 "morse_encoder.c"
           |= (1 << 
# 296 "morse_encoder.c" 3
                    5
# 296 "morse_encoder.c"
                           );
    
# 297 "morse_encoder.c" 3
   (*(volatile uint8_t *)((0x04) + 0x20)) 
# 297 "morse_encoder.c"
              |= (1 << 
# 297 "morse_encoder.c" 3
                       1
# 297 "morse_encoder.c"
                                 );

    
# 299 "morse_encoder.c" 3
   (*(volatile uint8_t *)((0x0A) + 0x20)) 
# 299 "morse_encoder.c"
              &= ~(1 << 
# 299 "morse_encoder.c" 3
                        7
# 299 "morse_encoder.c"
                                  );
    
# 300 "morse_encoder.c" 3
   (*(volatile uint8_t *)((0x0B) + 0x20)) 
# 300 "morse_encoder.c"
               |= (1 << 
# 300 "morse_encoder.c" 3
                        7
# 300 "morse_encoder.c"
                                  );


    lcd_init(0x0C);
    lcd_clrscr();
    lcd_gotoxy(0,0);
    lcd_puts("Morse Decoder");

    char morse_buf[8 +1] = {0};
    char msg_buf[32 +1] = {0};
    uint8_t morse_idx = 0, msg_idx = 0;
    uint8_t last_btn = 1, btn;
    uint32_t press_time = 0, gap_time = 0;


    const uint16_t DOT_THRESH = 200;
    const uint16_t LETTER_GAP = 600;
    const uint16_t WORD_GAP = 1400;


    while (1) {
        btn = (
# 321 "morse_encoder.c" 3
              (*(volatile uint8_t *)((0x09) + 0x20)) 
# 321 "morse_encoder.c"
                            & (1 << 
# 321 "morse_encoder.c" 3
                                    7
# 321 "morse_encoder.c"
                                              )) ? 1 : 0;
        if (!btn && last_btn) {

            
# 324 "morse_encoder.c" 3
           (*(volatile uint8_t *)((0x05) + 0x20)) 
# 324 "morse_encoder.c"
                    |= (1 << 
# 324 "morse_encoder.c" 3
                             5
# 324 "morse_encoder.c"
                                    );
            
# 325 "morse_encoder.c" 3
           (*(volatile uint8_t *)((0x05) + 0x20)) 
# 325 "morse_encoder.c"
                       |= (1 << 
# 325 "morse_encoder.c" 3
                                1
# 325 "morse_encoder.c"
                                          );

            uint16_t t = 0;
            while (!(
# 328 "morse_encoder.c" 3
                    (*(volatile uint8_t *)((0x09) + 0x20)) 
# 328 "morse_encoder.c"
                                  & (1 << 
# 328 "morse_encoder.c" 3
                                          7
# 328 "morse_encoder.c"
                                                    ))) {
                delay_ms(1);
                t++;
            }
            press_time = t;

            
# 334 "morse_encoder.c" 3
           (*(volatile uint8_t *)((0x05) + 0x20)) 
# 334 "morse_encoder.c"
                    &= ~(1 << 
# 334 "morse_encoder.c" 3
                              5
# 334 "morse_encoder.c"
                                     );
            
# 335 "morse_encoder.c" 3
           (*(volatile uint8_t *)((0x05) + 0x20)) 
# 335 "morse_encoder.c"
                       &= ~(1 << 
# 335 "morse_encoder.c" 3
                                 1
# 335 "morse_encoder.c"
                                           );


            if (press_time < DOT_THRESH) {
                morse_buf[morse_idx++] = '.';
            } else {
                morse_buf[morse_idx++] = '-';
            }
            morse_buf[morse_idx] = '\0';
            gap_time = 0;
        } else if (btn && !last_btn) {

            gap_time = 0;
            while ((
# 348 "morse_encoder.c" 3
                   (*(volatile uint8_t *)((0x09) + 0x20)) 
# 348 "morse_encoder.c"
                                 & (1 << 
# 348 "morse_encoder.c" 3
                                         7
# 348 "morse_encoder.c"
                                                   )) && gap_time < WORD_GAP) {
                delay_ms(1);
                gap_time++;
                if (!(
# 351 "morse_encoder.c" 3
                     (*(volatile uint8_t *)((0x09) + 0x20)) 
# 351 "morse_encoder.c"
                                   & (1 << 
# 351 "morse_encoder.c" 3
                                           7
# 351 "morse_encoder.c"
                                                     ))) break;
            }

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
