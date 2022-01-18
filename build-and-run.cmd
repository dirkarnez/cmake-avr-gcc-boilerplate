REM run as Administrator
@echo off
cd /d %~dp0

set PROGRAM_NAME=hoho

set DOWNLOADS_DIR=%USERPROFILE%\Downloads

set PATH=%DOWNLOADS_DIR%^
%DOWNLOADS_DIR%\avr-gcc-11.1.0-x64-windows;^
%DOWNLOADS_DIR%\avr-gcc-11.1.0-x64-windows\avr\bin;^
%DOWNLOADS_DIR%\avr-gcc-11.1.0-x64-windows\bin;^
%DOWNLOADS_DIR%\arduino-1.8.19\hardware\tools\avr\bin;^
%DOWNLOADS_DIR%\cmake-3.22.0-rc1-windows-x86_64\bin;

set AVR_FIND_ROOT_PATH=%DOWNLOADS_DIR%\avr-gcc-11.1.0-x64-windows\avr

if exist build (
    rd /s /q build
    echo Deleted old build!
)

cmake.exe -G"MinGW Makefiles" -DCMAKE_MAKE_PROGRAM="%DOWNLOADS_DIR%/avr-gcc-11.1.0-x64-windows/bin/make.exe" -DCMAKE_TOOLCHAIN_FILE=."/toolchain/generic-gcc-avr.cmake" -B./build

cd build
make

cd app

for /f "tokens=*" %%a in (
    '%DOWNLOADS_DIR%\serial-locate.exe --vid=2341 --pid=0043 --usb=true'
) do (
    set comport=%%a
)

%DOWNLOADS_DIR%\arduino-1.8.19\hardware\tools\avr\bin\avrdude.exe -C"%DOWNLOADS_DIR%\arduino-1.8.19\hardware\tools\avr\etc\avrdude.conf" -v -v -v -patmega328p -carduino -P\\.\%comport% -b115200 -D -Uflash:w:"%PROGRAM_NAME%_atmega328p.hex":i

pause