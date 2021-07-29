# nus112_makefile
Make file for the NUS112 AVR programmer   
The NUS112 programmer is basically a STK500 programmer, but a lot less stable.  
I highly recommend to only use the ISP protocol for programming the AVR, as the Zip broke some pins of the micro controller.   
# Build tasks:  
* `build`
Builds the program , strip and upload the hex file using avrdude.  
Uses `cflags` options.  
* `build-testing`
Builds the program and strip the hex file.  
Uses `cflags_testing` options.  
* `upload`
Uploads the hex file using avrdude.  
* `disasm`
Shows the assembly code from the object file ( run `build` or `build-testing` before it ).  

# Make file options
* `source` main source file, without the \*.c at end.  
* `freq` frequency of micro controller.
* `port` the port that the programmer is connected to ( use `ls /dev/` to find )
* `programmer` programmer type, leave it to `stk500` for this programmer. ( avrdude's manual includes list of programmers )
* `arch` architecture specified for avrdude ( avrdude's manual includes list of architectures )
* `arch_gcc` architecture specified for avr-gcc ( avr-gcc's manual includes list of architectures )
* `cflags` compiler flags for `build` task
* `cflags_testing` compiler flags for `build-testing` task
