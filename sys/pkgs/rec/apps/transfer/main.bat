@echo off
cls
title batch2os - Recovery mode
:main
cls
color 8f
echo ++System Transfer++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo + Welcome to the System Transfer app! This app allows you to transfer data from this batch2os machine to another. +
echo + Which device is this?                                                                                           +
echo + 1: Source System (Transfer to another device)                                                                   +
echo + 2: Target System (Transfer to this device)                                                                      +
echo + 3: Cancel                                                                                                       +
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
choice /c 123 /n
if %ERRORLEVEL%==1 goto Source
if %ERRORLEVEL%==2 goto Target
if %ERRORLEVEL%==3 goto Cancel
:Source
call C:\"Program Files"\batch2os\sys\pkgs\rec\apps\transfer\transferto.bat
goto main
:Target
call C:\"Program Files"\batch2os\sys\pkgs\rec\apps\transfer\transferfrom.bat
goto main
:Cancel
call C:\"Program Files"\batch2os\bootloader.bat
exit