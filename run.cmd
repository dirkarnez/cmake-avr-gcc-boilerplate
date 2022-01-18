REM run as Administrator

@echo off
set DOWNLOADS_DIR=%USERPROFILE%\Downloads

SET PATH=%DOWNLOADS_DIR%;%DOWNLOADS_DIR%\avr-gcc-11.1.0-x64-windows; ^
%DOWNLOADS_DIR%\avr-gcc-11.1.0-x64-windows\avr\bin; ^
%DOWNLOADS_DIR%\avr-gcc-11.1.0-x64-windows\bin; ^
%DOWNLOADS_DIR%\arduino-1.8.19\hardware\tools\avr\etc; ^
%DOWNLOADS_DIR%\arduino-1.8.19\hardware\tools\avr\bin; ^
%DOWNLOADS_DIR%\cmake-3.22.0-rc1-windows-x86_64\bin;

cd %~dp0build\app

for /f "tokens=*" %%a in (
    'serial-locate.exe --vid=2341 --pid=0043 --usb=true'
) do (
    set comport=%%a
)

avrdude.exe -C"avrdude.conf" -v -v -v -patmega328p -carduino -P\\.\%comport% -b115200 -D -Uflash:w:"toggle-led-atmega328p.hex":i

pause
