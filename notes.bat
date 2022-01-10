@echo off
:init
cls
set r=set var=999
title notes on batch
if exist "%appdata%\maprod\notes-on-batch\logininfo\" (goto fucerr) else (goto start)

:fucerr 
cls
echo It does not work. Sorry...
pause>nul
goto webdavset

:webdavconnect
cls
if exist "%appdata%\maprod\notes-on-batch\logininfo\yandex.maprod" (
set /p user=<"%appdata%\maprod\notes-on-batch\logininfo\user.maprod"
set /p password=<"%appdata%\maprod\notes-on-batch\logininfo\password.maprod"
set /p letdisk=<"%appdata%\maprod\notes-on-batch\logininfo\letdisk.maprod"
cls
echo Connecting to the server...
net use %letdisk%: https://webdav.yandex.ru "%password%" /USER:%user% >nul 2>&1
echo OK
pause>nul
)

:start
cls
echo Hello! Thank you for downloading my program, I am very grateful to you!
echo Enjoy your use! To let me know about the error, I created a repository
echo on GitHub. https://github.com/maxim-adaev-production/notes
pause>nul
goto webdavset

:webdavset
cls
echo Which host do you want to connect to?
echo 1. Yandex Disk.
echo 2. Other variant.
echo.
echo TIP. If you want to see your favorite hosting in this menu,
echo create an issue on the github of this project.
echo.
echo 3. Open the github page of this project.
choice /c 123 /n
if %errorlevel% == 1 goto fucerr
if %errorlevel% == 2 goto fucerr
if %errorlevel% == 3 start https://github.com/maxim-adaev-production/notes-on-batch
::yandexset
::otherset
:yandexset
cls
md "%appdata%\maprod\notes-on-batch\">nul
cd "%appdata%\maprod\notes-on-batch\"
cls
echo Configuring connection to Yandex Disk.
echo. 
set /p user=Enter the user name :
md "%appdata%\maprod\notes-on-batch\logininfo"
cd "%appdata%\maprod\notes-on-batch\logininfo"
echo %user% >user.maprod
cls
echo Configuring connection to Yandex Disk.
echo.
echo The password is stored on your computer.
echo We do not share your data with anyone!
echo.
set /p password=Enter the password :
echo %password% >password.maprod
set user=0
set password=0
echo yandexset >yandex.maprod
cls
echo Select a disk letter:
echo O
echo S
echo T
echo U
echo V
echo W
echo X
echo Y
echo Z
set /p letdisk=Type disk letter: 
::If the user entered the drive letter incorrectly, the algorithm will automatically correct this error
if %letdisk%==o set letdisk=O
if %letdisk%==s set letdisk=S
if %letdisk%==t set letdisk=T
if %letdisk%==u set letdisk=U
if %letdisk%==v set letdisk=V
if %letdisk%==w set letdisk=W
if %letdisk%==x set letdisk=X
if %letdisk%==y set letdisk=Y
if %letdisk%==z set letdisk=Z
echo %letdisk% >letdisk.maprod
goto init

:main
%r%
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
set /p var=Enter some number or name of the note: 
if %var% == 3 goto settings
if %var% == 1 goto createnote
if %var% == 2 goto editnote
if %var% == 0 exit

:settings
cls
echo Settings
echo 1. About me
echo 0. Back to main menu
choice /c 01 /n
if %errorlevel% == 1 goto main
if %errorlevel% == 2 goto faq

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