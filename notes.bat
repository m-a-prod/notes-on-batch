@echo off
:init
cls
set r=set input=999
title notes on batch
set folder=%cd%
set notename= 
if not exist "C:\Users\m_a_p\AppData\Roaming\maprod\notes-on-batch" md "%appdata%\maprod\notes-on-batch"
if not exist "%appdata%\maprod\notes-on-batch\notes" md "%appdata%\maprod\notes-on-batch\notes"
:main
%r%
cls
cd "%appdata%\maprod\notes-on-batch\notes"
echo Main menu
echo.
dir /b
echo.
echo 1. Create note
::echo 2. Edit note
echo 2. Settings
echo.
echo 0. Exit
set /p input=Enter some number or name of the note : 
if "%input%"=="1" goto createnote
if "%input%"=="2" goto settings
if "%input%"=="0" (
    cls
    cd %folder%
    echo Thanks for using!
    :: This message will be displayed only if notes.bat started from shell.
    goto :eof
)
if "%input%"=="sasha" goto sasha
::if %input%==999 goto editnote
if exist "%appdata%\maprod\notes-on-batch\notes\%input%" (
    set notenamenow=%input%
    goto noteview
) else (
    call :error "There is no note with that name"
)
goto main

:noteview
::set /p descriptionnow=<"%appdata%\maprod\notes-on-batch\notes\%notenamenow%"
%r%
cls
echo Note view
echo.
echo Name: %notenamenow%
echo.
echo ENTER. OK
::echo Description: %descriptionnow%
pause>nul
set notenamenow=None
::set descriptionnow=None
goto main

:createnote
%r%
cls
echo Create the note
echo.
echo 1. Note Name: %notename%
::echo 2. Description -^> ^(%noteDescription%^)
echo.
echo 2. Save note
echo 0. Back
set /p input=Type some number : 
if "%input%"=="1" (
    cls
    echo Create the note
    echo.
    set /p notename=1. Note Name: 
) 
if "%input%"=="2" (
    cls
    echo Saving...
    cd "%appdata%\maprod\notes-on-batch\notes"
    echo %noteDescription% >"%notename%"
    goto main
)
if "%input%"=="0" goto main
::if %input%==2 (
::cls
::set /p noteDescription=Type description for the note : 
::)
goto createnote

:editnote
call :error "This feature has not yet been implemented."
goto main

:settings
%r%
cls
echo Settings
echo.
echo 1. About me
echo.
echo 0. Back to main menu
set /p input=Type some number : 
if "%input%"=="1" goto faq
if "%input%"=="0" goto main
goto settings

:faq
cls
echo About me
echo.
echo I am Maxim Adaev - an still studying programmer. This is a project that I coded
echo just for myself to train my programming skills in a language like Batch. I will
echo not deny that some techniques are taken from the social network Say Online, but
echo the idea to make notes on the Batch is mine.
echo.
echo Thanks to Sasha Talk for bringing me to this language.
echo.
echo Good luck to everyone!
echo.
echo ENTER. OK
pause>nul
goto settings

:sasha
call :error "Thank you for introducing me to this truly wonderful programming language."
:: You're welcome
goto main

:error
cls
echo %~1
echo.
echo ENTER. OK
pause>nul
goto :eof