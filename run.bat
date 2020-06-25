@echo off
set pathToMASMFolder="C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Tools\MSVC\14.26.28801\bin\Hostx64\x64"
set oldPath=%PATH%
path  %pathToMASMFolder%;%PATH%

:LOOP
echo.
echo.
echo.____________________________________________________________________
echo Please enter the tutorial number to compile and execute it.
set /p id=Exit/cls/Tutorial Number: 
if "%id%" == "Exit" goto END
if "%id%" == "exit" goto END
if "%id%" == "Cls" goto CLEAR_SCREEN
if "%id%" == "cls" goto CLEAR_SCREEN
if "%id%" == "Cmd" goto COMMAND
if "%id%" == "cmd" goto COMMAND

call Example_%id%\build.cmd
if "%errorlevel%" NEQ "0" (
    cls
    echo Cannot run .\Example_%id%\build.cmd
)
goto LOOP


:CLEAR_SCREEN
cls
goto LOOP

:COMMAND
set /p "command=CMD: "
call %command%
goto COMMAND

:END
path %oldPath%
exit /b 0
