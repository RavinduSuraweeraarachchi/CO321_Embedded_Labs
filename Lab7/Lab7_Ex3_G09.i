# 1 "Lab7_Ex3_G09.c"
# 1 "/media/ravindu/Documents/University/CO321/Repo/CO321_Embedded_Labs/Lab7//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "Lab7_Ex3_G09.c"
# 37 "Lab7_Ex3_G09.c"
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
# 38 "Lab7_Ex3_G09.c" 2
# 1 "/usr/lib/avr/include/avr/interrupt.h" 1 3
# 39 "Lab7_Ex3_G09.c" 2
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
# 40 "Lab7_Ex3_G09.c" 2
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
# 41 "Lab7_Ex3_G09.c" 2
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
# 42 "Lab7_Ex3_G09.c" 2
# 85 "Lab7_Ex3_G09.c"

# 85 "Lab7_Ex3_G09.c"
void EEPROMwrite(unsigned int address, char data)
{

    while (
# 88 "Lab7_Ex3_G09.c" 3
          (*(volatile uint8_t *)((0x1F) + 0x20)) 
# 88 "Lab7_Ex3_G09.c"
               & (1 << 
# 88 "Lab7_Ex3_G09.c" 3
                       1
# 88 "Lab7_Ex3_G09.c"
                           ));


    
# 91 "Lab7_Ex3_G09.c" 3
   (*(volatile uint8_t *)((0x21) + 0x20)) 
# 91 "Lab7_Ex3_G09.c"
         = address;
    
# 92 "Lab7_Ex3_G09.c" 3
   (*(volatile uint8_t *)((0x22) + 0x20)) 
# 92 "Lab7_Ex3_G09.c"
         = address >> 8;


    
# 95 "Lab7_Ex3_G09.c" 3
   (*(volatile uint8_t *)((0x20) + 0x20)) 
# 95 "Lab7_Ex3_G09.c"
        = data;


    
# 98 "Lab7_Ex3_G09.c" 3
   (*(volatile uint8_t *)((0x1F) + 0x20)) 
# 98 "Lab7_Ex3_G09.c"
        |= (1 << 
# 98 "Lab7_Ex3_G09.c" 3
                 2
# 98 "Lab7_Ex3_G09.c"
                      );



    
# 102 "Lab7_Ex3_G09.c" 3
   (*(volatile uint8_t *)((0x1F) + 0x20)) 
# 102 "Lab7_Ex3_G09.c"
        |= (1 << 
# 102 "Lab7_Ex3_G09.c" 3
                 1
# 102 "Lab7_Ex3_G09.c"
                     );
}
# 127 "Lab7_Ex3_G09.c"
char EEPROMread(unsigned int address)
{

    while (
# 130 "Lab7_Ex3_G09.c" 3
          (*(volatile uint8_t *)((0x1F) + 0x20)) 
# 130 "Lab7_Ex3_G09.c"
               & (1 << 
# 130 "Lab7_Ex3_G09.c" 3
                       1
# 130 "Lab7_Ex3_G09.c"
                           ));


    
# 133 "Lab7_Ex3_G09.c" 3
   (*(volatile uint8_t *)((0x21) + 0x20)) 
# 133 "Lab7_Ex3_G09.c"
         = address;
    
# 134 "Lab7_Ex3_G09.c" 3
   (*(volatile uint8_t *)((0x22) + 0x20)) 
# 134 "Lab7_Ex3_G09.c"
         = address >> 8;


    
# 137 "Lab7_Ex3_G09.c" 3
   (*(volatile uint8_t *)((0x1F) + 0x20)) 
# 137 "Lab7_Ex3_G09.c"
        |= (1 << 
# 137 "Lab7_Ex3_G09.c" 3
                 0
# 137 "Lab7_Ex3_G09.c"
                     );


    return 
# 140 "Lab7_Ex3_G09.c" 3
          (*(volatile uint8_t *)((0x20) + 0x20))
# 140 "Lab7_Ex3_G09.c"
              ;
}
# 154 "Lab7_Ex3_G09.c"
char caesar_cipher(char ch, uint8_t shift)
{

    if (ch >= 'A' && ch <= 'Z')
    {

        ch = ((ch - 'A' + shift) % 26) + 'A';
        return ch;
    }


    else if (ch >= 'a' && ch <= 'z')
    {

        ch = ((ch - 'a' + shift) % 26) + 'a';
        return ch;
    }


    else
    {

        return ch;
    }
}
# 198 "Lab7_Ex3_G09.c"
const char keymap[4][4] = {
    {'1','2','3','A'},
    {'4','5','6','B'},
    {'7','8','9','C'},
    {'*','0','#','D'}
};
# 251 "Lab7_Ex3_G09.c"
void keypad_init(void)
{

    
# 254 "Lab7_Ex3_G09.c" 3
   (*(volatile uint8_t *)((0x0A) + 0x20)) 
# 254 "Lab7_Ex3_G09.c"
            |= (1 << 
# 254 "Lab7_Ex3_G09.c" 3
                     7
# 254 "Lab7_Ex3_G09.c"
                             );
    
# 255 "Lab7_Ex3_G09.c" 3
   (*(volatile uint8_t *)((0x0A) + 0x20)) 
# 255 "Lab7_Ex3_G09.c"
            |= (1 << 
# 255 "Lab7_Ex3_G09.c" 3
                     6
# 255 "Lab7_Ex3_G09.c"
                             );
    
# 256 "Lab7_Ex3_G09.c" 3
   (*(volatile uint8_t *)((0x04) + 0x20)) 
# 256 "Lab7_Ex3_G09.c"
            |= (1 << 
# 256 "Lab7_Ex3_G09.c" 3
                     0
# 256 "Lab7_Ex3_G09.c"
                             );
    
# 257 "Lab7_Ex3_G09.c" 3
   (*(volatile uint8_t *)((0x04) + 0x20)) 
# 257 "Lab7_Ex3_G09.c"
            |= (1 << 
# 257 "Lab7_Ex3_G09.c" 3
                     1
# 257 "Lab7_Ex3_G09.c"
                             );


    
# 260 "Lab7_Ex3_G09.c" 3
   (*(volatile uint8_t *)((0x04) + 0x20)) 
# 260 "Lab7_Ex3_G09.c"
        &= ~((1 << 
# 260 "Lab7_Ex3_G09.c" 3
                   2
# 260 "Lab7_Ex3_G09.c"
                           ) | (1 << 
# 260 "Lab7_Ex3_G09.c" 3
                                     3
# 260 "Lab7_Ex3_G09.c"
                                             ) | (1 << 
# 260 "Lab7_Ex3_G09.c" 3
                                                       4
# 260 "Lab7_Ex3_G09.c"
                                                               ) | (1 << 
# 260 "Lab7_Ex3_G09.c" 3
                                                                         5
# 260 "Lab7_Ex3_G09.c"
                                                                                 ));


    
# 263 "Lab7_Ex3_G09.c" 3
   (*(volatile uint8_t *)((0x05) + 0x20)) 
# 263 "Lab7_Ex3_G09.c"
         |= (1 << 
# 263 "Lab7_Ex3_G09.c" 3
                  2
# 263 "Lab7_Ex3_G09.c"
                          ) | (1 << 
# 263 "Lab7_Ex3_G09.c" 3
                                    3
# 263 "Lab7_Ex3_G09.c"
                                            ) | (1 << 
# 263 "Lab7_Ex3_G09.c" 3
                                                      4
# 263 "Lab7_Ex3_G09.c"
                                                              ) | (1 << 
# 263 "Lab7_Ex3_G09.c" 3
                                                                        5
# 263 "Lab7_Ex3_G09.c"
                                                                                );
}
# 273 "Lab7_Ex3_G09.c"
char keypad_getkey(void)
{
# 284 "Lab7_Ex3_G09.c"
    volatile uint8_t* row_ports[4] = {&
# 284 "Lab7_Ex3_G09.c" 3
                                      (*(volatile uint8_t *)((0x0B) + 0x20))
# 284 "Lab7_Ex3_G09.c"
                                               , &
# 284 "Lab7_Ex3_G09.c" 3
                                                  (*(volatile uint8_t *)((0x0B) + 0x20))
# 284 "Lab7_Ex3_G09.c"
                                                           , &
# 284 "Lab7_Ex3_G09.c" 3
                                                              (*(volatile uint8_t *)((0x05) + 0x20))
# 284 "Lab7_Ex3_G09.c"
                                                                       , &
# 284 "Lab7_Ex3_G09.c" 3
                                                                          (*(volatile uint8_t *)((0x05) + 0x20))
# 284 "Lab7_Ex3_G09.c"
                                                                                   };
    uint8_t row_pins[4] = {
# 285 "Lab7_Ex3_G09.c" 3
                          6
# 285 "Lab7_Ex3_G09.c"
                                  , 
# 285 "Lab7_Ex3_G09.c" 3
                                    7
# 285 "Lab7_Ex3_G09.c"
                                            , 
# 285 "Lab7_Ex3_G09.c" 3
                                              0
# 285 "Lab7_Ex3_G09.c"
                                                      , 
# 285 "Lab7_Ex3_G09.c" 3
                                                        1
# 285 "Lab7_Ex3_G09.c"
                                                                };







    for (uint8_t row = 0; row < 4; row++)
    {

        
# 296 "Lab7_Ex3_G09.c" 3
       (*(volatile uint8_t *)((0x0B) + 0x20)) 
# 296 "Lab7_Ex3_G09.c"
                 |= (1 << 
# 296 "Lab7_Ex3_G09.c" 3
                          7
# 296 "Lab7_Ex3_G09.c"
                                  );
        
# 297 "Lab7_Ex3_G09.c" 3
       (*(volatile uint8_t *)((0x0B) + 0x20)) 
# 297 "Lab7_Ex3_G09.c"
                 |= (1 << 
# 297 "Lab7_Ex3_G09.c" 3
                          6
# 297 "Lab7_Ex3_G09.c"
                                  );
        
# 298 "Lab7_Ex3_G09.c" 3
       (*(volatile uint8_t *)((0x05) + 0x20)) 
# 298 "Lab7_Ex3_G09.c"
                 |= (1 << 
# 298 "Lab7_Ex3_G09.c" 3
                          0
# 298 "Lab7_Ex3_G09.c"
                                  );
        
# 299 "Lab7_Ex3_G09.c" 3
       (*(volatile uint8_t *)((0x05) + 0x20)) 
# 299 "Lab7_Ex3_G09.c"
                 |= (1 << 
# 299 "Lab7_Ex3_G09.c" 3
                          1
# 299 "Lab7_Ex3_G09.c"
                                  );


        *(row_ports[row]) &= ~(1 << row_pins[row]);

        _delay_us(5);





        uint8_t col_val = 
# 310 "Lab7_Ex3_G09.c" 3
                         (*(volatile uint8_t *)((0x03) + 0x20)) 
# 310 "Lab7_Ex3_G09.c"
                              & 0b00111100;



        for (uint8_t col = 0; col < 4; col++)
        {

            if (!(col_val & (1 << (
# 317 "Lab7_Ex3_G09.c" 3
                                  2 
# 317 "Lab7_Ex3_G09.c"
                                           + col))))
            {
                _delay_ms(20);


                while (!(
# 322 "Lab7_Ex3_G09.c" 3
                        (*(volatile uint8_t *)((0x03) + 0x20)) 
# 322 "Lab7_Ex3_G09.c"
                             & (1 << (
# 322 "Lab7_Ex3_G09.c" 3
                                      2 
# 322 "Lab7_Ex3_G09.c"
                                               + col))));

                _delay_ms(50);



                return keymap[row][col];
            }
        }
    }
    return 0;
}
# 357 "Lab7_Ex3_G09.c"
int main(void)
{

    lcd_init(0x0C);


    keypad_init();



    uint8_t secret_key = 3;


    char input_text[11] = {0};
    char encrypted_text[11] = {0};



    EEPROMwrite(0, secret_key);


    char choice;


    while (1)
    {

        secret_key = EEPROMread(0);


        lcd_clrscr();
        lcd_gotoxy(0, 0);
        lcd_puts("A:Encrypt B:Key");
        lcd_gotoxy(0, 1);
        lcd_puts("Current Key: ");
        lcd_putc(secret_key + '0');


        do
        {
            choice = keypad_getkey();
        }
        while (choice != 'A' && choice != 'B');

        if (choice == 'B')
        {

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

            while (keypad_getkey());


            lcd_clrscr();
            lcd_gotoxy(0, 0);
            lcd_puts("Enter Text:");
            lcd_gotoxy(0, 1);



            uint8_t idx = 0;
            while (idx < 10)
            {

                char ch = 0;


                while (!(ch = keypad_getkey()));


                if (ch == '#') break;


                input_text[idx] = ch;


                lcd_putc(ch);


                idx++;
            }


            input_text[idx] = '\0';


            for (uint8_t i = 0; i < idx; i++)
            {

                encrypted_text[i] = caesar_cipher(input_text[i], secret_key);
            }


            encrypted_text[idx] = '\0';


            lcd_clrscr();
            lcd_gotoxy(0, 0);
            lcd_puts("Encrypted:");
            lcd_gotoxy(0, 1);
            lcd_puts(encrypted_text);
            _delay_ms(3000);
        }


        lcd_clrscr();

    }


    return 0;
}
