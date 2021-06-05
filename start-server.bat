@echo off
cls

set ip_address_string="IPv4 Address"
rem Uncomment the following line when using older versions of Windows without IPv6 support (by removing "rem")
rem set ip_address_string="IP Address"
for /f "usebackq tokens=2 delims=:" %%f in (`ipconfig ^| findstr /c:%ip_address_string%`) do echo Server IP: %%f

:start
TerrariaServer.exe -config serverconfig.txt
@echo.
@echo Restarting server...
@echo.
goto start
