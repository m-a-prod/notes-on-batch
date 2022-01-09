@echo off
:init
cls
set r=set var=999
title notes on batch
if not exist "%appdata%\maprod\notes-on-batch\checklocal.maprod" (
	goto start 
	)
set /p checklocal=<"%appdata%\maprod\notes-on-batch\checklocal.maprod"
if %checklocal% ==1 goto main
if %checklocal% ==2 goto main

:start
cls
echo Hello! Thank you for downloading my program, I am very grateful to you!
echo Enjoy your use! To let me know about the error, I created a repository
echo on GitHub. https://github.com/maxim-adaev-production/notes
pause
goto selectstorage

:selectstorage
cls
if exist "%appdata%\maprod\notes-on-batch\checklocal.maprod" (
set checklocal=1
goto main
) else (
cls
echo Select the storage method.
echo.
echo 1. Locally ^(faster, but only on this computer^)
echo 2. On a WebDAV disk ^(slower, but you'll be able to use your notes
echo on other computers^)^(soon^)
choice /c 12 /n
if %errorlevel% == 1 goto initlocalstorage
if %errorlevel% == 2 goto webdavset
)

:initlocalstorage
cls
echo Creating a folder for storing notes
md "%appdata%\maprod\notes-on-batch\"
cd "%appdata%\maprod\notes-on-batch\"
echo 01>checklocal.maprod
goto main

:webdavset
cls
echo We haven't implemented this feature yet.
echo Sorry :^(
echo.
echo 0. Back
choice /c 0 /n
if %errorlevel% == 1 goto selectstorage

:main
%r%
cls
if %checklocal%==1 (
	set checklocal=3
	md "%appdata%\maprod\notes-on-batch\notes">nul
	cd "%appdata%\maprod\notes-on-batch\notes"
cls
	)
:: if %checklocal%==2 cd "%disk%\maprod\notes-on-batch\"
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
set /p var=Input :
if %var% == 3 goto settings
if %var% == 1 goto createnote
if %var% == 2 goto editnote
if %var% == 0 exit

:settings
cls
echo Settings

echo 1. About me
::2. Стереть все заметки и удалить следы пребывания
::этой программы с хостинга.
::3.Отвязать хост.(не смогу наверное реализовать) //net stop (maybe)

echo 0. Back to main menu
choice /c 01 /n
if %errorlevel% == 1 goto main
if %errorlevel% == 2 goto faq

:faq
cls
echo About me
echo I am Maxim Adaev, a programmer, still studying. This is a project that I wrote
echo purely for myself to train my programming skills
echo in a language like Batch. I will not deny that some techniques are taken from
echo such a social network as Say Online. But the idea is mine (to make notes on the butch).
echo.
echo Gratitude to Sasha Talk(he initiated me into this language)
echo.
echo Good luck to everyone!
pause
goto settings

:createnote
cls
echo We haven't implemented this feature yet.
echo Sorry :^(
echo.
echo 0. Back
choice /c 0 /n
if %errorlevel% == 1 goto main



:editnote
cls
echo We haven't implemented this feature yet.
echo Sorry :^(
echo.
echo 0. Back
choice /c 0 /n
if %errorlevel% == 1 goto main