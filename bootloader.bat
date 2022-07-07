@echo off
color 07
cls
title batch2os - bootloader
echo [system] welcome to batch2os, starting system...
echo [drivers] initializing display driver "batbox"...
if NOT EXIST C:\"Program Files"\batch2os\sys\drivers\disp\batbox.exe echo [drivers] driver "batbox" corrupted or not installed.
if EXIST C:\"Program Files"\batch2os\sys\drivers\disp\batbox.exe C:\"Program Files"\batch2os\sys\drivers\disp\batbox.exe /f 0
if NOT EXIST C:\"Program Files"\batch2os\sys\drivers\disp\batbox.exe echo [driver warning] batch2os system window will not be able to function properly.
timeout /t 3 /NOBREAK >nul
echo [drivers] initialized driver "batbox".
choice /t 3 /c AN /n /m "[system] press A to enter advanced boot options... " /d N
if %ERRORLEVEL%==1 goto advanced
echo [system] starting batch2os...
cd C:\"Program Files"\batch2os\
call kernel.bat
exit
:advanced
cls
echo --Advanced Boot Options-------------------------------------------------------------------
echo # Welcome to Advanced Boot! Here you can enter modes typically used for troubleshooting. #
echo #                                                                                        #
echo # 1: Recovery mode                                                                       #
echo # 2: Shut down                                                                           #
echo ------------------------------------------------------------------------------------------
choice /c 12 /n
if %ERRORLEVEL%==1 goto recover
if %ERRORLEVEL%==2 exit
:recover
cls
cd C:\Program Files\batch2os\sys\pkgs\rec\
call main.bat
exit