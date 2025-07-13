#!/bin/bash

# Check if filename argument is provided
if [ $# -eq 0 ]; then
    echo "Error: Please provide the filename (without extension) as an argument"
    echo "Usage: $0 filename"
    exit 1
fi

FILENAME=$1

# Run the compilation commands
# avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -o "$FILENAME" "$FILENAME.c" || exit 1
# avr-objcopy -O ihex -R .eeprom "$FILENAME" "$FILENAME.hex" || exit 1
avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:"$FILENAME.hex" || exit 1

echo "Flashing completed successfully!"