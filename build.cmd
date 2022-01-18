REM run as Administrator
@echo off
cd /d %~dp0
SET PATH=%~dp0tools\avr-gcc-11.1.0-x64-windows;%~dp0tools\avr-gcc-11.1.0-x64-windows\avr\bin;%~dp0tools\avr-gcc-11.1.0-x64-windows\bin;%~dp0tools\arduino-1.8.19\hardware\tools\avr\bin;%~dp0tools\cmake-3.22.0-rc1-windows-x86_64\bin;
set AVR_FIND_ROOT_PATH=%~dp0tools\avr-gcc-11.1.0-x64-windows\avr

if exist build (
    rd /s /q build
    echo Deleted old build!
)

cmake.exe -G"MinGW Makefiles" -DCMAKE_MAKE_PROGRAM="%~dp0tools/avr-gcc-11.1.0-x64-windows/bin/make.exe" -DCMAKE_TOOLCHAIN_FILE=."/toolchain/generic-gcc-avr.cmake" -B./build

cd build
make
REM make upload_toggle-led
pause