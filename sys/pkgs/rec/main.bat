@echo off
cls
title batch2os - recovery mode
:main
cls
if EXIST C:\"Program Files"\batch2os\sys\pkgs\rec\config\devModeEnabled echo +++Recovery Mode+++++++++
if NOT EXIST C:\"Program Files"\batch2os\sys\pkgs\rec\config\devModeEnabled echo +++ecovery Mode++++++++++
echo + 1: Backup and Restore +
echo + 2: Reboot             +
echo +++++++++++++++++++++++++
choice /c 1234 /n
if %ERRORLEVEL%==1 goto br
if %ERRORLEVEL%==2 call C:\"Program Files"\batch2os\bootloader.bat
if %ERRORLEVEL%==3 mkdir C:\"Program Files"\batch2os\sys\pkgs\rec\config\devModeEnabled && goto main
if %ERRORLEVEL%==4 goto uninstall
:br
goto main
:uninstall
cls
color 04
echo ++Uninstall batch2os+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo + !! Are you sure you want to uninstall batch2os? !!                                +
echo + If you are sure you want to uninstall batch2os, press N, W, A, S, and D in order. +
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
choice /c N /n
choice /c W /n
choice /c A /n
choice /c S /n
choice /c D /n
cls
echo Uninstalling batch2os...
cd %temp%
echo @echo off > uninstall.bat
echo cls >> uninstall.bat
echo echo Uninstalling batch2os... >> uninstall.bat
echo rmdir C:\Program Files\batch2os /s /q >> uninstall.bat
echo exit >> uninstall.bat
start uninstall.bat
exit