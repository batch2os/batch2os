@echo off
@set b2ousername=%1%
cls
title batch2os - Shut down
:main
cls
cd C:\Program Files\batch2os\apps\dashboard
echo --Shut down-----
echo # 1: Shut down #
echo # 2: Restart   #
echo # 3: Log off   #
echo # 4: Back      #
echo ----------------
choice /c 1234 /n
if %ERRORLEVEL%==1 exit
if %ERRORLEVEL%==2 goto restart
if %ERRORLEVEL%==3 goto logoff
if %ERRORLEVEL%==4 call main.bat %b2ousername%
:restart
cls
cd C:\Program Files\batch2os
call bootloader.bat
exit
:logoff
cls
cd C:\Program Files\batch2os\apps\logon
call main.bat
exit