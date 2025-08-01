# 1 "morse_enc.c"
# 1 "/media/ravindu/Documents/University/CO321/Repo/CO321_Embedded_Labs/Project//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "morse_enc.c"
# 22 "morse_enc.c"
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
# 23 "morse_enc.c" 2
# 1 "/usr/lib/avr/include/avr/interrupt.h" 1 3
# 24 "morse_enc.c" 2
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
# 25 "morse_enc.c" 2
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
# 26 "morse_enc.c" 2
# 1 "/usr/lib/avr/include/util/delay.h" 1 3
# 45 "/usr/lib/avr/include/util/delay.h" 3
# 1 "/usr/lib/avr/include/util/delay_basic.h" 1 3
# 40 "/usr/lib/avr/include/util/delay_basic.h" 3
static __inline__ void _delay_loop_1(uint8_t __count) __attribute__((__always_inline__));
static __inline__ void _delay_loop_2(uint16_t __count) __attribute__((__always_inline__));
# 80 "/usr/lib/avr/include/util/delay_basic.h" 3
void
_delay_loop_1(uint8_t __count)
{
 __asm__ volatile (
  "1: dec %0" "\n\t"
  "brne 1b"
  : "=r" (__count)
  : "0" (__count)
 );
}
# 102 "/usr/lib/avr/include/util/delay_basic.h" 3
void
_delay_loop_2(uint16_t __count)
{
 __asm__ volatile (
  "1: sbiw %0,1" "\n\t"
  "brne 1b"
  : "=w" (__count)
  : "0" (__count)
 );
}
# 46 "/usr/lib/avr/include/util/delay.h" 2 3
# 1 "/usr/lib/avr/include/math.h" 1 3
# 127 "/usr/lib/avr/include/math.h" 3
extern double cos(double __x) __attribute__((__const__));





extern double sin(double __x) __attribute__((__const__));





extern double tan(double __x) __attribute__((__const__));






extern double fabs(double __x) __attribute__((__const__));






extern double fmod(double __x, double __y) __attribute__((__const__));
# 168 "/usr/lib/avr/include/math.h" 3
extern double modf(double __x, double *__iptr);


extern float modff (float __x, float *__iptr);




extern double sqrt(double __x) __attribute__((__const__));


extern float sqrtf (float) __attribute__((__const__));




extern double cbrt(double __x) __attribute__((__const__));
# 195 "/usr/lib/avr/include/math.h" 3
extern double hypot (double __x, double __y) __attribute__((__const__));







extern double square(double __x) __attribute__((__const__));






extern double floor(double __x) __attribute__((__const__));






extern double ceil(double __x) __attribute__((__const__));
# 235 "/usr/lib/avr/include/math.h" 3
extern double frexp(double __x, int *__pexp);







extern double ldexp(double __x, int __exp) __attribute__((__const__));





extern double exp(double __x) __attribute__((__const__));





extern double cosh(double __x) __attribute__((__const__));





extern double sinh(double __x) __attribute__((__const__));





extern double tanh(double __x) __attribute__((__const__));







extern double acos(double __x) __attribute__((__const__));







extern double asin(double __x) __attribute__((__const__));






extern double atan(double __x) __attribute__((__const__));
# 299 "/usr/lib/avr/include/math.h" 3
extern double atan2(double __y, double __x) __attribute__((__const__));





extern double log(double __x) __attribute__((__const__));





extern double log10(double __x) __attribute__((__const__));





extern double pow(double __x, double __y) __attribute__((__const__));






extern int isnan(double __x) __attribute__((__const__));
# 334 "/usr/lib/avr/include/math.h" 3
extern int isinf(double __x) __attribute__((__const__));






__attribute__((__const__)) static inline int isfinite (double __x)
{
    unsigned char __exp;
    __asm__ (
 "mov	%0, %C1		\n\t"
 "lsl	%0		\n\t"
 "mov	%0, %D1		\n\t"
 "rol	%0		"
 : "=r" (__exp)
 : "r" (__x) );
    return __exp != 0xff;
}






__attribute__((__const__)) static inline double copysign (double __x, double __y)
{
    __asm__ (
 "bst	%D2, 7	\n\t"
 "bld	%D0, 7	"
 : "=r" (__x)
 : "0" (__x), "r" (__y) );
    return __x;
}
# 377 "/usr/lib/avr/include/math.h" 3
extern int signbit (double __x) __attribute__((__const__));






extern double fdim (double __x, double __y) __attribute__((__const__));
# 393 "/usr/lib/avr/include/math.h" 3
extern double fma (double __x, double __y, double __z) __attribute__((__const__));







extern double fmax (double __x, double __y) __attribute__((__const__));







extern double fmin (double __x, double __y) __attribute__((__const__));






extern double trunc (double __x) __attribute__((__const__));
# 427 "/usr/lib/avr/include/math.h" 3
extern double round (double __x) __attribute__((__const__));
# 440 "/usr/lib/avr/include/math.h" 3
extern long lround (double __x) __attribute__((__const__));
# 454 "/usr/lib/avr/include/math.h" 3
extern long lrint (double __x) __attribute__((__const__));
# 47 "/usr/lib/avr/include/util/delay.h" 2 3
# 86 "/usr/lib/avr/include/util/delay.h" 3
static __inline__ void _delay_us(double __us) __attribute__((__always_inline__));
static __inline__ void _delay_ms(double __ms) __attribute__((__always_inline__));
# 165 "/usr/lib/avr/include/util/delay.h" 3
void
_delay_ms(double __ms)
{
 double __tmp ;



 uint32_t __ticks_dc;
 extern void __builtin_avr_delay_cycles(unsigned long);
 __tmp = ((
# 174 "/usr/lib/avr/include/util/delay.h"
          16000000UL
# 174 "/usr/lib/avr/include/util/delay.h" 3
               ) / 1e3) * __ms;
# 184 "/usr/lib/avr/include/util/delay.h" 3
  __ticks_dc = (uint32_t)(ceil(fabs(__tmp)));


 __builtin_avr_delay_cycles(__ticks_dc);
# 210 "/usr/lib/avr/include/util/delay.h" 3
}
# 254 "/usr/lib/avr/include/util/delay.h" 3
void
_delay_us(double __us)
{
 double __tmp ;



 uint32_t __ticks_dc;
 extern void __builtin_avr_delay_cycles(unsigned long);
 __tmp = ((
# 263 "/usr/lib/avr/include/util/delay.h"
          16000000UL
# 263 "/usr/lib/avr/include/util/delay.h" 3
               ) / 1e6) * __us;
# 273 "/usr/lib/avr/include/util/delay.h" 3
  __ticks_dc = (uint32_t)(ceil(fabs(__tmp)));


 __builtin_avr_delay_cycles(__ticks_dc);
# 299 "/usr/lib/avr/include/util/delay.h" 3
}
# 27 "morse_enc.c" 2
# 58 "morse_enc.c"

# 58 "morse_enc.c"
void usart_init(void)
{




    
# 64 "morse_enc.c" 3
   (*(volatile uint8_t *)(0xC1)) 
# 64 "morse_enc.c"
          |= (1 << 
# 64 "morse_enc.c" 3
                   3
# 64 "morse_enc.c"
                        );




    
# 69 "morse_enc.c" 3
   (*(volatile uint8_t *)(0xC1)) 
# 69 "morse_enc.c"
          |= (1 << 
# 69 "morse_enc.c" 3
                   4
# 69 "morse_enc.c"
                        );




    
# 74 "morse_enc.c" 3
   (*(volatile uint8_t *)(0xC4)) 
# 74 "morse_enc.c"
          = (uint8_t)((16000000UL/16/9600)-1);
    
# 75 "morse_enc.c" 3
   (*(volatile uint8_t *)(0xC5)) 
# 75 "morse_enc.c"
          = (uint8_t)((16000000UL/16/9600)-1 >> 8);





    
# 81 "morse_enc.c" 3
   (*(volatile uint8_t *)(0xC2)) 
# 81 "morse_enc.c"
          &= ~(1<<
# 81 "morse_enc.c" 3
                  7
# 81 "morse_enc.c"
                         );
    
# 82 "morse_enc.c" 3
   (*(volatile uint8_t *)(0xC2)) 
# 82 "morse_enc.c"
          &= ~(1<<
# 82 "morse_enc.c" 3
                  6
# 82 "morse_enc.c"
                         );




    
# 87 "morse_enc.c" 3
   (*(volatile uint8_t *)(0xC1)) 
# 87 "morse_enc.c"
          &= ~(1 << 
# 87 "morse_enc.c" 3
                    2
# 87 "morse_enc.c"
                          );
    
# 88 "morse_enc.c" 3
   (*(volatile uint8_t *)(0xC2)) 
# 88 "morse_enc.c"
          |= (1 << 
# 88 "morse_enc.c" 3
                   2
# 88 "morse_enc.c"
                         ) | (1 << 
# 88 "morse_enc.c" 3
                                   1
# 88 "morse_enc.c"
                                         );





    
# 94 "morse_enc.c" 3
   (*(volatile uint8_t *)(0xC2)) 
# 94 "morse_enc.c"
          &= ~(1<<
# 94 "morse_enc.c" 3
                  4
# 94 "morse_enc.c"
                       );
    
# 95 "morse_enc.c" 3
   (*(volatile uint8_t *)(0xC2)) 
# 95 "morse_enc.c"
          &= ~(1<<
# 95 "morse_enc.c" 3
                  5
# 95 "morse_enc.c"
                       );



    
# 99 "morse_enc.c" 3
   (*(volatile uint8_t *)(0xC2)) 
# 99 "morse_enc.c"
          &= ~(1 << 
# 99 "morse_enc.c" 3
                    3
# 99 "morse_enc.c"
                         );

}

void usart_send(char send_char)
{


    while (!(
# 107 "morse_enc.c" 3
            (*(volatile uint8_t *)(0xC0)) 
# 107 "morse_enc.c"
                   & (1 << 
# 107 "morse_enc.c" 3
                           5
# 107 "morse_enc.c"
                                )));


    
# 110 "morse_enc.c" 3
   (*(volatile uint8_t *)(0xC6)) 
# 110 "morse_enc.c"
        = send_char;
}

char usart_receive(void)
{

    while (!(
# 116 "morse_enc.c" 3
            (*(volatile uint8_t *)(0xC0)) 
# 116 "morse_enc.c"
                   & (1 << 
# 116 "morse_enc.c" 3
                           7
# 116 "morse_enc.c"
                               )));


    return 
# 119 "morse_enc.c" 3
          (*(volatile uint8_t *)(0xC6))
# 119 "morse_enc.c"
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
# 148 "morse_enc.c"
const char* morseCodeMap[] =
{
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
# 208 "morse_enc.c"
void delay_timer0()
{

    
# 211 "morse_enc.c" 3
   (*(volatile uint8_t *)((0x24) + 0x20)) 
# 211 "morse_enc.c"
          = (1 << 
# 211 "morse_enc.c" 3
                  1
# 211 "morse_enc.c"
                       );
    
# 212 "morse_enc.c" 3
   (*(volatile uint8_t *)((0x25) + 0x20)) 
# 212 "morse_enc.c"
          = 0x00;
# 221 "morse_enc.c"
    
# 221 "morse_enc.c" 3
   (*(volatile uint8_t *)((0x27) + 0x20)) 
# 221 "morse_enc.c"
         = 249;


    
# 224 "morse_enc.c" 3
   (*(volatile uint8_t *)((0x25) + 0x20)) 
# 224 "morse_enc.c"
          = (1 << 
# 224 "morse_enc.c" 3
                  1
# 224 "morse_enc.c"
                      ) | (1 << 
# 224 "morse_enc.c" 3
                                0
# 224 "morse_enc.c"
                                    );


    for (uint16_t i = 0; i < 100; i++)
    {


        
# 231 "morse_enc.c" 3
       (*(volatile uint8_t *)((0x15) + 0x20)) 
# 231 "morse_enc.c"
             |= (1 << 
# 231 "morse_enc.c" 3
                      1
# 231 "morse_enc.c"
                           );


        while ((
# 234 "morse_enc.c" 3
               (*(volatile uint8_t *)((0x15) + 0x20)) 
# 234 "morse_enc.c"
                     & (1 << 
# 234 "morse_enc.c" 3
                             1
# 234 "morse_enc.c"
                                  )) == 0);
    }


    
# 238 "morse_enc.c" 3
   (*(volatile uint8_t *)((0x25) + 0x20)) 
# 238 "morse_enc.c"
          = 0x00;
    
# 239 "morse_enc.c" 3
   (*(volatile uint8_t *)((0x24) + 0x20)) 
# 239 "morse_enc.c"
          = 0x00;
}
# 287 "morse_enc.c"
void delay_100ms_units(uint8_t units)
{
    for (uint8_t i = 0; i < units; i++)
    {
        delay_timer0();
    }
}
# 328 "morse_enc.c"
void start_buzzer_pwm()
{

    
# 331 "morse_enc.c" 3
   (*(volatile uint8_t *)((0x04) + 0x20)) 
# 331 "morse_enc.c"
        |= (1 << 
# 331 "morse_enc.c" 3
                 1
# 331 "morse_enc.c"
                    );


    
# 334 "morse_enc.c" 3
   (*(volatile uint8_t *)(0x80)) 
# 334 "morse_enc.c"
          = (1 << 
# 334 "morse_enc.c" 3
                  6
# 334 "morse_enc.c"
                        );


    
# 337 "morse_enc.c" 3
   (*(volatile uint8_t *)(0x81)) 
# 337 "morse_enc.c"
          = (1 << 
# 337 "morse_enc.c" 3
                  3
# 337 "morse_enc.c"
                       ) | (1 << 
# 337 "morse_enc.c" 3
                                 1
# 337 "morse_enc.c"
                                     ) | (1 << 
# 337 "morse_enc.c" 3
                                               0
# 337 "morse_enc.c"
                                                   );


    
# 340 "morse_enc.c" 3
   (*(volatile uint16_t *)(0x88)) 
# 340 "morse_enc.c"
         = 124;
}





void stop_buzzer_pwm()
{

    
# 350 "morse_enc.c" 3
   (*(volatile uint8_t *)(0x80)) 
# 350 "morse_enc.c"
          = 0x00;
    
# 351 "morse_enc.c" 3
   (*(volatile uint8_t *)(0x81)) 
# 351 "morse_enc.c"
          = 0x00;


    
# 354 "morse_enc.c" 3
   (*(volatile uint8_t *)((0x05) + 0x20)) 
# 354 "morse_enc.c"
               &= ~(1 << 
# 354 "morse_enc.c" 3
                         1
# 354 "morse_enc.c"
                                   );
}
# 370 "morse_enc.c"
void signal_morse(const char* morse_string)
{

    int i = 0;




    while (morse_string[i] != '\0')
    {

        
# 381 "morse_enc.c" 3
       (*(volatile uint8_t *)((0x05) + 0x20)) 
# 381 "morse_enc.c"
                |= (1 << 
# 381 "morse_enc.c" 3
                         5
# 381 "morse_enc.c"
                                );






        uint16_t on_duration_ms = (morse_string[i] == '.') ? 200 : (3 * 200);


        start_buzzer_pwm();



        uint8_t units = on_duration_ms / 100;



        for (uint8_t t = 0; t < units; t++)
        {
            delay_timer0();
        }


        stop_buzzer_pwm();


        
# 408 "morse_enc.c" 3
       (*(volatile uint8_t *)((0x05) + 0x20)) 
# 408 "morse_enc.c"
                &= ~(1 << 
# 408 "morse_enc.c" 3
                          5
# 408 "morse_enc.c"
                                 );






        if (morse_string[i+1] != '\0')
        {
            delay_100ms_units(200 / 100);
        }


        i++;
    }
}






void letter_gap()
{
    delay_100ms_units((3 * 200) / 100);
}







void word_gap()
{
    delay_100ms_units((7 * 200) / 100);
}







const char* get_morse_code(char c)
{

    if (c >= 'A' && c <= 'Z')
    {
        return morseCodeMap[c - 'A'];
    }


    else if (c >= 'a' && c <= 'z')
    {
        return morseCodeMap[c - 'a'];
    }


    else if (c >= '0' && c <= '9')
    {
        return morseCodeMap[26 + (c - '0')];
    }


    else
    {
        return 
# 475 "morse_enc.c" 3 4
              ((void *)0)
# 475 "morse_enc.c"
                  ;
    }
}


int main(void)
{

    
# 483 "morse_enc.c" 3
   (*(volatile uint8_t *)((0x04) + 0x20)) 
# 483 "morse_enc.c"
           |= (1 << 
# 483 "morse_enc.c" 3
                    5
# 483 "morse_enc.c"
                           ) | (1 << 
# 483 "morse_enc.c" 3
                                     2
# 483 "morse_enc.c"
                                                   ) | (1 << 
# 483 "morse_enc.c" 3
                                                             3
# 483 "morse_enc.c"
                                                                         ) | (1 << 
# 483 "morse_enc.c" 3
                                                                                   4
# 483 "morse_enc.c"
                                                                                               );
    
# 484 "morse_enc.c" 3
   (*(volatile uint8_t *)((0x04) + 0x20)) 
# 484 "morse_enc.c"
              |= (1 << 
# 484 "morse_enc.c" 3
                       1
# 484 "morse_enc.c"
                                 );


    
# 487 "morse_enc.c" 3
   (*(volatile uint8_t *)((0x05) + 0x20)) 
# 487 "morse_enc.c"
            &= ~(1 << 
# 487 "morse_enc.c" 3
                      5
# 487 "morse_enc.c"
                             );
    
# 488 "morse_enc.c" 3
   (*(volatile uint8_t *)((0x05) + 0x20)) 
# 488 "morse_enc.c"
            &= ~(1 << 
# 488 "morse_enc.c" 3
                      2
# 488 "morse_enc.c"
                                    );
    
# 489 "morse_enc.c" 3
   (*(volatile uint8_t *)((0x05) + 0x20)) 
# 489 "morse_enc.c"
            &= ~(1 << 
# 489 "morse_enc.c" 3
                      3
# 489 "morse_enc.c"
                                  );
    
# 490 "morse_enc.c" 3
   (*(volatile uint8_t *)((0x05) + 0x20)) 
# 490 "morse_enc.c"
            &= ~(1 << 
# 490 "morse_enc.c" 3
                      4
# 490 "morse_enc.c"
                                  );
    
# 491 "morse_enc.c" 3
   (*(volatile uint8_t *)((0x05) + 0x20)) 
# 491 "morse_enc.c"
               &= ~(1 << 
# 491 "morse_enc.c" 3
                         1
# 491 "morse_enc.c"
                                   );


    usart_init();


    lcd_init(0x0C);
    lcd_clrscr();
    lcd_puts("Morse Encoder");
    uint8_t lcd_col = 0;



    char buffer[128];


    uint8_t buf_idx = 0;
# 526 "morse_enc.c"
    while (1)
    {

        char c = usart_receive();


        usart_send(c);


        if (c == '\n' || c == '\r')
        {

            buffer[buf_idx] = '\0';


            uint8_t i = 0;


            lcd_col = 0;


            lcd_clrscr();


            while (buffer[i] != '\0')
            {


                if (buffer[i] == ' ')
                {

                    
# 557 "morse_enc.c" 3
                   (*(volatile uint8_t *)((0x05) + 0x20)) 
# 557 "morse_enc.c"
                            |= (1 << 
# 557 "morse_enc.c" 3
                                     3
# 557 "morse_enc.c"
                                                 );


                    word_gap();


                    
# 563 "morse_enc.c" 3
                   (*(volatile uint8_t *)((0x05) + 0x20)) 
# 563 "morse_enc.c"
                            &= ~(1 << 
# 563 "morse_enc.c" 3
                                      3
# 563 "morse_enc.c"
                                                  );


                    lcd_putc(' ');


                    lcd_col++;
                }

                else
                {





                    const char* morse = get_morse_code(buffer[i]);


                    if (morse != 
# 582 "morse_enc.c" 3 4
                                ((void *)0)
# 582 "morse_enc.c"
                                    )
                    {


                        signal_morse(morse);


                        
# 589 "morse_enc.c" 3
                       (*(volatile uint8_t *)((0x05) + 0x20)) 
# 589 "morse_enc.c"
                                |= (1 << 
# 589 "morse_enc.c" 3
                                         2
# 589 "morse_enc.c"
                                                       );


                        delay_100ms_units(2);


                        
# 595 "morse_enc.c" 3
                       (*(volatile uint8_t *)((0x05) + 0x20)) 
# 595 "morse_enc.c"
                                &= ~(1 << 
# 595 "morse_enc.c" 3
                                          2
# 595 "morse_enc.c"
                                                        );


                        letter_gap();


                        lcd_clrscr();






                        const char* morse_str = morse;



                        for (uint8_t m = 0; morse_str[m] != '\0'; m++)
                        {

                            lcd_putc(morse_str[m]);
                        }


                        lcd_putc(' ');


                        lcd_putc(buffer[i]);
                    }
                }


                i++;
            }


            lcd_clrscr();
            lcd_puts("end of sentence");


            
# 635 "morse_enc.c" 3
           (*(volatile uint8_t *)((0x05) + 0x20)) 
# 635 "morse_enc.c"
                    |= (1 << 
# 635 "morse_enc.c" 3
                             4
# 635 "morse_enc.c"
                                         );


            delay_100ms_units(10);


            
# 641 "morse_enc.c" 3
           (*(volatile uint8_t *)((0x05) + 0x20)) 
# 641 "morse_enc.c"
                    &= ~(1 << 
# 641 "morse_enc.c" 3
                              4
# 641 "morse_enc.c"
                                          );


            buf_idx = 0;
        }





        else
        {



            if (buf_idx < 128 - 1 && (c >= 32 && c <= 126))
            {

                buffer[buf_idx++] = c;
            }
        }
    }

    return 0;
}
