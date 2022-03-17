# project name
PRJ = main
# avr mcu
MCU = atmega16
# mcu clock frequency
CLK = 16000000
# avr programmer (and port if necessary)
PRG = stk500
# programmer port
COM = /dev/ttyUSB
# see http://www.engbedded.com/fusecalc/
LFU = 0x80
HFU = 0x99
# program source files (not including external libraries)
SRC = $(PRJ).cpp
# where to look for external libraries
EXT =

# include path
INCLUDE := $(foreach dir, $(EXT), -I$(dir))
# c flags
CFLAGS    = -Wall -Wextra -Os -DF_CPU=$(CLK) -mmcu=$(MCU) $(INCLUDE)
# any aditional flags for c++
CPPFLAGS =

# executables
AVRDUDE = avrdude -c $(PRG) -p $(MCU)
OBJCOPY = avr-objcopy
OBJDUMP = avr-objdump
SIZE    = avr-size --format=avr --mcu=$(MCU)
CC      = avr-gcc
STRIP   = avr-strip

# generate list of objects
CFILES    = $(filter %.c, $(SRC))
EXTC     := $(foreach dir, $(EXT), $(wildcard $(dir)/*.c))
CPPFILES  = $(filter %.cpp, $(SRC))
EXTCPP   := $(foreach dir, $(EXT), $(wildcard $(dir)/*.cpp))
OBJ       = $(CFILES:.c=.o) $(EXTC:.c=.o) $(CPPFILES:.cpp=.o) $(EXTCPP:.cpp=.o)

# user targets
# compile all files
all: $(PRJ).hex

# test programmer connectivity
test:
	$(AVRDUDE) -P $(COM) -v

# flash program to mcu
flash: all
	$(AVRDUDE) -U -P $(COM) flash:w:$(PRJ).hex:i

# write fuses to mcu
fuse:
	$(AVRDUDE) -U -P $(COM) lfuse:w:$(LFU):m -U hfuse:w:$(HFU):m

# generate disassembly files for debugging
disasm: $(PRJ).elf
	$(OBJDUMP) -d $(PRJ).elf

# remove compiled files
clean:
	rm -f *.hex *.elf *.o
	$(foreach dir, $(EXT), rm -f $(dir)/*.o;)

# other targets
# objects from c files
.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

# objects from c++ files
.cpp.o:
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

# elf file
$(PRJ).elf: $(OBJ)
	$(CC) $(CFLAGS) -o $(PRJ).elf $(OBJ)
	$(STRIP) -s $(PRJ).elf

# hex file
$(PRJ).hex: $(PRJ).elf
	rm -f $(PRJ).hex
	$(OBJCOPY) -j .text -j .data -O ihex $(PRJ).elf $(PRJ).hex
	$(STRIP) -s $(PRJ).hex
	$(SIZE) $(PRJ).elf
