source=main
freq=16000000
port=/dev/ttyUSB0
programmer=stk500
arch=m16
arch_gcc=atmega16
cflags=-Wall -Os -Werror -Wextra -Wdouble-promotion -Wformat=2 -Wformat-overflow -Wformat-truncation -Wundef -fno-common -fstack-usage -Wconversion -ffunction-sections -ffast-math
cflags_testing=-Wall -Os -Werror -Wextra -Wdouble-promotion -Wformat=2 -Wformat-overflow -Wformat-truncation -Wundef -Wconversion

build:
	avr-gcc -mmcu=$(arch_gcc) $(source).c -o $(source).o -DF_CPU=$(freq) $(cflags)
	avr-objcopy -j .text -j .data -O ihex  $(source).o  $(source).hex
	avr-strip $(source).hex -s

build-testing:
	avr-gcc -mmcu=$(arch_gcc) $(source).c -o $(source).o -DF_CPU=$(freq) $(cflags_testing)
	avr-objcopy -j .text -j .data -O ihex  $(source).o  $(source).hex

upload:
	avrdude -c $(programmer) -P $(port) -p $(arch) -u -U flash:w:$(source).hex

disasm:
	avr-objdump -S $(source).o
