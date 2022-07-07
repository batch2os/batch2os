@echo off
color 60
cls
title batch2os
cd C:\"Program Files"\batch2os\config\
rmdir users >nul
if NOT EXIST users mkdir users && goto create-user
:main
cls
echo #    ###   ####   ###  ##   #
echo #   #   # #      #   # # #  #
echo #   #   # #  ##  #   # #  # #
echo #   #   # #    # #   # #   ##
echo ###  ###   ####   ###  #    #
echo -----------------------------
echo.
echo      Enter your username:
set/p "usertest=> "
cd C:\"Program Files"\batch2os\config\users\
if NOT EXIST %usertest% goto main
echo        Please wait... 
cd C:\"Program Files"\batch2os\apps\dashboard
call main.bat %usertest%
exit
:create-user
cls
echo --Create User-------------------------------------------------------
echo # There are no users on this machine.                              #
echo # Would you like to create a new user using your Windows username? #
echo #                                                                  #
echo # 1: Yes                                                           #
echo # 2: No                                                            #
echo --------------------------------------------------------------------
choice /c 12 /n
if %ERRORLEVEL%==1 goto create-user1
if %ERRORLEVEL%==2 goto launch
goto create-user
:create-user1
cls
echo --Create User-----
echo # Please wait... #
echo ------------------
cd C:\"Program Files"\batch2os\config\users\
mkdir %username%
cd %username%
mkdir files
mkdir apps
mkdir config
cls
echo --Create User-------------
echo # User has been created. #
echo --------------------------
pause >nul
goto main
:launch
cls
echo Please wait...
cd C:\"Program Files"\batch2os\apps\config\users\
call create.bat
exit