# NUS112 Makefile

Makefile for the NUS112 AVR programmer
This is a Makefile for compiling and programming AVR microcontroller projects. It provides convenient targets for compiling, flashing the program to the microcontroller, writing fuses, generating disassembly files, and cleaning the compiled files.
The NUS112 programmer is basically a STK500 programmer, but with many features removed.  

## Requirements
- avr-gcc: AVR GNU C Compiler
- avrdude: AVR Downloader/UploaDEr
- avr-objcopy: AVR Object Copy
- avr-objdump: AVR Object Dump
- avr-size: AVR Size
- avr-strip: AVR Strip

## Configuration
Before using this Makefile, make sure to configure the following variables according to your project's requirements:

- `PRJ`: The name of your project.
- `MCU`: AVR microcontroller model.
- `CLK`: MCU clock frequency.
- `PRG`: AVR programmer model.
- `COM`: Programmer port.
- `LFU`: Low fuse value (refer to your microcontroller datasheet or http://www.engbedded.com/fusecalc/).
- `HFU`: High fuse value (refer to your microcontroller datasheet or http://www.engbedded.com/fusecalc/).
- `SRC`: List of program source files (excluding external libraries).
- `EXT`: Path(s) to look for external libraries.

## Targets
- `all`: Compile all files and generate the hex file.
- `test`: Test programmer connectivity.
- `flash`: Flash the program to the microcontroller.
- `fuse`: Write fuses to the microcontroller.
- `disasm`: Generate disassembly files for debugging.
- `clean`: Remove compiled files.

## How to Use
1. Set the configuration variables in the Makefile.
2. Open a terminal and navigate to the project directory.
3. Use the following commands:
   - `make all`: Compile all files and generate the hex file.
   - `make test`: Test programmer connectivity.
   - `make flash`: Flash the program to the microcontroller.
   - `make fuse`: Write fuses to the microcontroller.
   - `make disasm`: Generate disassembly files for debugging.
   - `make clean`: Remove compiled files.

Note: Make sure to have the required tools installed and the programmer connected properly before using the Makefile.
