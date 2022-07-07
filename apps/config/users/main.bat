@echo off
@set b2ousername=%1%
title batch2os
:main
cls
echo --User Management------
echo # 1: Create user      #
echo # 2: Rename user      #
echo # 3: Delete user      #
echo # 4: Back             #
echo -----------------------
choice /c 1234 /n
if %ERRORLEVEL%==1 goto create-user
if %ERRORLEVEL%==2 goto rename-user
if %ERRORLEVEL%==3 goto delete-user
if %ERRORLEVEL%==4 goto main2
goto main
:create-user
cls
echo --Create user--------------
echo # Enter the new username: #
echo ---------------------------
set/p "usertest=>"
cd C:\"Program Files"\batch2os\config\users\
mkdir "%usertest%"
cd %usertest%
mkdir apps
mkdir config
mkdir files
echo --Create user------
echo # Completed!      #
echo -------------------
pause >nul
goto main
:rename-user
cls
echo --Rename user-------------------------------------
echo # Enter the name of the user you want to rename: #
echo --------------------------------------------------
set/p "usertest=>"
cd C:\"Program Files"\batch2os\config\users\
if NOT EXIST %usertest% goto main
cls
echo --Rename user----------
echo # Enter the new name: #
echo -----------------------
set/p "usertest2=>"
rename %usertest% %usertest2%
cls
echo --Rename user------
echo # Completed!      #
echo -------------------
pause >nul
goto main
:delete-user
cls
echo --Delete user-------------------------------------
echo # Enter the name of the user you want to delete: #
echo --------------------------------------------------
set/p "usertest="
cd C:\"Program Files"\batch2os\config\users\
if NOT EXIST %usertest% goto main
rmdir %usertest% /s /q
goto main
:main2
cls
call C:\"Program Files"\batch2os\apps\config\main.bat
exit