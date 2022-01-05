@echo off
:init
title notes on batch

:start
cls
echo Hello! Thank you for downloading my program, I am very grateful to you!
echo Enjoy your use! To let me know about the error, I created a repository
echo on GitHub. https://github.com/maxim-adaev-production/notes
pause
goto selectstorage

:selectstorage
cls
echo Select the storage method.
echo.
echo 1. Locally (faster, but only on this computer)
echo 2. On a WebDAV disk (slower, but you'll be able to use your notes
echo on other computers)
choice /c 12 /n
if %errorlevel% == 1 goto localset
if %errorlevel% == 2 goto webdavset

:localset
cls
echo We haven't implemented this feature yet.
echo Sorry :(
echo.
echo 0. Back
choice /c 0 /n
if %errorlevel% == 1 goto selectstorage

:webdavset
cls
echo We haven't implemented this feature yet.
echo Sorry :(
echo.
echo 0. Back
choice /c 0 /n
if %errorlevel% == 1 goto selectstorage 