@echo off
cls
cd %~dp0

echo.____________________________________________________________________
echo.       Running %~0
echo.       This program stores immidiate values in registers, and 
echo.         performs the calculation: 2*(8 + 12)-10
echo.         Expected Exit Code: 30
echo.       Assembling and linking
ml64.exe main.asm /link /SUBSYSTEM:CONSOLE /ENTRY:main /OUT:main.exe

echo.____________________________________________________________________
echo.       Executing Program
main.exe
echo. %%errorlevel%% should be '30', and it is '%errorlevel%'

cd ..
exit /b 0



