@echo off
cls
cd %~dp0

echo.____________________________________________________________________
echo.       Running %~0
echo.       This program sets RCX to '10' to indicate an exit code of '10'
echo.       Assembling and linking
ml64.exe main.asm /link /SUBSYSTEM:CONSOLE /ENTRY:main /OUT:main.exe

echo.____________________________________________________________________
echo.       Executing Program
main.exe
echo. %%errorlevel%% should be '10', and it is '%errorlevel%'

cd ..
exit /b 0