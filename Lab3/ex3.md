# CO321 Embedded Systems Lab 3 - Exercise 3
## Exercise 3: Finding Highest Possible Time Interval using TIMER0
## Group 9

**Calculations**

XTAL = 16 MHz

To obtain the highest possible time interval using TIMER0, we need to choose the prescaler with the highest value. The prescaler values for TIMER0 are 1, 8, 64, 256, and 1024.
The highest prescaler value is 1024.

i.e. 1 Clock cycle = 1 / XTAL = 1 / 16 MHz = 62.5 ns

Period of Counter Clock = 1024 * 62.5 ns = 64000 ns = 64 us

Since TIMER0 is an 8-bit timer, it can count from 0 to 255. Therefore, the maximum count value is 256.

i.e. Maximum time interval = 256 * 64 us = 16384 us = 16.384 ms
