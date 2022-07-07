@echo off
@set b2ousername=%1%
title batch2os
color 8f
:main
cls
color 8f
echo --Settings------------
echo # 1: Data Management #
echo # 2: Users           #
echo # 3: System          #
echo # 4: Back            #
if EXIST C:\"Program Files"\batch2os\sys\pkgs\rec\config\devModeEnabled echo # 5: Developers      #
echo ----------------------
choice /c 12345 /n
if %ERRORLEVEL%==1 goto data-management
if %ERRORLEVEL%==2 goto user-management
if %ERRORLEVEL%==3 goto system-management
if %ERRORLEVEL%==4 goto main2
if %ERRORLEVEL%==5 goto dev-manager
:data-management
cls
echo --Data Management---------
echo # 1: Manage applications #
echo # 2: Back                #
echo --------------------------
choice /c 12 /n
if %ERRORLEVEL%==1 goto manage-applications
if %ERRORLEVEL%==2 goto main
:user-management
cls
echo Starting User Management...
cd C:\"Program Files"\batch2os\apps\config\users\
call main.bat %b2ousername%
goto main
:system-management
cls
color 8f
echo --System-----------------
echo # 1: System Transfer    #
echo # 2: Backup and Restore #
echo # 3: Initialize         #
echo # 4: Troubleshooting    #
echo # 5: System Update      #
echo # 6: Back               #
echo -------------------------
choice /c 123456 /n
if %ERRORLEVEL%==1 goto system-transfer
if %ERRORLEVEL%==2 goto backup-and-restore
if %ERRORLEVEL%==3 goto initialize
if %ERRORLEVEL%==4 goto troubleshooting
if %ERRORLEVEL%==5 goto update
if %ERRORLEVEL%==6 goto main
:system-transfer
cls
echo --Enter Recovery Mode-----------------------------------------------------------
echo # Using the batch2os System Transfer Utility requires you enter Recovery Mode. #
echo # Note that this mode can make significant modifications to your system.       #
echo #                                                                              #
echo # Enter Recovery Mode?                                                         #
echo # 1: Yes                                                                       #
echo # 2: No                                                                        #
echo --------------------------------------------------------------------------------
choice /c 12 /n
if %ERRORLEVEL%==1 call C:\"Program Files"\batch2os\sys\pkgs\rec\apps\transfer\main.bat
goto system-management
:backup-and-restore
cls
echo Please wait...
cd C:\"Program Files"\batch2os\apps\config\backup-and-restore\
call main.bat %b2ousername%
goto system-management
:initialize
cls
color 04
echo --Initialize----------------------------------------------------------------------------
echo # Initializing will erase EVERYTHING on your system.                                   #
echo # Are you REALLY sure you want to initialize?                                          #
echo # If you are sure you want to initialize type the phrase                               #
echo # "I am 100 percent sure I want to initialize." into the field indicated by the arrow. #
echo # Otherwise type anything else.                                                        #
echo ----------------------------------------------------------------------------------------
echo.
set/p "option=-->"
if "%option%"=="I am 100 percent sure I want to initialize." goto initialize2
goto system-management
:troubleshooting
cls
echo --Troubleshooting---------------------
echo # Error code 1: Program not finished #
echo --------------------------------------
pause
goto system-management
:initialize2
cls
echo Initializing...
cd C:\"Program Files"\batch2os\
rmdir config /s /q
mkdir config
mkdir config\users\
cls
echo --Initialize------------------------------
echo # Completed. Press any key to restart... #
echo ------------------------------------------
pause >nul
cd C:\"Program Files"\batch2os\
call bootloader.bat
exit
:main2
cls
call C:\"Program Files"\batch2os\apps\dashboard\main.bat %b2ousername%
exit
:dev-manager
if NOT EXIST C:\"Program Files"\batch2os\sys\pkgs\rec\config\devModeEnabled goto main
cls
color f8
echo --Developer Options-------
echo # 1: Setup               #
echo # 2: batch2os developers #
echo # 3: Back                #
echo --------------------------
choice /c 123 /n
if %ERRORLEVEL%==1 goto dev-manager-setup
if %ERRORLEVEL%==2 goto batch2osdev
if %ERRORLEVEL%==3 goto main
:dev-manager-setup
cls
echo --Setup------------------------------------
echo # This will launch the Setup application. #
echo # 1: Launch Setup                         #
echo # 2: Back                                 #
echo -------------------------------------------
choice /c 12 /n
if %ERRORLEVEL%==1 goto launchsetup-dev
if %ERRORLEVEL%==2 goto dev-manager
:batch2osdev
start https://sites.google.com/view/batch2os-developers
goto dev-manager
:launchsetup-dev
cls
echo Please wait...
cd C:\"Program Files"\batch2os\config
mkdir setup-not-complete
cd ..\apps\config\setup
call main.bat
exit