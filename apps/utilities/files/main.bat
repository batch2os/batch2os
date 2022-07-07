@echo off
cls
set b2ousername=%1%
title batch2os
cd C:\"Program Files"\batch2os\config\users\%b2ousername%\files\
:main
color b0
cls
echo --Files--
echo.
dir /b
echo 1: Up one directory
echo 2: Copy
echo 3: Move
echo 4: Rename
echo 5: New folder
echo 6: Delete
echo 7: Exit
set/p "option="
if "%option%"=="1" goto backone
if "%option%"=="2" goto copy
if "%option%"=="3" goto move
if "%option%"=="4" goto rename
if "%option%"=="5" goto newfolder
if "%option%"=="6" goto delete
if "%option%"=="7" exit
if NOT EXIST "%option%" goto main
cd %option%
goto main
:backone
cd ..
goto main
:copy
cls
echo --Copy--
echo Are you copying:
echo 1: A file
echo 2: A folder
echo 3: Cancel
choice /c 123 /n
if %ERRORLEVEL%==1 goto copyfile
if %ERRORLEVEL%==2 goto copyfoldera
if %ERRORLEVEL%==3 goto main
:copyfile
cls
echo --Copy--
set/p "option=Enter the name of the file you want to copy: "
if NOT EXIST "%option%" goto copy
:copyfile2
set/p "option2=Enter the path of the folder you want to copy to (Hint: Your files are located at C:\Program Files\batch2os\config\users\%b2osuername%\files\): "
copy "%option%" "%option2%"
goto main
:copyfoldera
cls
echo Operation failed -- Error code: FEATURE_NOT_AVAILABLE
timeout /t 3 >nul
goto main
:copyfolder
cls
echo --Copy--
set/p "option=Enter the name of the folder you want to copy: "
:copyfolder2
set/p "option2=Enter the path of the folder you want to copy to (Hint: Your files are located at C:\Program Files\batch2os\config\users\%b2osuername%\files\): "
if EXIST %temp%\batch2os\filemanager rmdir %temp%\batch2os\filemanager /s
mkdir %temp%\batch2os\filemanager
mkdir %temp%\batch2os\filemanager\"%option%"
copy "%option%" %temp%\batch2os\filemanager\"%option%"\
set option3="%cd%"
cd %temp%\batch2os\filemanager\"%option%"\
7z a ..\%option%.7z
exit
:move
cls
echo --Move--
set/p "option=Enter the name of the item you want to move: "
if NOT EXIST "%option%" goto main
:move2
set/p "option2=Enter the path of the folder you want to move to (Hint: Your files are located at C:\Program Files\batch2os\config\users\%b2osuername%\files\): "
if NOT EXIST "%option2%" goto move
if EXIST "%option2%"\"%option%" (
cls
echo Operation failed - File already exists
pause >nul
goto main
)
move "%option%" "%option2%"\
cls
echo --Move--
echo Operation completed!
timeout /t 3 >nul
goto main
:rename
cls
echo --Rename--
set/p "option=Enter the name of the item you want to rename: "
if NOT EXIST "%option%" goto main
:rename2
set/p "option2=Enter the new name: "
if EXIST "%option2%" (
cls
echo Operation failed - Item already exists
timeout /t 3 >nul
goto main
)
rename "%option%" "%option2%"
cls
echo --Rename--
echo Operation completed!
timeout /t 3 >nul
goto main
:newfolder
cls
echo --New Folder--
set/p "option=Enter the name of the folder: "
mkdir "%option%"
cls
echo --New folder--
echo Operation completed!
timeout /t 3 >nul
goto main
:delete
cls
echo --Delete--
set/p "option=Enter the name of the item you want to delete: "
if NOT EXIST "%option%" (
cls
echo Operation failed - Item doesn't exist
timeout /t 3 >nul
goto main
)
del "%option%"
if EXIST "%option%" rmdir "%option%" /s /q
cls
echo --Delete--
echo Operation completed!
timeout /t 3 >nul
goto main