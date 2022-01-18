cmake-avr-gcc-boilerplate
=========================
Modified from [mkleemann/cmake-avr: cmake toolchain for AVR](https://github.com/mkleemann/cmake-avr)

### Intended for
- atmega328p

### TODOs
- [x] add `#define` for atmega328p
- [x] fix include paths for future use (portable)
- [ ] run `AVR_UPLOADTOOL` and proper settings directly inside `CMakeLists.txt` instead of `run.cmd`
- [ ] populate `avr_helper` with common code
  - [ ] My AVR seems does not work with normal mode timer

### Tools
- [AVR-GCC 11.1.0 for Windows 32 and 64 bit – Zak's Electronics Blog ~*](https://blog.zakkemble.net/avr-gcc-builds/)
  - used in this boilerplate
- [AVRDUDESS – A GUI for AVRDUDE – Zak's Electronics Blog ~*](https://blog.zakkemble.net/avrdudess-a-gui-for-avrdude/)
  - as a reference

### Modules
- [mkleemann/spi: AVR module to use SPI, e.g. for connecting an MCP2515 (see CAN module)](https://github.com/mkleemann/spi)
- [mkleemann/adc: AVR module for analog/digital converter](https://github.com/mkleemann/adc)

### Reference
- [avr-gcc & avrdude makefile tutorial | Compile C & upload to AVR board (mac) | [ATmega328p Ep.1 en] - YouTube](https://www.youtube.com/watch?v=iKqLbbyPydI)
