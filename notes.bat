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
echo 2. Edit note
echo 3. Settings
echo.
echo 0. Exit
set /p input=Enter some number or name of the note: 
if %input% == 3 goto settings
if %input% == 1 goto createnote
if %input% == 2 goto editnote
if %input% == 0 exit

:createnote
cls
echo We haven't implemented this feature yet.
echo Sorry :^(
pause>nul
goto main

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

