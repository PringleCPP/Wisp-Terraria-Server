@echo off
title Wisp Terraria Server
echo Terraria V1.4.2.3

echo.

echo 1              start-server
echo 2              start-steam-private-server
echo 3              start-steam-public-server

echo.

:choice
set /P q=Choose startup method: 
if /I "%q%" EQU "1" goto :startserv
if /I "%q%" EQU "2" goto :steampriv
if /I "%q%" EQU "3" goto :steampub
goto choice

:startserv
cls

set ip_address_string="IPv4 Address"
for /f "usebackq tokens=2 delims=:" %%f in (`ipconfig ^| findstr /c:%ip_address_string%`) do echo Server IP: %%f

:start1
TerrariaServer.exe -config serverconfig.txt
@echo.
@echo Restarting server...
@echo.
goto start1

:steampriv
cls

set ip_address_string="IPv4 Address"
for /f "usebackq tokens=2 delims=:" %%f in (`ipconfig ^| findstr /c:%ip_address_string%`) do echo Server IP: %%f

:start2
TerrariaServer.exe -steam -lobby private -config serverconfig.txt -experimental
@echo.
@echo Restarting server...
@echo.
goto start2

:steampub
cls

set ip_address_string="IPv4 Address"
for /f "usebackq tokens=2 delims=:" %%f in (`ipconfig ^| findstr /c:%ip_address_string%`) do echo Server IP: %%f

:start3
TerrariaServer.exe -steam -lobby friends -config serverconfig.txt
@echo.
@echo Restarting server...
@echo.
goto start3


pause
exit
