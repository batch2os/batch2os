@echo off
cls
title batch2os Recovery Application
:main
cls
echo ++Backup and restore+++++++++++++++++++++++++++++
echo + Welcome to the batch2os backup application!   +
echo +                                               +
echo + 1: Make a backup copy of your batch2os system +
echo + 2: Restore from a backup copy of batch2os     +
echo + 3: Delete a backup copy of batch2os           +
echo + 4: Exit                                       +
echo +++++++++++++++++++++++++++++++++++++++++++++++++
choice /c 1234 /n
if %ERRORLEVEL%==1 goto backup
if %ERRORLEVEL%==2 goto restore
if %ERRORLEVEL%==3 goto delete
if %ERRORLEVEL%==4 goto exit
:backup
cls
echo ++Back up batch2os data++++++++++++++++++
echo + What do you want to name your backup? +
echo + Remember, no spaces are allowed.      +