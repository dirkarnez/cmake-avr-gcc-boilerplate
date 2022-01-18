REM run as Administrator

@echo off
cd %~dp0build\app

for /f "tokens=*" %%a in (
    '%~dp0tools\serial-locate.exe --vid=2341 --pid=0043 --usb=true'
) do (
    set comport=%%a
)

%~dp0tools\arduino-1.8.19\hardware\tools\avr\bin\avrdude.exe -C"%~dp0tools\arduino-1.8.19\hardware\tools\avr\etc\avrdude.conf" -v -v -v -patmega328p -carduino -P\\.\%comport% -b115200 -D -Uflash:w:"toggle-led-atmega328p.hex":i

pause