@echo off
cls
cd %~dp0

echo.____________________________________________________________________
echo.       Running %~0
echo.       This program will display "Hello World" and exits, with exit code representing number of bits written.
echo.         Expected Exit Code: 0
echo.       Assembling and linking
ml64.exe main.asm /link /SUBSYSTEM:CONSOLE /ENTRY:main /OUT:main.exe

if %errorlevel% NEQ 0 (
    echo.
    echo Error Code = %errorlevel%
    GOTO END
) else (
    echo.____________________________________________________________________
    echo.       Executing Program
    main.exe
    call echo.       Return value should be '0', and it is '%%ERRORLEVEL%%'
)

:END
cd ..
exit /b 0



