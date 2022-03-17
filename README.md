# nus112_makefile
Make file for the NUS112 AVR programmer   
The NUS112 programmer is basically a STK500 programmer, but a lot less stable.  
I highly recommend to only use the ISP protocol for programming the AVR, as the Zip broke some pins of the micro controller.   

`all`:    compiles the source code  
`test`:   tests the isp connection to the mcu  
`flash`:  writes compiled hex file to the mcu's flash memory  
`fuse`:   writes the fuse bytes to the MCU  
`disasm`: disassembles the code for debugging  
`clean`:  removes all .hex, .elf, and .o files in the source code and library directories  
