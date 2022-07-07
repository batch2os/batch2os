@echo off
cls
title batch2os
:main
cls
echo [system] checking for system package "logon"...
cd C:\"Program Files"\batch2os\apps\
if NOT EXIST logon goto single-user-mode
echo [system] checking for system package "dashboard"...
if NOT EXIST dashboard goto no-dashboard
echo [system] checking for system package "config"...
if NOT EXIST config goto no-config
echo [system] all required system packages are installed.
echo [system] starting package "logon"...
cd C:\"program files"\batch2os\apps\logon\
call main.bat
exit
:single-user-mode
echo [system] system package "logon" is not installed.
echo [system] single user mode is not available.
echo [system] to resolve, use the command "core sudo install core-packages" in the terminal.
echo [system] press any key to enter the terminal...
pause >nul
cd C:\"Program Files"\batch2os\sys\pkgs\rec\terminal\
echo [system] please wait, initializing terminal...
call terminal.bat
exit
:no-dashboard
echo [system] system package "dashboard" is not installed.
echo [system] single user mode is not available.
echo [system] to resolve, use the command "core sudo install core-packages" in the terminal.
echo [system] press any key to enter the terminal...
pause >nul
cd C:\"Program Files"\batch2os\sys\pkgs\rec\terminal\
echo [system] please wait, initializing terminal...
call terminal.bat
exit
:no-config
echo [system] system package "config" is not installed.
echo [system] to resolve, use the command "core sudo install core-packages" in the terminal.
echo [system] press any key to enter the terminal...
pause >nul
cd C:\"Program Files"\batch2os\sys\pkgs\rec\terminal\
echo [system] please wait, initializing terminal...
call terminal.bat
exit