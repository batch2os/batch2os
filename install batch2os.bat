@echo off
cls
title batch2os Setup Wizard
:main
cls
color 3f
echo __Setup Wizard_______________________________
echo ! Ready to install batch2os? You will need: !
echo ! 1. An internet connection                 !
echo ! 2. Git version control software           !
echo !                                           !
echo ! 1: Install                                !
echo ! 2: Update (not yet supported)             !
echo ! 3: Uninstall                              !
echo ________________________________batch2os SE__
echo.
echo __Hint__________________________________________________________________
echo ! Press the number key that corresponds to the option you want to use. !
echo ! Text with "#:" at the start are options.                             !
echo !                                                                      !
echo ! Hint 2                                                               !
echo ! If you push a number key and the system beeps, it it not an option.  !
echo ________________________________________________________________________
choice /c 1 /n
if %ERRORLEVEL%==1 goto install
if %ERRORLEVEL%==2 goto update
if %ERRORLEVEL%==3 goto uninstall
:install
cls
echo __Setup Wizard_______________________________
echo ! Step 1 of 3: Choose batch2os version      !
echo !                                           !
echo ! Choose which version you want:            !
echo ! 1: Full version                           !
echo ! 2: Minimal version (Not yet supported)    !
echo _____________________________________________
choice /c 1 /n
if %ERRORLEVEL%==1 goto install-full
:install-full
cd C:\"Program Files"\
if EXIST batch2os rmdir batch2os /s /q
cls
echo __Setup Wizard_______________________________
echo ! Step 2 of 3: Install batch2os             !
echo !                                           !
echo ! Currently downloading from batch2os repo  !
echo _____________________________________________
echo.
echo __Log__
cd C:\"Program Files"\
git clone https://github.com/batch2os/batch2os-full-data.git
rename batch2os-full-data batch2os
takeown /f batch2os /r /d y
icacls "C:\Program Files\batch2os" /grant %USERNAME%:(OI)(CI)F /T
cd batch2os
rmdir .git /s /q
del readme.md
cls
echo __Setup Wizard___________________
echo ! Step 3 of 3: Finalizing Setup !
echo _________________________________
cd C:\

set SCRIPT="%temp%\batch2os\%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\batch2os.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\Program Files\batch2os\bootloader.bat" >> %SCRIPT%
echo oLink.IconLocation = "C:\Program Files\batch2os\icon.ico" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

cd C:\Program Files\batch2os
mkdir config
cd config
mkdir users
cls
echo __Setup Wizard_______________________________
echo ! batch2os has been successfully installed. !
echo _____________________________________________
timeout /t 5 >nul
exit
