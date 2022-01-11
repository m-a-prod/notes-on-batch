@echo off
:init
cls
set r=set input=999
title notes on batch
if not exist "C:\Users\m_a_p\AppData\Roaming\maprod\notes-on-batch" md "%appdata%\maprod\notes-on-batch"
cd "%appdata%\maprod\notes-on-batch\"
if not exist "%appdata%\maprod\notes-on-batch\notes" md "%appdata%\maprod\notes-on-batch\notes"
goto main

:main
%r%
cd "%appdata%\maprod\notes-on-batch\notes"
cls
echo Main menu
echo.
dir /b
echo.
echo 1. Create note
::echo 2. Edit note
echo 2. Settings
echo.
echo 0. Exit
set /p input=Enter some number or name of the note: 
if %input% == 2 goto settings
if %input% == 1 goto createnote
::if %input% == 999999 goto editnote
if exist %appdata%\maprod\notes-on-batch\notes\%input% (
set notenamenow=%input%
goto noteview
)

:noteview
::set %descriptionnow%=<%appdata%\maprod\notes-on-batch\notes\%notenamenow%
cls

echo Name:
echo %notenamenow%
::echo Description:
::echo %descriptionnow%
pause>nul
set notenamenow=None 
::set descriptionnow=None
goto main

:createnote
%r%
cls
echo Create the note
echo.
echo 1. Note Name -^> ^(%notename%^)
::echo 2. Description -^> ^(%noteDescription%^)
echo.
echo 2. Save note
echo 0. Back
set /p input=Type some number : 
if %input%==0 goto main
if %input%==1 (
cls
set /p notename=Type name for the note : 
) 
::if %input%==2 (
::cls
::set /p noteDescription=Type description for the note : 
::)
if %input%==2 (
cls
echo Saving...
cd "%appdata%\maprod\notes-on-batch\notes"
echo %noteDescription% >%notename%
goto main
)
goto createnote

:editnote
cls
echo We haven't implemented this feature yet.
echo Sorry :^(
pause>nul
goto main

:settings
%r%
cls
echo Settings
echo 1. About me
echo.
echo 0. Back to main menu
set /p input=Type some number : 
if %input% == 1 goto faq
if %input% == 0 goto main

:faq
cls
echo About me
echo I am Maxim Adaev, a programmer, still studying. This is a project that I coded
echo just for myself to train my programming skills
echo in a language like Batch. I will not deny that some techniques are taken from
echo such a social network as Say Online. But the idea is mine (to make notes on the butch).
echo.
echo Thanks to Sasha Talk (he initiated me into this language)
echo.
echo Good luck to everyone!
pause>nul
goto settings

