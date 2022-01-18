REM run as Administrator
@echo off
cd /d %~dp0

set DOWNLOADS_DIR=%USERPROFILE%\Downloads

SET PATH=%DOWNLOADS_DIR%\avr-gcc-11.1.0-x64-windows; ^
%DOWNLOADS_DIR%\avr-gcc-11.1.0-x64-windows\avr\bin; ^
%DOWNLOADS_DIR%\avr-gcc-11.1.0-x64-windows\bin; ^
%DOWNLOADS_DIR%\arduino-1.8.19\hardware\tools\avr\bin; ^
%DOWNLOADS_DIR%\cmake-3.22.0-rc1-windows-x86_64\bin;

set AVR_FIND_ROOT_PATH=%DOWNLOADS_DIR%\avr-gcc-11.1.0-x64-windows\avr

if exist build (
    rd /s /q build
    echo Deleted old build!
)

cmake.exe -G"MinGW Makefiles" -DCMAKE_MAKE_PROGRAM="%DOWNLOADS_DIR%/avr-gcc-11.1.0-x64-windows/bin/make.exe" -DCMAKE_TOOLCHAIN_FILE=."/toolchain/generic-gcc-avr.cmake" -B./build

cd build
make
REM make upload_toggle-led
pause
